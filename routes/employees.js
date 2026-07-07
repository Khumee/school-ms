const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');

// GET /employees - list
router.get('/employees', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { role, status, search } = req.query;
        
        let queryStr = 'SELECT * FROM employees WHERE tenant_id = ?';
        const params = [tenantId];
        
        if (role) {
            queryStr += ' AND role = ?';
            params.push(role);
        }
        if (status) {
            queryStr += ' AND status = ?';
            params.push(status);
        }
        if (search) {
            queryStr += ' AND (name LIKE ? OR designation LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        
        queryStr += ' ORDER BY name ASC';
        
        const [employees] = await db.execute(queryStr, params);
        res.render('employees_list', { employees, role, status, search });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading employees.');
    }
});

// GET /employees/view/:id - profile + salary history + attendance stats
router.get('/employees/view/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [employees] = await db.execute(
            'SELECT * FROM employees WHERE id = ? AND tenant_id = ? LIMIT 1',
            [req.params.id, tenantId]
        );
        if (employees.length === 0) return res.status(404).send('Employee not found.');
        
        const employee = employees[0];
        
        const [salaries] = await db.execute(
            'SELECT * FROM salaries WHERE employee_id = ? AND tenant_id = ? ORDER BY year DESC, month DESC',
            [req.params.id, tenantId]
        );
        
        const [attendanceStats] = await db.execute(
            'SELECT status, COUNT(*) as count FROM attendance_employees WHERE employee_id = ? AND tenant_id = ? GROUP BY status',
            [req.params.id, tenantId]
        );

        const totalPaid = salaries.reduce((sum, s) => sum + parseFloat(s.basic_salary) + parseFloat(s.bonus || 0), 0);
        
        res.render('employee_view', { employee, salaries, attendanceStats, totalPaid });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading employee profile.');
    }
});

// GET /employees/add - form
router.get('/employees/add', isAuthenticated, (req, res) => {
    res.render('employee_add', { error: null });
});

// POST /employees/add - save
router.post('/employees/add', isAuthenticated, async (req, res) => {
    const {
        name, designation, role, status, date_of_joining, date_of_leaving, default_salary,
        email, phone, cnic_number, address, gender, qualification,
        previous_experience_years, bank_account_info
    } = req.body;
    
    try {
        const tenantId = req.tenant.id;
        
        await db.execute(
            `INSERT INTO employees (
                name, designation, role, status, date_of_joining, date_of_leaving, default_salary,
                email, phone, cnic_number, address, gender, qualification,
                previous_experience_years, bank_account_info, tenant_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                name, designation, role || 'teacher', status || 'on_payroll',
                date_of_joining || null, date_of_leaving || null, default_salary ? parseFloat(default_salary) : 0.00,
                email || null, phone || null, cnic_number || null, address || null,
                gender || 'male', qualification || null,
                previous_experience_years ? parseInt(previous_experience_years) : 0,
                bank_account_info || null, tenantId
            ]
        );
        
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding employee.');
    }
});

// GET /employees/edit/:id - form
router.get('/employees/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [employees] = await db.execute(
            'SELECT * FROM employees WHERE id = ? AND tenant_id = ? LIMIT 1',
            [req.params.id, tenantId]
        );
        if (employees.length === 0) return res.status(404).send('Employee not found.');
        
        res.render('employee_edit', { employee: employees[0], error: null });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading edit form.');
    }
});

// POST /employees/edit/:id - update
router.post('/employees/edit/:id', isAuthenticated, async (req, res) => {
    const {
        name, designation, role, status, date_of_joining, date_of_leaving, default_salary,
        email, phone, cnic_number, address, gender, qualification,
        previous_experience_years, bank_account_info
    } = req.body;
    
    try {
        const tenantId = req.tenant.id;
        
        await db.execute(
            `UPDATE employees SET 
                name = ?, designation = ?, role = ?, status = ?, date_of_joining = ?, date_of_leaving = ?, 
                default_salary = ?, email = ?, phone = ?, cnic_number = ?, 
                address = ?, gender = ?, qualification = ?, previous_experience_years = ?, 
                bank_account_info = ?
             WHERE id = ? AND tenant_id = ?`,
            [
                name, designation, role, status, date_of_joining || null, date_of_leaving || null,
                default_salary ? parseFloat(default_salary) : 0.00,
                email || null, phone || null, cnic_number || null, address || null,
                gender || 'male', qualification || null,
                previous_experience_years ? parseInt(previous_experience_years) : 0,
                bank_account_info || null, req.params.id, tenantId
            ]
        );
        
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating employee.');
    }
});

// POST /employees/delete/:id - delete
router.post('/employees/delete/:id', isAuthenticated, async (req, res) => {
    try {
        await db.execute('DELETE FROM employees WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect('/employees');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting employee.');
    }
});

module.exports = router;
