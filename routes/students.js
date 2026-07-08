const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');

// GET /students - list
router.get('/students', isAuthenticated, async (req, res) => {
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
        
        res.render('students_list', { students, classes, classId, search });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading students.');
    }
});

// GET /students/add - form
router.get('/students/add', isAuthenticated, async (req, res) => {
    try {
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [req.tenant.id]);
        res.render('student_add', { classes, error: null });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading form.');
    }
});

// POST /students/add - save
router.post('/students/add', isAuthenticated, async (req, res) => {
    const {
        reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes,
        father_name, father_phone, emergency_contact, date_of_birth, address, gender,
        date_of_admission, status, previous_school_info, blood_group,
        admission_fee, admission_fee_status, admission_fee_payment_date
    } = req.body;
    
    try {
        const tenantId = req.tenant.id;
        
        // Check duplication
        const [existing] = await db.execute(
            'SELECT id FROM students WHERE reg_no = ? AND tenant_id = ? LIMIT 1',
            [reg_no, tenantId]
        );
        if (existing.length > 0) {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            return res.render('student_add', { classes, error: 'Registration number already exists.' });
        }
        
        const admFee = admission_fee ? parseFloat(admission_fee) : 0.00;
        const admStatus = admission_fee_status || 'unpaid';
        const admDate = (admStatus === 'paid' && admission_fee_payment_date) ? new Date(admission_fee_payment_date) : null;

        const [result] = await db.execute(
            `INSERT INTO students (
                reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes,
                father_name, father_phone, emergency_contact, date_of_birth, address, gender,
                date_of_admission, status, previous_school_info, blood_group, tenant_id,
                admission_fee, admission_fee_status, admission_fee_payment_date
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                reg_no, name, class_id || null, 
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                has_concession === 'on' || has_concession === '1' ? 1 : 0,
                concession_notes || null,
                father_name || null, father_phone || null, emergency_contact || null,
                date_of_birth || null, address || null, gender || 'male',
                date_of_admission || null, status || 'active',
                previous_school_info || null, blood_group || null,
                tenantId,
                admFee,
                admStatus,
                admDate
            ]
        );
        
        const studentId = result.insertId;
        
        if (admStatus === 'paid' && admFee > 0) {
            const payYear = admDate ? admDate.getFullYear() : new Date().getFullYear();
            const payDate = admDate || new Date();
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by)
                 VALUES (?, ?, ?, ?, ?, ?, ?)`,
                [tenantId, studentId, 0, payYear, admFee, payDate, req.session.userId]
            );
        }
        
        res.redirect('/students');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding student.');
    }
});

// GET /students/edit/:id - form
router.get('/students/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [students] = await db.execute(
            'SELECT * FROM students WHERE id = ? AND tenant_id = ? LIMIT 1',
            [req.params.id, tenantId]
        );
        if (students.length === 0) return res.status(404).send('Student not found.');
        
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
        res.render('student_edit', { student: students[0], classes, error: null });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading edit form.');
    }
});

// POST /students/edit/:id - update
router.post('/students/edit/:id', isAuthenticated, async (req, res) => {
    const {
        reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes,
        father_name, father_phone, emergency_contact, date_of_birth, address, gender,
        date_of_admission, status, previous_school_info, blood_group,
        admission_fee, admission_fee_status, admission_fee_payment_date
    } = req.body;
    
    try {
        const tenantId = req.tenant.id;
        const studentId = req.params.id;
        
        // Check registration duplication
        const [existing] = await db.execute(
            'SELECT id FROM students WHERE reg_no = ? AND tenant_id = ? AND id != ? LIMIT 1',
            [reg_no, tenantId, studentId]
        );
        if (existing.length > 0) {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            const [students] = await db.execute('SELECT * FROM students WHERE id = ? AND tenant_id = ?', [studentId, tenantId]);
            return res.render('student_edit', { student: students[0], classes, error: 'Registration number already exists.' });
        }
        
        const admFee = admission_fee ? parseFloat(admission_fee) : 0.00;
        const admStatus = admission_fee_status || 'unpaid';
        const admDate = (admStatus === 'paid' && admission_fee_payment_date) ? new Date(admission_fee_payment_date) : null;

        await db.execute(
            `UPDATE students SET 
                reg_no = ?, name = ?, class_id = ?, custom_monthly_fee = ?, 
                has_concession = ?, concession_notes = ?, father_name = ?, 
                father_phone = ?, emergency_contact = ?, date_of_birth = ?, 
                address = ?, gender = ?, date_of_admission = ?, status = ?, 
                previous_school_info = ?, blood_group = ?,
                admission_fee = ?, admission_fee_status = ?, admission_fee_payment_date = ?
             WHERE id = ? AND tenant_id = ?`,
            [
                reg_no, name, class_id || null,
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                has_concession === 'on' || has_concession === '1' ? 1 : 0,
                concession_notes || null,
                father_name || null, father_phone || null, emergency_contact || null,
                date_of_birth || null, address || null, gender || 'male',
                date_of_admission || null, status || 'active',
                previous_school_info || null, blood_group || null,
                admFee,
                admStatus,
                admDate,
                studentId, tenantId
            ]
        );
        
        // Sync with fee_payments table
        await db.execute(
            'DELETE FROM fee_payments WHERE student_id = ? AND month = 0 AND tenant_id = ?',
            [studentId, tenantId]
        );
        
        if (admStatus === 'paid' && admFee > 0) {
            const payYear = admDate ? admDate.getFullYear() : new Date().getFullYear();
            const payDate = admDate || new Date();
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by)
                 VALUES (?, ?, ?, ?, ?, ?, ?)`,
                [tenantId, studentId, 0, payYear, admFee, payDate, req.session.userId]
            );
        }
        
        res.redirect('/students');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating student.');
    }
});

// GET /students/view/:id - profile + fee payment history
router.get('/students/view/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [students] = await db.execute(
            `SELECT s.*, c.name as class_name, c.default_monthly_fee, c.is_hifz_class
             FROM students s
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE s.id = ? AND s.tenant_id = ?`,
            [req.params.id, tenantId]
        );
        if (students.length === 0) return res.status(404).send('Student not found.');

        const [payments] = await db.execute(
            'SELECT * FROM fee_payments WHERE student_id = ? AND tenant_id = ? ORDER BY year DESC, month DESC',
            [req.params.id, tenantId]
        );

        const totalPaid = payments.reduce((sum, p) => sum + parseFloat(p.amount_paid), 0);

        // Fetch Hifz enrollment details if Hifz module is enabled
        let hifzEnrollment = null;
        if (req.tenant && req.tenant.enable_hifz_module) {
            const [hRows] = await db.execute(
                `SELECT * FROM hifz_enrollment WHERE student_id = ? AND tenant_id = ? AND status = 'active' LIMIT 1`,
                [req.params.id, tenantId]
            );
            if (hRows.length > 0) {
                hifzEnrollment = hRows[0];
            }
        }

        res.render('student_view', { 
            student: students[0], 
            payments, 
            totalPaid,
            hifzEnrollment
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading student profile.');
    }
});

// POST /students/delete/:id - delete
router.post('/students/delete/:id', isAuthenticated, async (req, res) => {
    try {
        await db.execute('DELETE FROM students WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect('/students');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting student.');
    }
});

// POST /students/update-admission-fee/:id - quick update admission fee status
router.post('/students/update-admission-fee/:id', isAuthenticated, async (req, res) => {
    const { status, payment_date } = req.body;
    try {
        const tenantId = req.tenant.id;
        const studentId = req.params.id;
        
        // Fetch current student details
        const [students] = await db.execute('SELECT * FROM students WHERE id = ? AND tenant_id = ? LIMIT 1', [studentId, tenantId]);
        if (students.length === 0) return res.status(404).send('Student not found.');
        const student = students[0];
        
        const finalStatus = status || 'paid';
        const finalDate = payment_date ? new Date(payment_date) : new Date();
        
        await db.execute(
            'UPDATE students SET admission_fee_status = ?, admission_fee_payment_date = ? WHERE id = ? AND tenant_id = ?',
            [finalStatus, finalStatus === 'paid' ? finalDate : null, studentId, tenantId]
        );
        
        // Sync with fee_payments table
        await db.execute(
            'DELETE FROM fee_payments WHERE student_id = ? AND month = 0 AND tenant_id = ?',
            [studentId, tenantId]
        );
        
        if (finalStatus === 'paid' && parseFloat(student.admission_fee) > 0) {
            const payYear = finalDate.getFullYear();
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by)
                 VALUES (?, ?, ?, ?, ?, ?, ?)`,
                [tenantId, studentId, 0, payYear, parseFloat(student.admission_fee), finalDate, req.session.userId]
            );
        }
        
        res.redirect(`/students/view/${studentId}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating admission fee.');
    }
});

module.exports = router;
