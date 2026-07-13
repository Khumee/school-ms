const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { DateTime } = require('luxon');

// GET /attendance/employees
router.get('/attendance/employees', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const dateStr = req.query.date || DateTime.now().toISODate();
        
        // Fetch active employees (excluding inactive ones)
        const [employees] = await db.execute(
            "SELECT * FROM employees WHERE tenant_id = ? AND status != 'inactive' ORDER BY name ASC",
            [tenantId]
        );
        
        // Fetch today's attendance
        const [attendance] = await db.execute(
            'SELECT employee_id, status, arrival_time, is_late FROM attendance_employees WHERE tenant_id = ? AND date = ?',
            [tenantId, dateStr]
        );
        
        // Map attendance
        const attendanceMap = {};
        const attendanceDetailsMap = {};
        attendance.forEach(a => {
            attendanceMap[a.employee_id] = a.status;
            attendanceDetailsMap[a.employee_id] = {
                arrival_time: a.arrival_time,
                is_late: a.is_late
            };
        });

        // Check if this date is a Sunday
        const isSunday = DateTime.fromISO(dateStr).weekday === 7;

        // Fetch holiday details for today if any
        const [[holiday]] = await db.execute(
            'SELECT * FROM holidays WHERE tenant_id = ? AND date = ? LIMIT 1',
            [tenantId, dateStr]
        );

        // Fetch all holidays for managing
        const [holidaysList] = await db.execute(
            'SELECT * FROM holidays WHERE tenant_id = ? ORDER BY date ASC',
            [tenantId]
        );

        // Fetch current tenant to get the settings
        const [[tenantRow]] = await db.execute(
            'SELECT school_start_time, school_end_time, late_threshold_minutes, late_days_deduction_trigger FROM tenants WHERE id = ?',
            [tenantId]
        );
        
        res.render('attendance_employees', { 
            employees, 
            dateStr, 
            attendanceMap,
            attendanceDetailsMap,
            isSunday,
            holiday: holiday || null,
            holidaysList,
            tenantSettings: tenantRow || { school_start_time: '08:00:00', school_end_time: '14:00:00', late_threshold_minutes: 15, late_days_deduction_trigger: 4 }
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading employee attendance.');
    }
});

// POST /attendance/settings
router.post('/attendance/settings', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { school_start_time, school_end_time, late_threshold_minutes, late_days_deduction_trigger, redirectDate } = req.body;
        
        await db.execute(
            `UPDATE tenants 
             SET school_start_time = ?, school_end_time = ?, late_threshold_minutes = ?, late_days_deduction_trigger = ? 
             WHERE id = ?`,
            [
                school_start_time || '08:00:00', 
                school_end_time || '14:00:00', 
                parseInt(late_threshold_minutes || 0, 10), 
                parseInt(late_days_deduction_trigger || 4, 10), 
                tenantId
            ]
        );
        
        res.redirect(`/attendance/employees?date=${redirectDate || ''}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating school settings.');
    }
});

// POST /attendance/employees
router.post('/attendance/employees', isAuthenticated, async (req, res) => {
    const { date, attendance } = req.body; // attendance is an object: { employee_id: status }
    try {
        const tenantId = req.tenant.id;
        const dateStr = date || DateTime.now().toISODate();
        
        if (attendance) {
            console.log('Attendance payload:', attendance);
            for (const [key, status] of Object.entries(attendance)) {
                const empId = key.replace('emp_', '');
                // Check if employee exists in employees table
                const [empRows] = await db.execute('SELECT id, name FROM employees WHERE id = ?', [empId]);
                if (empRows.length === 0) {
                    throw new Error(`Employee ID "${empId}" (raw key: "${key}") does not exist in the database. Current Tenant ID: ${tenantId}. Payload keys: ${Object.keys(attendance).join(', ')}`);
                }

                // Delete existing first
                await db.execute(
                    'DELETE FROM attendance_employees WHERE employee_id = ? AND date = ? AND tenant_id = ?',
                    [empId, dateStr, tenantId]
                );
                
                if (status) {
                    let arrivalTime = null;
                    let isLate = 0;

                    if (status === 'present') {
                        const hour = req.body[`arrival_hour_emp_${empId}`];
                        const minute = req.body[`arrival_minute_emp_${empId}`];
                        const ampm = req.body[`arrival_ampm_emp_${empId}`];

                        if (hour !== undefined && minute !== undefined && ampm !== undefined) {
                            let hourNum = parseInt(hour, 10);
                            const minNum = parseInt(minute, 10);
                            if (ampm === 'PM' && hourNum < 12) {
                                hourNum += 12;
                            } else if (ampm === 'AM' && hourNum === 12) {
                                hourNum = 0;
                            }
                            const formattedHour = String(hourNum).padStart(2, '0');
                            const formattedMin = String(minNum).padStart(2, '0');
                            arrivalTime = `${formattedHour}:${formattedMin}:00`;

                            // Get school settings
                            const [[tenantSettings]] = await db.execute(
                                'SELECT school_start_time, late_threshold_minutes FROM tenants WHERE id = ?',
                                [tenantId]
                            );
                            if (tenantSettings && tenantSettings.school_start_time) {
                                const [startHour, startMin] = tenantSettings.school_start_time.split(':').map(Number);
                                const threshold = parseInt(tenantSettings.late_threshold_minutes || 0, 10);

                                const startTotalMin = startHour * 60 + startMin;
                                const limitTotalMin = startTotalMin + threshold;
                                const arrivalTotalMin = hourNum * 60 + minNum;

                                if (arrivalTotalMin > limitTotalMin) {
                                    isLate = 1;
                                }
                            }
                        }
                    }

                    await db.execute(
                        `INSERT INTO attendance_employees (tenant_id, employee_id, date, status, arrival_time, is_late, marked_by)
                         VALUES (?, ?, ?, ?, ?, ?, ?)`,
                        [tenantId, empId, dateStr, status, arrivalTime, isLate, req.session.userId || null]
                    );
                }
            }
        }
        res.redirect(`/attendance/employees?date=${dateStr}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving attendance: ' + err.message);
    }
});

// POST /attendance/holidays/add
router.post('/attendance/holidays/add', isAuthenticated, async (req, res) => {
    const { date, name, redirectDate } = req.body;
    try {
        await db.execute(
            'INSERT INTO holidays (tenant_id, date, name) VALUES (?, ?, ?)',
            [req.tenant.id, date, name]
        );
        res.redirect(`/attendance/employees?date=${redirectDate || date}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding holiday.');
    }
});

// POST /attendance/holidays/delete/:id
router.post('/attendance/holidays/delete/:id', isAuthenticated, async (req, res) => {
    const { redirectDate } = req.body;
    try {
        await db.execute(
            'DELETE FROM holidays WHERE id = ? AND tenant_id = ?',
            [req.params.id, req.tenant.id]
        );
        res.redirect(`/attendance/employees?date=${redirectDate}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting holiday.');
    }
});

// GET /attendance/employees/:id/history
router.get('/attendance/employees/:id/history', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const employeeId = req.params.id;
        
        const [[employee]] = await db.execute(
            'SELECT name, designation FROM employees WHERE id = ? AND tenant_id = ?',
            [employeeId, tenantId]
        );
        if (!employee) {
            return res.status(404).json({ error: 'Employee not found' });
        }

        const [history] = await db.execute(
            'SELECT date, status FROM attendance_employees WHERE employee_id = ? AND tenant_id = ? ORDER BY date DESC LIMIT 60',
            [employeeId, tenantId]
        );

        res.json({
            employee,
            history
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Error fetching attendance history.' });
    }
});

// GET /attendance/employees/summary
router.get('/attendance/employees/summary', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const filterType = req.query.filterType || 'month';
        
        let startDate, endDate;
        const today = DateTime.now().toISODate();
        
        if (filterType === 'today') {
            startDate = today;
            endDate = today;
        } else if (filterType === 'week') {
            startDate = DateTime.now().startOf('week').toISODate(); // Monday
            endDate = DateTime.now().endOf('week').toISODate(); // Sunday
        } else if (filterType === 'custom') {
            startDate = req.query.startDate || DateTime.now().startOf('month').toISODate();
            endDate = req.query.endDate || today;
        } else {
            // Default to 'month'
            startDate = DateTime.now().startOf('month').toISODate();
            endDate = DateTime.now().endOf('month').toISODate();
        }
        
        const [summary] = await db.execute(
            `SELECT 
                e.id as employee_id, 
                e.name, 
                e.designation,
                COUNT(CASE WHEN ae.status = 'present' THEN 1 END) as presents,
                COUNT(CASE WHEN ae.status = 'absent' THEN 1 END) as absents,
                COUNT(CASE WHEN ae.status = 'leave' THEN 1 END) as leaves
             FROM employees e
             LEFT JOIN attendance_employees ae ON e.id = ae.employee_id AND ae.date BETWEEN ? AND ? AND ae.tenant_id = ?
             WHERE e.tenant_id = ? AND e.status != 'inactive'
             GROUP BY e.id, e.name, e.designation
             ORDER BY e.name ASC`,
            [startDate, endDate, tenantId, tenantId]
        );
        
        res.render('attendance_summary', {
            summary,
            filterType,
            startDate,
            endDate,
            today
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading attendance summary.');
    }
});

module.exports = router;
