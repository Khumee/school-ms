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
        
        res.render('attendance_employees', { employees, dateStr, attendanceMap });
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
                        [tenantId, empId, dateStr, status, req.session.userId]
                    );
                }
            }
        }
        res.redirect(`/attendance/employees?date=${dateStr}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving attendance.');
    }
});

module.exports = router;
