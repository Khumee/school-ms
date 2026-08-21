const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
const { generateGeminiContent } = require('../utils/geminiHelper');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const tenantId = req.tenant ? req.tenant.id : 'default';
        let subDir = 'temp';

        if (req.body.student_id) {
            subDir = `${req.body.student_id}`;
        } else if (file.fieldname === 'scan_image') {
            subDir = 'scans';
        }

        const dir = path.join(__dirname, '..', 'public', 'uploads', String(tenantId), subDir);
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }
        cb(null, dir);
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, file.fieldname + '-' + uniqueSuffix + path.extname(file.originalname));
    }
});
const upload = multer({ storage: storage });

// GET /students - list
router.get('/students', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, search, filter } = req.query;

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
        if (filter === 'left') {
            queryStr += ' AND s.status != "active"';
        } else {
            queryStr += ' AND s.status = "active"';
        }

        queryStr += ' ORDER BY s.updated_at DESC, s.date_of_admission DESC, s.reg_no ASC';

        const [students] = await db.execute(queryStr, params);
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);

        const queryParams = new URLSearchParams();
        if (classId) queryParams.append('classId', classId);
        if (search) queryParams.append('search', search);
        if (filter) queryParams.append('filter', filter);
        const qString = queryParams.toString() ? '?' + queryParams.toString() : '';

        res.render('students_list', { students, classes, classId, search, filter, qString });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading students.');
    }
});

// GET /students/add - form
router.get('/students/add', isAuthenticated, async (req, res) => {
    try {
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [req.tenant.id]);
        res.render('student_add', {
            classes,
            error: null,
            default_hifz_fee_waiver: req.tenant.default_hifz_fee_waiver
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading form.');
    }
});

// POST /students/add - save
router.post('/students/add', isAuthenticated, upload.fields([{ name: 'photo', maxCount: 1 }, { name: 'document_file', maxCount: 1 }]), async (req, res) => {
    const {
        reg_no, name, class_id, custom_monthly_fee, concession_notes, concession_reason, family_members, siblings, school_going_siblings, monthly_income,
        father_name, father_phone, emergency_contact, date_of_birth, address, gender,
        date_of_admission, status, previous_school_info, blood_group,
        admission_fee, admission_fee_status, admission_fee_payment_date,
        document_type, document_description
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
                reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, concession_reason, family_members, siblings, school_going_siblings, monthly_income,
                father_name, father_phone, emergency_contact, date_of_birth, address, gender,
                date_of_admission, status, previous_school_info, blood_group, tenant_id,
                admission_fee, admission_fee_status, admission_fee_payment_date
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                reg_no, name, class_id || null,
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                ((custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') && parseFloat(custom_monthly_fee) > 0) ? 1 : 0,
                concession_notes || null, concession_reason || null,
                family_members ? parseInt(family_members, 10) : null,
                siblings ? parseInt(siblings, 10) : null,
                school_going_siblings ? parseInt(school_going_siblings, 10) : null,
                monthly_income || null,
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

        const destDir = path.join(__dirname, '..', 'public', 'uploads', String(tenantId), String(studentId));

        if (req.files && req.files.photo) {
            if (!fs.existsSync(destDir)) fs.mkdirSync(destDir, { recursive: true });

            const photoFile = req.files.photo[0];
            const destPath = path.join(destDir, photoFile.filename);
            fs.renameSync(photoFile.path, destPath);

            const fileUrl = `/uploads/${tenantId}/${studentId}/${photoFile.filename}`;
            await db.execute('UPDATE students SET photo_url = ? WHERE id = ? AND tenant_id = ?', [fileUrl, studentId, tenantId]);
        }

        if (req.files && req.files.document_file && document_type) {
            if (!fs.existsSync(destDir)) fs.mkdirSync(destDir, { recursive: true });

            const docFile = req.files.document_file[0];
            const destPath = path.join(destDir, docFile.filename);
            fs.renameSync(docFile.path, destPath);

            const fileUrl = `/uploads/${tenantId}/${studentId}/${docFile.filename}`;
            await db.execute(
                `INSERT INTO student_documents (tenant_id, student_id, document_type, description, file_url) VALUES (?, ?, ?, ?, ?)`,
                [tenantId, studentId, document_type, document_description || null, fileUrl]
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
        const queryString = Object.keys(req.query).length > 0 ? '?' + new URLSearchParams(req.query).toString() : '';
        res.render('student_edit', {
            student: students[0],
            classes,
            error: null,
            default_hifz_fee_waiver: req.tenant.default_hifz_fee_waiver,
            queryString
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading edit form.');
    }
});

// POST /students/edit/:id - update
router.post('/students/edit/:id', isAuthenticated, async (req, res) => {
    const {
        reg_no, name, class_id, custom_monthly_fee, concession_notes, concession_reason, family_members, siblings, school_going_siblings, monthly_income,
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
            const queryString = Object.keys(req.query).length > 0 ? '?' + new URLSearchParams(req.query).toString() : '';
            return res.render('student_edit', {
                student: students[0],
                classes,
                error: 'Registration number already exists.',
                default_hifz_fee_waiver: req.tenant.default_hifz_fee_waiver,
                queryString
            });
        }

        const admFee = admission_fee ? parseFloat(admission_fee) : 0.00;
        const admStatus = admission_fee_status || 'unpaid';
        const admDate = (admStatus === 'paid' && admission_fee_payment_date) ? new Date(admission_fee_payment_date) : null;

        await db.execute(
            `UPDATE students SET 
                reg_no = ?, name = ?, class_id = ?, custom_monthly_fee = ?, 
                has_concession = ?, concession_notes = ?, concession_reason = ?, family_members = ?, siblings = ?, school_going_siblings = ?, monthly_income = ?, father_name = ?, 
                father_phone = ?, emergency_contact = ?, date_of_birth = ?, 
                address = ?, gender = ?, date_of_admission = ?, status = ?, 
                previous_school_info = ?, blood_group = ?,
                admission_fee = ?, admission_fee_status = ?, admission_fee_payment_date = ?
             WHERE id = ? AND tenant_id = ?`,
            [
                reg_no, name, class_id || null,
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                ((custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') && parseFloat(custom_monthly_fee) > 0) ? 1 : 0,
                concession_notes || null, concession_reason || null,
                family_members ? parseInt(family_members, 10) : null,
                siblings ? parseInt(siblings, 10) : null,
                school_going_siblings ? parseInt(school_going_siblings, 10) : null,
                monthly_income || null,
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

        const queryString = Object.keys(req.query).length > 0 ? '?' + new URLSearchParams(req.query).toString() : '';
        res.redirect(`/students${queryString}`);
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

        // Fetch student documents
        const [documents] = await db.execute(
            'SELECT * FROM student_documents WHERE student_id = ? AND tenant_id = ? ORDER BY uploaded_at DESC',
            [req.params.id, tenantId]
        );

        res.render('student_view', {
            student: students[0],
            payments,
            totalPaid,
            hifzEnrollment,
            documents
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading student profile.');
    }
});

// GET /students/print/:id - print admission form
router.get('/students/print/:id', isAuthenticated, async (req, res) => {
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

        // Pass tenant info for branding
        res.render('student_print', {
            student: students[0],
            tenant: req.tenant
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading print view.');
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

// --- Document Management Routes ---

// POST /students/upload-document
router.post('/students/upload-document', isAuthenticated, upload.single('document_file'), async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { student_id, document_type, description } = req.body;

        if (!req.file) {
            return res.status(400).send('No file uploaded.');
        }

        const filePath = `/uploads/${tenantId}/${student_id}/${req.file.filename}`;

        await db.execute(
            `INSERT INTO student_documents (student_id, tenant_id, document_type, description, file_path) 
             VALUES (?, ?, ?, ?, ?)`,
            [student_id, tenantId, document_type, description || null, filePath]
        );

        res.redirect(`/students/view/${student_id}?tab=documents`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error uploading document.');
    }
});

// POST /students/delete-document
router.post('/students/delete-document', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { document_id, student_id } = req.body;

        const [docs] = await db.execute(
            'SELECT file_path FROM student_documents WHERE id = ? AND tenant_id = ? AND student_id = ?',
            [document_id, tenantId, student_id]
        );

        if (docs.length > 0) {
            const filePath = path.join(__dirname, '..', 'public', docs[0].file_path);
            if (fs.existsSync(filePath)) {
                fs.unlinkSync(filePath);
            }
            await db.execute('DELETE FROM student_documents WHERE id = ?', [document_id]);
        }

        res.redirect(`/students/view/${student_id}?tab=documents`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting document.');
    }
});

// POST /students/update-photo
router.post('/students/update-photo', isAuthenticated, upload.single('photo'), async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { student_id } = req.body;

        if (!req.file) {
            return res.status(400).send('No photo uploaded.');
        }

        const photoUrl = `/uploads/${tenantId}/${student_id}/${req.file.filename}`;

        await db.execute(
            'UPDATE students SET photo_url = ? WHERE id = ? AND tenant_id = ?',
            [photoUrl, student_id, tenantId]
        );

        res.redirect(`/students/view/${student_id}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating photo.');
    }
});

// POST /students/delete-photo
router.post('/students/delete-photo', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { student_id } = req.body;

        const [students] = await db.execute(
            'SELECT photo_url FROM students WHERE id = ? AND tenant_id = ?',
            [student_id, tenantId]
        );

        if (students.length > 0 && students[0].photo_url) {
            const filePath = path.join(__dirname, '..', 'public', students[0].photo_url);
            if (fs.existsSync(filePath)) {
                fs.unlinkSync(filePath);
            }
            await db.execute(
                'UPDATE students SET photo_url = NULL WHERE id = ? AND tenant_id = ?',
                [student_id, tenantId]
            );
        }

        res.redirect(`/students/view/${student_id}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting photo.');
    }
});

// GET /students/admission-form/empty
router.get('/students/admission-form/empty', isAuthenticated, async (req, res) => {
    try {
        res.render('admission_form_print', { tenant: req.tenant });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error rendering empty form.');
    }
});

// POST /students/admission-form/scan  (accepts raw base64 JSON from client - no multer, no compression)
router.post('/students/admission-form/scan', isAuthenticated, async (req, res) => {
    try {
        const { image_b64, mime_type, file_size } = req.body;

        if (!image_b64) {
            return res.status(400).json({ error: 'No image data received.' });
        }

        // Minimal logging
        console.log("----- IMAGE RECEIVED FOR OCR -----");
        console.log("MimeType:", mime_type);
        console.log("Client file size (bytes):", file_size);
        console.log("Base64 length (chars):", image_b64.length);
        console.log("Approx decoded size (bytes):", Math.round(image_b64.length * 0.75));
        // Note: No file saved to disk – we directly pass base64 to Gemini

        const imagePart = {
            inlineData: {
                data: image_b64,
                mimeType: mime_type || 'image/jpeg'
            }
        };

        const prompt = `You are a strict data extraction AI. You MUST extract the requested fields from the provided image.
Even if the image is blurry, cropped, or handwriting is messy, do your absolute best to transcribe it.
Return ONLY a valid JSON object with EXACTLY these keys.
Do NOT include markdown formatting (no \`\`\`json).

Required keys:
"name": (Student's full name)
"father_name": (Father's name)
"father_phone": (Father's phone number)
"emergency_contact": (Emergency contact number)
"date_of_birth": (Format as YYYY-MM-DD if possible)
"address": (Full residential address)
"gender": (Male/Female/Other)
"blood_group": (e.g. O+, AB-)
"previous_school_info": (Name of previous school if any)

If a field is absolutely not present on the page, leave it as an empty string "".
However, you MUST try to fill as many fields as possible.`;

        const result = await generateGeminiContent([prompt, imagePart], {
            model: 'gemini-2.5-flash'
        });
        const responseText = result.response.text();

        console.log("----- GEMINI RAW RESPONSE -----");
        console.log(responseText);
        console.log("-------------------------------");

        let jsonStr = responseText.replace(/```json/g, '').replace(/```/g, '').trim();
        const extractedData = JSON.parse(jsonStr);

        res.json({ success: true, data: extractedData, raw: responseText });
    } catch (err) {
        console.error('OCR Error:', err);
        const errMsg = err.message.includes('busy processing other sheets')
            ? err.message
            : 'Error processing image: ' + err.message;
        res.status(500).json({ error: errMsg });
    }
});

// GET /students/api/attendance/:id - Fetch attendance history with date filters
router.get('/students/api/attendance/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = req.params.id;
        const { startDate, endDate } = req.query;

        let query = `
            SELECT a.date, a.status, u.username as marked_by_name
            FROM attendance_students a
            LEFT JOIN users u ON a.marked_by = u.id
            WHERE a.student_id = ? AND a.tenant_id = ?
        `;
        const params = [studentId, tenantId];

        if (startDate && endDate) {
            query += ' AND a.date >= ? AND a.date <= ?';
            params.push(startDate, endDate);
        }

        query += ' ORDER BY a.date DESC';

        const [records] = await db.execute(query, params);
        res.json({ success: true, data: records });
    } catch (err) {
        console.error('Error fetching attendance:', err);
        res.status(500).json({ success: false, error: 'Error fetching attendance.' });
    }
});

// Scan route for auto‑fill (base64 JSON)
router.post('/students/scan', isAuthenticated, async (req, res) => {
  try {
    const { image } = req.body;
    if (!image) {
      return res.status(400).json({ error: 'No image supplied.' });
    }
    // TODO: integrate Gemini OCR here. For now, return empty data placeholder.
    const extracted = {};
    res.json({ data: extracted });
  } catch (err) {
    console.error('Scanning error:', err);
    res.status(500).json({ error: 'Error processing the image.' });
  }
});

module.exports = router;
