const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

// GET /fees - redirect to ledger
router.get('/fees', isAuthenticated, (req, res) => {
    res.redirect('/fees/ledger');
});

// GET /fees/concessions - list students & custom fees
router.get('/fees/concessions', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, search } = req.query;
        
        let queryStr = `
            SELECT s.*, c.name as class_name, c.default_monthly_fee, c.is_hifz_class 
            FROM students s 
            LEFT JOIN classes c ON s.class_id = c.id 
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
        
        res.render('fees_concessions', { students, classes, classId, search });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading concessions.');
    }
});

// POST /fees/concessions/update - save concession overrides
router.post('/fees/concessions/update', isAuthenticated, async (req, res) => {
    const { student_id, custom_monthly_fee, has_concession, concession_notes, concession_reason } = req.body;
    try {
        await db.execute(
            `UPDATE students 
             SET custom_monthly_fee = ?, has_concession = ?, concession_notes = ?, concession_reason = ? 
             WHERE id = ? AND tenant_id = ?`,
            [
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                has_concession === '1' ? 1 : 0,
                concession_notes || null,
                concession_reason || null,
                student_id,
                req.tenant.id
            ]
        );
        res.redirect('/fees/concessions');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating concession.');
    }
});

// Helper to calculate YTD Top Defaulters
async function getTopDefaulters(tenantId, activeYear, limit = 10, offset = 0) {
    const currentMonthNum = new Date().getMonth() + 1;
    const currentYear = new Date().getFullYear();
    const elapsedMonths = activeYear < currentYear ? 12 : (activeYear === currentYear ? currentMonthNum : 0);
    
    const [students] = await db.execute(`
        SELECT s.id, s.reg_no, s.name, s.custom_monthly_fee, c.name as class_name, c.default_monthly_fee, c.is_hifz_class
        FROM students s
        LEFT JOIN classes c ON s.class_id = c.id
        WHERE s.tenant_id = ?
    `, [tenantId]);
    
    const [payments] = await db.execute(`
        SELECT student_id, SUM(amount_paid) as total_paid
        FROM fee_payments
        WHERE tenant_id = ? AND year = ?
        GROUP BY student_id
    `, [tenantId, activeYear]);
    
    const paymentMap = {};
    payments.forEach(p => paymentMap[p.student_id] = parseFloat(p.total_paid || 0));
    
    let defaulters = [];
    students.forEach(s => {
        const expectedMonthly = parseFloat(s.default_monthly_fee || 0) - parseFloat(s.custom_monthly_fee || 0);
        const totalExpected = expectedMonthly * elapsedMonths;
        const totalPaid = paymentMap[s.id] || 0;
        const due = totalExpected - totalPaid;
        
        if (due > 0) {
            defaulters.push({
                id: s.id,
                reg_no: s.reg_no,
                name: s.name,
                class_name: s.class_name || 'Unassigned',
                expectedFee: expectedMonthly, // To open payment modal with right standard fee
                default_monthly_fee: s.default_monthly_fee,
                custom_monthly_fee: s.custom_monthly_fee,
                due: due
            });
        }
    });
    
    defaulters.sort((a, b) => b.due - a.due);
    return defaulters.slice(offset, offset + limit);
}

// GET /fees/ledger - monthly payments matrix
router.get('/fees/ledger', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { classId, search, month, year } = req.query;
        
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);
        
        // Fetch classes for dropdown and defaults
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);

        if (classId === undefined) {
            const nursery = classes.find(c => c.name.toLowerCase().includes('nursery'));
            if (nursery) {
                classId = nursery.id.toString();
            }
        }
        
        let queryStr = `
            SELECT s.id, s.class_id, s.reg_no, s.name, s.custom_monthly_fee, s.has_concession, 
                   c.name as class_name, c.default_monthly_fee, c.is_hifz_class
            FROM students s
            LEFT JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        
        // Fetch all payments for the active year for these students
        const [payments] = await db.execute(
            'SELECT id, student_id, month, amount_paid, fine_amount, fine_waived, additional_fee, additional_fee_description FROM fee_payments WHERE tenant_id = ? AND year = ?',
            [tenantId, activeYear]
        );
        
        // Map payments for easy access: student_id -> { month: { id, amount_paid } }
        const paymentMap = {};
        payments.forEach(p => {
            if (!paymentMap[p.student_id]) {
                paymentMap[p.student_id] = {};
            }
            paymentMap[p.student_id][p.month] = {
                id: p.id,
                amount_paid: parseFloat(p.amount_paid),
                fine_amount: parseFloat(p.fine_amount || 0),
                fine_waived: p.fine_waived,
                additional_fee: parseFloat(p.additional_fee || 0),
                additional_fee_description: p.additional_fee_description || ''
            };
        });
        
        
        
        // Fetch recent payments for the default view
        const [recentPayments] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND fp.month >= 1 AND fp.month <= 12
             ORDER BY fp.payment_date DESC, fp.id DESC LIMIT 10`,
            [tenantId]
        );

        // Fetch initial top defaulters
        const topDefaulters = await getTopDefaulters(tenantId, activeYear, 10, 0);

        res.render('fees_ledger', { 
            students, 
            classes, 
            classId, 
            search, 
            paymentMap, 
            activeMonthNum: activeMonth, 
            activeYear: activeYear,
            recentPayments,
            topDefaulters
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading fee ledger.');
    }
});

// GET /fees/other - Manage other fees
router.get('/fees/other', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { classId, search, year } = req.query;
        
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        
        // Fetch classes for dropdown
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);

        let queryStr = `
            SELECT s.id, s.class_id, s.reg_no, s.name, c.name as class_name
            FROM students s
            LEFT JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        
        // Fetch other fees (Exam, Paper, Event, etc.) for the active year
        let otherPaymentsQuery = `
             SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND fp.year = ? AND (fp.additional_fee > 0 OR fp.additional_fee_description IS NOT NULL OR fp.month = 13)
        `;
        let otherPaymentsParams = [tenantId, activeYear];
        
        if (classId) {
            otherPaymentsQuery += ' AND s.class_id = ?';
            otherPaymentsParams.push(classId);
        }
        otherPaymentsQuery += ' ORDER BY fp.payment_date DESC, fp.id DESC';

        const [otherPayments] = await db.execute(otherPaymentsQuery, otherPaymentsParams);

        res.render('fees_other', { 
            students, 
            classes, 
            classId, 
            search, 
            activeYear: activeYear,
            otherPayments
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading other fees.');
    }
});

// POST /fees/pay - record payment
router.post('/fees/pay', isAuthenticated, async (req, res) => {
    const { student_id, month, year, amount, fine_amount, fine_waived, additional_fee, additional_fee_description, redirect_url, payment_date } = req.body;
    try {
        const tenantId = req.tenant.id;
        const waived = fine_waived === 'on' || fine_waived === '1' ? 1 : 0;
        const fineVal = fine_amount ? parseFloat(fine_amount) : 0.00;
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const addFeeVal = additional_fee ? parseFloat(additional_fee) : 0.00;
        const payDate = payment_date ? new Date(payment_date) : new Date();
        
        if (amount === '' || amount === null) {
            // If completely empty, do nothing
        } else if (parseFloat(amount) === 0) {
            // If they explicitly send 0, they want to clear the main fee.
            // We should keep the record if there's an additional fee, otherwise delete.
            await db.execute(
                `DELETE FROM fee_payments WHERE student_id = ? AND month = ? AND year = ? AND tenant_id = ? AND (additional_fee IS NULL OR additional_fee = 0)`,
                [student_id, month, activeYear, tenantId]
            );
            await db.execute(
                `UPDATE fee_payments SET amount_paid = additional_fee, fine_amount = 0 WHERE student_id = ? AND month = ? AND year = ? AND tenant_id = ?`,
                [student_id, month, activeYear, tenantId]
            );
        } else {
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE
                     amount_paid = VALUES(amount_paid),
                     payment_date = VALUES(payment_date),
                     recorded_by = VALUES(recorded_by),
                     fine_amount = VALUES(fine_amount),
                     fine_waived = VALUES(fine_waived)`,
                [tenantId, student_id, month, activeYear, parseFloat(amount), payDate, req.session.userId, fineVal, waived, addFeeVal, additional_fee_description || null]
            );
        }
        
        res.redirect(redirect_url || '/fees/ledger');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording fee payment.');
    }
});

// POST /fees/pay-other - record custom/one-off other fees (Exam, Paper, Event, etc.)
router.post('/fees/pay-other', isAuthenticated, async (req, res) => {
    const { student_id, month, year, fee_type, additional_fee_description, amount, payment_date, redirect_url } = req.body;
    try {
        const tenantId = req.tenant.id;
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const payDate = payment_date ? new Date(payment_date) : new Date();
        const feeAmt = parseFloat(amount) || 0.00;

        let desc = fee_type || 'Other Fee';
        if (fee_type === 'Custom' && additional_fee_description) {
            desc = additional_fee_description;
        } else if (additional_fee_description && fee_type !== 'Custom') {
            desc = `${fee_type} - ${additional_fee_description}`;
        }

        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);

        await db.execute(
            `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description)
             VALUES (?, ?, ?, ?, ?, ?, ?, 0, 0, ?, ?)
             ON DUPLICATE KEY UPDATE
                 amount_paid = amount_paid + VALUES(amount_paid),
                 additional_fee = additional_fee + VALUES(additional_fee),
                 additional_fee_description = IF(additional_fee_description IS NULL OR additional_fee_description = '', VALUES(additional_fee_description), CONCAT_WS(' | ', additional_fee_description, VALUES(additional_fee_description)))`,
            [tenantId, student_id, activeMonth, activeYear, feeAmt, payDate, req.session.userId, feeAmt, desc]
        );

        res.redirect(redirect_url || '/fees/other');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording other fee payment.');
    }
});

// GET /fees/student-history/:id - fetch JSON history for a student
router.get('/fees/student-history/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [payments] = await db.execute(
            `SELECT fp.*, u.username as recorded_by_user 
             FROM fee_payments fp
             LEFT JOIN users u ON fp.recorded_by = u.id
             WHERE fp.student_id = ? AND fp.tenant_id = ?
             ORDER BY fp.year DESC, fp.month DESC`,
            [req.params.id, tenantId]
        );
        res.json({ success: true, payments });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load history.' });
    }
});

// GET /fees/receipt/:id - generate PDF receipt for a fee payment
router.get('/fees/receipt/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [rows] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, s.has_concession, s.custom_monthly_fee, c.name as class_name, c.default_monthly_fee, c.is_hifz_class
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.id = ? AND fp.tenant_id = ?`,
            [req.params.id, tenantId]
        );
        if (rows.length === 0) return res.status(404).send('Fee payment not found.');
        const payment = rows[0];

        // Fetch last 5 payments for this student
        const [lastFivePayments] = await db.execute(
            `SELECT fp.*, u.username as recorded_by_user
             FROM fee_payments fp
             LEFT JOIN users u ON fp.recorded_by = u.id
             WHERE fp.student_id = ? AND fp.tenant_id = ? AND fp.id != ?
             ORDER BY fp.year DESC, fp.month DESC LIMIT 5`,
            [payment.student_id, tenantId, payment.id]
        );

        const tenantForPdf = { ...req.tenant, logo_url: resolvePublicAsset(req.tenant.logo_url) };

        const standardFee = parseFloat(payment.default_monthly_fee || 0);
        const customFee = payment.custom_monthly_fee !== null ? parseFloat(payment.custom_monthly_fee) : standardFee;
        const concession = Math.max(0, standardFee - customFee);

        let monthLabel = 'Monthly Fee';
        if (payment.month === 0) {
            monthLabel = 'Admission Fee';
        } else if (payment.additional_fee_description) {
            monthLabel = payment.additional_fee_description;
        } else if (payment.month >= 1 && payment.month <= 12) {
            monthLabel = MONTH_NAMES[payment.month - 1];
        }

        const totalAmtPaid = parseFloat(payment.amount_paid) > 0 ? parseFloat(payment.amount_paid) : parseFloat(payment.additional_fee || 0);

        renderPdf(res, {
            templateName: 'fee_receipt',
            data: {
                tenant: tenantForPdf,
                student: { name: payment.student_name, reg_no: payment.reg_no, has_concession: payment.has_concession },
                className: payment.class_name,
                month: payment.month,
                monthName: monthLabel,
                year: payment.year,
                amount: totalAmtPaid,
                fineAmount: payment.fine_amount || 0,
                fineWaived: payment.fine_waived === 1,
                standardFee,
                concession,
                receiptId: payment.id,
                paymentDate: new Date(payment.payment_date).toLocaleDateString('en-GB'),
                lastFivePayments,
                MONTH_NAMES
            },
            fileBaseName: `fee_receipt_${payment.id}`,
            downloadName: `fee-receipt-${payment.reg_no}-${payment.month === 0 ? 'AdmissionFee' : (payment.additional_fee_description || MONTH_NAMES[payment.month - 1] || 'OtherFee')}-${payment.year}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating fee receipt.');
    }
});

// GET /fees/api/recent - paginated recent collections
router.get('/fees/api/recent', isAuthenticated, async (req, res) => {
    try {
        const offset = parseInt(req.query.offset) || 0;
        const [recentPayments] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ?
             ORDER BY fp.payment_date DESC, fp.id DESC LIMIT 10 OFFSET ?`,
            [req.tenant.id, offset.toString()]
        );
        res.json({ success: true, data: recentPayments });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load recent payments.' });
    }
});

// GET /fees/api/defaulters - paginated YTD defaulters
router.get('/fees/api/defaulters', isAuthenticated, async (req, res) => {
    try {
        const offset = parseInt(req.query.offset) || 0;
        const activeYear = req.query.year ? parseInt(req.query.year) : new Date().getFullYear();
        const defaulters = await getTopDefaulters(req.tenant.id, activeYear, 10, offset);
        res.json({ success: true, data: defaulters });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load defaulters.' });
    }
});

module.exports = router;
