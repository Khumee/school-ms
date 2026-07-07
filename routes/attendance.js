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
            'SELECT employee_id, status FROM attendance_employees WHERE tenant_id = ? AND date = ?',
            [tenantId, dateStr]
        );
        
        // Map attendance: employee_id -> status
        const attendanceMap = {};
        attendance.forEach(a => {
            attendanceMap[a.employee_id] = a.status;
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
        
        res.render('attendance_employees', { 
            employees, 
            dateStr, 
            attendanceMap,
            isSunday,
            holiday: holiday || null,
            holidaysList
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading employee attendance.');
    }
});

// POST /attendance/employees
router.post('/attendance/employees', isAuthenticated, async (req, res) => {
    const { date, attendance } = req.body; // attendance is an object: { employee_id: status }
    try {
        const tenantId = req.tenant.id;
        const dateStr = date || DateTime.now().toISODate();
        
        if (attendance) {
            for (const [empId, status] of Object.entries(attendance)) {
                // Delete existing first
                await db.execute(
                    'DELETE FROM attendance_employees WHERE employee_id = ? AND date = ? AND tenant_id = ?',
                    [empId, dateStr, tenantId]
                );
                
                if (status) {
                    await db.execute(
                        `INSERT INTO attendance_employees (tenant_id, employee_id, date, status, marked_by)
                         VALUES (?, ?, ?, ?, ?)`,
                        [tenantId, empId, dateStr, status, req.session.userId || null]
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

module.exports = router;
