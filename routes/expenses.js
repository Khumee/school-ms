const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

// GET /expenses - list and form
router.get('/expenses', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { category, month, year } = req.query;
        
        let queryStr = 'SELECT * FROM expenses WHERE tenant_id = ?';
        const params = [tenantId];
        
        if (category) {
            queryStr += ' AND category = ?';
            params.push(category);
        }
        if (month) {
            queryStr += ' AND MONTH(date) = ?';
            params.push(month);
        }
        if (year) {
            queryStr += ' AND YEAR(date) = ?';
            params.push(year);
        } else {
            queryStr += ' AND YEAR(date) = 2026';
        }
        
        queryStr += ' ORDER BY date DESC';
        
        const [expenses] = await db.execute(queryStr, params);
        res.render('expenses', { expenses, category, month, year });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading expenses.');
    }
});

// POST /expenses/add - save expense
router.post('/expenses/add', isAuthenticated, async (req, res) => {
    const { date, item, amount, category, description } = req.body;
    try {
        await db.execute(
            `INSERT INTO expenses (tenant_id, date, item, amount, category, description)
             VALUES (?, ?, ?, ?, ?, ?)`,
            [req.tenant.id, date || new Date(), item, parseFloat(amount), category || 'other', description || null]
        );
        res.redirect('/expenses');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error logging expense.');
    }
});

// GET /salaries - list payroll
router.get('/salaries', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [employees] = await db.execute(
            "SELECT * FROM employees WHERE tenant_id = ? AND status = 'on_payroll' ORDER BY name ASC",
            [tenantId]
        );
        
        // Fetch payroll records for 2026
        const [salaries] = await db.execute(
            `SELECT s.*, e.name as employee_name, e.designation 
             FROM salaries s 
             JOIN employees e ON s.employee_id = e.id 
             WHERE s.tenant_id = ? AND s.year = 2026 
             ORDER BY s.month DESC, e.name ASC`,
            [tenantId]
        );
        
        res.render('salaries', { employees, salaries });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading salaries ledger.');
    }
});

// POST /salaries/pay - execute payout
router.post('/salaries/pay', isAuthenticated, async (req, res) => {
    const { employee_id, month, year, basic_salary, bonus, bonus_description, paid_date } = req.body;
    try {
        const tenantId = req.tenant.id;
        
        // Check if already paid
        const [existing] = await db.execute(
            'SELECT id FROM salaries WHERE employee_id = ? AND month = ? AND year = ? AND tenant_id = ?',
            [employee_id, month, year, tenantId]
        );
        
        if (existing.length > 0) {
            await db.execute(
                `UPDATE salaries 
                 SET basic_salary = ?, bonus = ?, bonus_description = ?, paid_date = ? 
                 WHERE id = ?`,
                [parseFloat(basic_salary), parseFloat(bonus || 0), bonus_description || null, paid_date || new Date(), existing[0].id]
            );
        } else {
            await db.execute(
                `INSERT INTO salaries (tenant_id, employee_id, month, year, basic_salary, bonus, bonus_description, paid_date)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [tenantId, employee_id, month, year, parseFloat(basic_salary), parseFloat(bonus || 0), bonus_description || null, paid_date || new Date()]
            );
        }
        res.redirect('/salaries');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording salary payment.');
    }
});

// GET /salaries/slip/:id - generate PDF salary slip
router.get('/salaries/slip/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [rows] = await db.execute(
            `SELECT s.*, e.name as employee_name, e.designation
             FROM salaries s
             JOIN employees e ON s.employee_id = e.id
             WHERE s.id = ? AND s.tenant_id = ?`,
            [req.params.id, tenantId]
        );
        if (rows.length === 0) return res.status(404).send('Salary record not found.');
        const salary = rows[0];

        const tenantForPdf = { ...req.tenant, logo_url: resolvePublicAsset(req.tenant.logo_url) };
        const totalPaid = parseFloat(salary.basic_salary) + parseFloat(salary.bonus);

        renderPdf(res, {
            templateName: 'salary_slip',
            data: {
                tenant: tenantForPdf,
                employee: { name: salary.employee_name, designation: salary.designation },
                salary,
                monthName: MONTH_NAMES[salary.month - 1],
                paidDateFormatted: new Date(salary.paid_date).toLocaleDateString('en-GB'),
                totalPaid
            },
            fileBaseName: `salary_slip_${salary.id}`,
            downloadName: `salary-slip-${salary.employee_name}-${MONTH_NAMES[salary.month - 1]}-${salary.year}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating salary slip.');
    }
});

module.exports = router;
