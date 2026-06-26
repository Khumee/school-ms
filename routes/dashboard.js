const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { DateTime } = require('luxon');

router.get('/', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;

        // 1. Fetch Student Metrics
        const [[{ total_students }]] = await db.execute('SELECT COUNT(*) as total_students FROM students WHERE tenant_id = ?', [tenantId]);
        const [[{ support_students }]] = await db.execute('SELECT COUNT(*) as support_students FROM students WHERE tenant_id = ? AND has_concession = 1', [tenantId]);
        const [[{ paying_students }]] = await db.execute('SELECT COUNT(*) as paying_students FROM students WHERE tenant_id = ? AND has_concession = 0', [tenantId]);

        // 2. Fetch New Admissions and Hifz Students Metrics
        const [[{ new_admissions }]] = await db.execute(
            'SELECT COUNT(*) as new_admissions FROM students WHERE tenant_id = ? AND (YEAR(date_of_admission) = 2026 OR date_of_admission IS NULL)',
            [tenantId]
        );
        // 2b. Fetch Employee and Donor metrics
        const [[{ total_employees }]] = await db.execute(
            "SELECT COUNT(*) as total_employees FROM employees WHERE tenant_id = ? AND status != 'inactive'",
            [tenantId]
        );

        let total_donors = 0;
        if (req.tenant && req.tenant.enable_donations_module) {
            const [[{ count }]] = await db.execute(
                "SELECT COUNT(*) as count FROM donors WHERE tenant_id = ?",
                [tenantId]
            );
            total_donors = count;
        }

        // 3. Fetch Monthly Financial Summaries for 2026
        const monthsData = [];
        const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        
        let carryForward = 213069.00; // Historic carry-forward from Excel
        let totalIncomeAllTime = 0;
        let totalExpenseAllTime = 0;

        for (let m = 1; m <= 12; m++) {
            // Fee Collection
            const [[{ fees_collected }]] = await db.execute(
                'SELECT COALESCE(SUM(amount_paid), 0) as fees_collected FROM fee_payments WHERE tenant_id = ? AND month = ? AND year = 2026',
                [tenantId, m]
            );
            
            // Donation Collection
            const [[{ donations_collected }]] = await db.execute(
                'SELECT COALESCE(SUM(amount), 0) as donations_collected FROM donations WHERE tenant_id = ? AND MONTH(date) = ? AND YEAR(date) = 2026',
                [tenantId, m]
            );

            // Rent Expenses
            const [[{ rent_expense }]] = await db.execute(
                "SELECT COALESCE(SUM(amount), 0) as rent_expense FROM expenses WHERE tenant_id = ? AND category = 'rent' AND MONTH(date) = ? AND YEAR(date) = 2026",
                [tenantId, m]
            );

            // Salaries paid
            const [[{ salaries_expense }]] = await db.execute(
                'SELECT COALESCE(SUM(basic_salary + bonus), 0) as salaries_expense FROM salaries WHERE tenant_id = ? AND month = ? AND year = 2026',
                [tenantId, m]
            );

            // Utility Bills
            const [[{ utility_expense }]] = await db.execute(
                "SELECT COALESCE(SUM(amount), 0) as utility_expense FROM expenses WHERE tenant_id = ? AND category = 'utility' AND MONTH(date) = ? AND YEAR(date) = 2026",
                [tenantId, m]
            );

            // Office Expenses
            const [[{ office_expense }]] = await db.execute(
                "SELECT COALESCE(SUM(amount), 0) as office_expense FROM expenses WHERE tenant_id = ? AND category = 'office' AND MONTH(date) = ? AND YEAR(date) = 2026",
                [tenantId, m]
            );

            // Other Expenses
            const [[{ other_expense }]] = await db.execute(
                "SELECT COALESCE(SUM(amount), 0) as other_expense FROM expenses WHERE tenant_id = ? AND category = 'other' AND MONTH(date) = ? AND YEAR(date) = 2026",
                [tenantId, m]
            );

            const monthlyIncome = parseFloat(fees_collected) + parseFloat(donations_collected);
            const monthlyExpense = parseFloat(rent_expense) + parseFloat(salaries_expense) + parseFloat(utility_expense) + parseFloat(office_expense) + parseFloat(other_expense);
            const netBalance = monthlyIncome - monthlyExpense;

            monthsData.push({
                num: m,
                name: monthNames[m - 1],
                fees: parseFloat(fees_collected),
                donations: parseFloat(donations_collected),
                income: monthlyIncome,
                rent: parseFloat(rent_expense),
                salaries: parseFloat(salaries_expense),
                utilities: parseFloat(utility_expense),
                office: parseFloat(office_expense),
                other: parseFloat(other_expense),
                expense: monthlyExpense,
                balance: netBalance
            });

            totalIncomeAllTime += monthlyIncome;
            totalExpenseAllTime += monthlyExpense;
        }

        const currentBalance = carryForward + totalIncomeAllTime - totalExpenseAllTime;

        res.render('dashboard', {
            username: req.session.username,
            role: req.session.role,
            total_students,
            support_students,
            paying_students,
            new_admissions,
            monthsData,
            carryForward,
            totalIncomeAllTime,
            totalExpenseAllTime,
            currentBalance,
            total_employees,
            total_donors
        });
    } catch (err) {
        console.error('Dashboard Error:', err);
        res.status(500).send('Error loading dashboard statistics.');
    }
});

module.exports = router;
