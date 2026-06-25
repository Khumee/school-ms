const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

// GET /fees/concessions - list students & custom fees
router.get('/fees/concessions', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, search } = req.query;
        
        let queryStr = `
            SELECT s.*, c.name as class_name, c.default_monthly_fee 
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
                custom_monthly_fee ? parseFloat(custom_monthly_fee) : null,
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

// GET /fees/ledger - monthly payments matrix
router.get('/fees/ledger', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, search, month, year } = req.query;
        
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);
        
        let queryStr = `
            SELECT s.id, s.reg_no, s.name, s.custom_monthly_fee, s.has_concession, 
                   c.name as class_name, c.default_monthly_fee
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
            'SELECT id, student_id, month, amount_paid FROM fee_payments WHERE tenant_id = ? AND year = ?',
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
                amount_paid: parseFloat(p.amount_paid)
            };
        });
        
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
        
        res.render('fees_ledger', { 
            students, 
            classes, 
            classId, 
            search, 
            paymentMap, 
            activeMonthNum: activeMonth, 
            activeYear: activeYear 
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading fee ledger.');
    }
});

// POST /fees/pay - record payment
router.post('/fees/pay', isAuthenticated, async (req, res) => {
    const { student_id, month, year, amount, fine_amount, fine_waived } = req.body;
    try {
        const tenantId = req.tenant.id;
        const waived = fine_waived === 'on' || fine_waived === '1' ? 1 : 0;
        const fineVal = fine_amount ? parseFloat(fine_amount) : 0.00;
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        
        // Delete any existing payment first to allow updates
        await db.execute(
            'DELETE FROM fee_payments WHERE student_id = ? AND month = ? AND year = ? AND tenant_id = ?',
            [student_id, month, activeYear, tenantId]
        );
        
        if (amount && parseFloat(amount) > 0) {
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [tenantId, student_id, month, activeYear, parseFloat(amount), new Date(), req.session.userId, fineVal, waived]
            );
        }
        
        res.redirect('/fees/ledger');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording fee payment.');
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
            `SELECT fp.*, s.name as student_name, s.reg_no, s.has_concession, s.custom_monthly_fee, c.name as class_name, c.default_monthly_fee
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

        renderPdf(res, {
            templateName: 'fee_receipt',
            data: {
                tenant: tenantForPdf,
                student: { name: payment.student_name, reg_no: payment.reg_no, has_concession: payment.has_concession },
                className: payment.class_name,
                month: payment.month,
                monthName: MONTH_NAMES[payment.month - 1],
                year: payment.year,
                amount: payment.amount_paid,
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
            downloadName: `fee-receipt-${payment.reg_no}-${MONTH_NAMES[payment.month - 1]}-${payment.year}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating fee receipt.');
    }
});

module.exports = router;
