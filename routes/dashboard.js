const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated, hasPermission } = require('../middleware/auth');
const { DateTime } = require('luxon');

router.get('/', isAuthenticated, async (req, res) => {
    // If user lacks Dashboard permission, redirect to their first available module
    if (req.session.roleName !== 'Admin' && (!req.session.permissions || !req.session.permissions.includes('Dashboard'))) {
        const perms = req.session.permissions || [];
        if (perms.includes('Students')) return res.redirect('/students');
        if (perms.includes('Attendance')) return res.redirect('/attendance/students');
        if (perms.includes('Fees')) return res.redirect('/fees/ledger');
        if (perms.includes('Ledgers')) return res.redirect('/expenses');
        if (perms.includes('Employees')) return res.redirect('/employees');
        return res.redirect('/change-password');
    }

    try {
        const tenantId = req.tenant.id;

        const [[{ total_students }]] = await db.execute('SELECT COUNT(*) as total_students FROM students WHERE tenant_id = ? AND status = "active"', [tenantId]);
        const [[{ support_students }]] = await db.execute('SELECT COUNT(*) as support_students FROM students s JOIN classes c ON s.class_id = c.id WHERE s.tenant_id = ? AND s.has_concession = 1 AND s.custom_monthly_fee > 0 AND s.custom_monthly_fee < c.default_monthly_fee AND s.status = "active"', [tenantId]);
        const [[{ paying_students }]] = await db.execute('SELECT COUNT(*) as paying_students FROM students WHERE tenant_id = ? AND (has_concession = 0 OR custom_monthly_fee <= 0 OR custom_monthly_fee IS NULL) AND status = "active"', [tenantId]);
        const [[{ full_waiver_students }]] = await db.execute('SELECT COUNT(*) as full_waiver_students FROM students s JOIN classes c ON s.class_id = c.id WHERE s.tenant_id = ? AND s.has_concession = 1 AND s.custom_monthly_fee >= c.default_monthly_fee AND s.status = "active"', [tenantId]);

        // 2. Fetch New Admissions and Expected Fee
        const [[{ new_admissions }]] = await db.execute(
            'SELECT COUNT(*) as new_admissions FROM students WHERE tenant_id = ? AND status = "active" AND (YEAR(date_of_admission) = 2026 OR date_of_admission IS NULL)',
            [tenantId]
        );

        const [[{ expected_fee_current_month }]] = await db.execute(
            `SELECT COALESCE(SUM(
                GREATEST(0, c.default_monthly_fee - IF(s.has_concession = 1, COALESCE(s.custom_monthly_fee, 0), 0))
             ), 0) as expected_fee_current_month
             FROM students s 
             JOIN classes c ON s.class_id = c.id 
             WHERE s.tenant_id = ? AND s.status = 'active'`,
            [tenantId]
        );
        // 2b. Fetch Employee and Donor metrics
        const [[{ total_employees }]] = await db.execute(
            "SELECT COUNT(*) as total_employees FROM employees WHERE tenant_id = ? AND status != 'inactive'",
            [tenantId]
        );

        let hifz_students = 0;
        const [[{ count: hifzCount }]] = await db.execute(
            'SELECT COUNT(s.id) as count FROM students s JOIN classes c ON s.class_id = c.id WHERE s.tenant_id = ? AND s.status = "active" AND c.is_hifz_class = 1',
            [tenantId]
        );
        hifz_students = hifzCount;

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
        
        let carryForward = req.tenant.subdomain === 'mis' ? 213069.00 : 0.00; // Historic carry-forward from Excel for legacy school only
        let totalIncomeAllTime = 0;
        let totalExpenseAllTime = 0;

        for (let m = 1; m <= 12; m++) {
            // Fee Collection (Cash Basis - actually received in month m)
            const [[{ fees_collected_cash }]] = await db.execute(
                'SELECT (COALESCE(SUM(amount_paid), 0) + COALESCE(SUM(additional_fee), 0)) as fees_collected_cash FROM fee_payments WHERE tenant_id = ? AND MONTH(payment_date) = ? AND YEAR(payment_date) = 2026',
                [tenantId, m]
            );
            
            // Fee Collection (Accrual Basis - fees for month m)
            const [[{ fees_collected_accrual }]] = await db.execute(
                'SELECT (COALESCE(SUM(amount_paid), 0) + COALESCE(SUM(additional_fee), 0)) as fees_collected_accrual FROM fee_payments WHERE tenant_id = ? AND month = ? AND year = 2026',
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

            const monthlyIncome = parseFloat(fees_collected_cash) + parseFloat(donations_collected);
            const monthlyExpense = parseFloat(rent_expense) + parseFloat(salaries_expense) + parseFloat(utility_expense) + parseFloat(office_expense) + parseFloat(other_expense);
            const netBalance = monthlyIncome - monthlyExpense;

            monthsData.push({
                num: m,
                name: monthNames[m - 1],
                fees: parseFloat(fees_collected_cash), // fees received in this month (cash basis)
                fees_accrual: parseFloat(fees_collected_accrual), // fees target for this month (accrual basis)
                donations: parseFloat(donations_collected),
                income: monthlyIncome, // cash basis income
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
        const activeMonth = req.query.month ? parseInt(req.query.month) : (new Date().getMonth() + 1);

        res.render('dashboard', {
            username: req.session.username,
            role: req.session.role,
            total_students,
            support_students,
            paying_students,
            full_waiver_students,
            new_admissions,
            hifz_students,
            monthsData,
            carryForward,
            totalIncomeAllTime,
            totalExpenseAllTime,
            currentBalance,
            total_employees,
            total_donors,
            expected_fee_current_month,
            activeMonth
        });
    } catch (err) {
        console.error('Dashboard Error:', err);
        res.status(500).send('Error loading dashboard statistics.');
    }
});

router.get('/income-transactions', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { month, year, type } = req.query; // type: 'all', 'all_fees', 'regular_fees', 'other_fees', 'donations'

        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);

        // Fetch fee transactions for the month (Cash Basis)
        const [fees] = await db.execute(
            `SELECT fp.id, fp.payment_date, fp.amount_paid, fp.additional_fee_description, fp.month as fee_month, fp.year as fee_year,
                    s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND MONTH(fp.payment_date) = ? AND YEAR(fp.payment_date) = ?`,
            [tenantId, activeMonth, activeYear]
        );

        // Fetch donations for the month
        let donations = [];
        if (req.tenant.enable_donations_module) {
            const [dn] = await db.execute(
                `SELECT d.id, d.date as payment_date, d.amount, d.fund_type, d.payment_method,
                        dr.name as donor_name, dr.phone
                 FROM donations d
                 JOIN donors dr ON d.donor_id = dr.id
                 WHERE d.tenant_id = ? AND MONTH(d.date) = ? AND YEAR(d.date) = ?`,
                [tenantId, activeMonth, activeYear]
            );
            donations = dn;
        }

        // Format data
        let transactions = [];
        
        fees.forEach(f => {
            const isRegular = (f.fee_month >= 1 && f.fee_month <= 12) || f.fee_month === 0;
            const feeTypeStr = f.fee_month === 0 ? 'Admission Fee' : (isRegular ? `Monthly Fee` : (f.additional_fee_description || 'Other Fee'));
            
            transactions.push({
                id: f.id,
                date: new Date(f.payment_date),
                amount: parseFloat(f.amount_paid),
                type: isRegular ? 'regular_fees' : 'other_fees',
                typeLabel: feeTypeStr,
                description: `${f.student_name} (${f.reg_no}) - ${f.class_name || 'Unassigned'}`,
                source: 'Fee',
                receiptUrl: `/fees/receipt/${f.id}`
            });
        });

        donations.forEach(d => {
            transactions.push({
                id: d.id,
                date: new Date(d.payment_date),
                amount: parseFloat(d.amount),
                type: 'donations',
                typeLabel: 'Donation',
                description: `${d.donor_name} - ${d.fund_type} via ${d.payment_method}`,
                source: 'Donation',
                receiptUrl: `/donations/receipt/${d.id}`
            });
        });

        // Filter
        if (type && type !== 'all') {
            if (type === 'all_fees') {
                transactions = transactions.filter(t => t.source === 'Fee');
            } else {
                transactions = transactions.filter(t => t.type === type);
            }
        }

        // Sort by date DESC
        transactions.sort((a, b) => b.date - a.date);

        const totalAmount = transactions.reduce((sum, t) => sum + t.amount, 0);

        const monthsList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        const activeMonthName = monthsList[activeMonth - 1];

        res.render('income_transactions', {
            transactions,
            totalAmount,
            activeMonth,
            activeYear,
            activeMonthName,
            monthsList,
            selectedType: type || 'all',
            tenant: req.tenant
        });

    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading income transactions');
    }
});

router.get('/debug-db', async (req, res) => {
    try {
        const [payments] = await db.execute('SELECT id, student_id, month, year, amount_paid, payment_date FROM fee_payments WHERE tenant_id = ?', [req.tenant.id]);
        res.json({ success: true, count: payments.length, payments });
    } catch (err) {
        res.status(500).json({ success: false, error: err.message });
    }
});

module.exports = router;
