const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');

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
    const { student_id, custom_monthly_fee, has_concession, concession_notes } = req.body;
    try {
        await db.execute(
            `UPDATE students 
             SET custom_monthly_fee = ?, has_concession = ?, concession_notes = ? 
             WHERE id = ? AND tenant_id = ?`,
            [
                custom_monthly_fee ? parseFloat(custom_monthly_fee) : null,
                has_concession === '1' ? 1 : 0,
                concession_notes || null,
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
        const { classId, search } = req.query;
        
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
        
        // Fetch all 2026 payments for these students
        const [payments] = await db.execute(
            'SELECT student_id, month, amount_paid FROM fee_payments WHERE tenant_id = ? AND year = 2026',
            [tenantId]
        );
        
        // Map payments for easy access: student_id -> { month: amount_paid }
        const paymentMap = {};
        payments.forEach(p => {
            if (!paymentMap[p.student_id]) {
                paymentMap[p.student_id] = {};
            }
            paymentMap[p.student_id][p.month] = p.amount_paid;
        });
        
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
        
        res.render('fees_ledger', { students, classes, classId, search, paymentMap });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading fee ledger.');
    }
});

// POST /fees/pay - record payment
router.post('/fees/pay', isAuthenticated, async (req, res) => {
    const { student_id, month, amount } = req.body;
    try {
        const tenantId = req.tenant.id;
        
        // Delete any existing payment first to allow updates
        await db.execute(
            'DELETE FROM fee_payments WHERE student_id = ? AND month = ? AND year = 2026 AND tenant_id = ?',
            [student_id, month, tenantId]
        );
        
        if (amount && parseFloat(amount) > 0) {
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by)
                 VALUES (?, ?, ?, 2026, ?, ?, ?)`,
                [tenantId, student_id, month, parseFloat(amount), new Date(), req.session.userId]
            );
        }
        
        res.redirect('/fees/ledger');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording fee payment.');
    }
});

module.exports = router;
