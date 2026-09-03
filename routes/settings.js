const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Set up storage for Multer
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const dest = path.join(__dirname, '../public/uploads/logos');
        // Ensure directory exists
        if (!fs.existsSync(dest)) {
            fs.mkdirSync(dest, { recursive: true });
        }
        cb(null, dest);
    },
    filename: function (req, file, cb) {
        const tenantId = req.tenant.id;
        const ext = path.extname(file.originalname);
        cb(null, `tenant-${tenantId}-logo-${Date.now()}${ext}`);
    }
});
const upload = multer({ storage: storage });

// Block non-admin access if needed, but since it's just authenticated, we assume all tenants can manage their settings.
// In a full implementation, you'd check if user is a tenant_admin.

// GET /settings/general - General settings view
router.get('/settings/general', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        // Fetch current tenant info to populate the form
        const [tenants] = await db.query('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        const currentTenant = tenants[0];
        
        res.render('settings_general', { currentTenant });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading settings.');
    }
});

// POST /settings/general - Update Theme and Logo
router.post('/settings/general', isAuthenticated, upload.single('logo'), async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { primary_color, secondary_color, school_tagline, fine_start_days, fine_amount_per_day, fixed_late_fee_amount, default_late_fee_type, fee_start_month, fee_start_year, school_start_time, school_end_time, late_threshold_minutes, late_days_deduction_trigger, hifz_pages_per_para, hifz_lines_per_page, hifz_total_pages, fee_account_number, fee_account_title, easypaisa_number, jazzcash_number } = req.body;
        
        let updateQuery = 'UPDATE tenants SET primary_color = ?, secondary_color = ?, school_tagline = ?, fine_start_days = ?, fine_amount_per_day = ?, fixed_late_fee_amount = ?, default_late_fee_type = ?, fee_start_month = ?, fee_start_year = ?, school_start_time = ?, school_end_time = ?, late_threshold_minutes = ?, late_days_deduction_trigger = ?, hifz_pages_per_para = ?, hifz_lines_per_page = ?, hifz_total_pages = ?, fee_account_number = ?, fee_account_title = ?, easypaisa_number = ?, jazzcash_number = ?';
        const queryParams = [
            primary_color, 
            secondary_color,
            school_tagline || null,
            fine_start_days ? parseInt(fine_start_days) : 10,
            fine_amount_per_day ? parseFloat(fine_amount_per_day) : 20.00,
            fixed_late_fee_amount ? parseFloat(fixed_late_fee_amount) : 250.00,
            default_late_fee_type || 'fixed',
            fee_start_month ? parseInt(fee_start_month) : 8,
            fee_start_year ? parseInt(fee_start_year) : 2026,
            school_start_time || '08:00:00',
            school_end_time || '14:00:00',
            late_threshold_minutes ? parseInt(late_threshold_minutes) : 15,
            late_days_deduction_trigger ? parseInt(late_days_deduction_trigger) : 4,
            hifz_pages_per_para ? parseInt(hifz_pages_per_para) : 20,
            hifz_lines_per_page ? parseInt(hifz_lines_per_page) : 15,
            hifz_total_pages ? parseInt(hifz_total_pages) : 600,
            fee_account_number || null,
            fee_account_title || null,
            easypaisa_number || null,
            jazzcash_number || null
        ];

        // If a new logo was uploaded
        if (req.file) {
            const logoUrl = `/uploads/logos/${req.file.filename}`;
            updateQuery += ', logo_url = ?';
            queryParams.push(logoUrl);
        }

        updateQuery += ' WHERE id = ?';
        queryParams.push(tenantId);

        await db.execute(updateQuery, queryParams);
        
        // Refresh the tenant in the session if it's cached, though `req.tenant` is usually fetched per request from middleware
        res.redirect('/settings/general?success=1');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating settings.');
    }
});

// GET /settings/merge - Merge duplicates view
router.get('/settings/merge', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { type, q } = req.query; // type: 'donors' or 'students'
        
        let searchResults = [];
        if (type && q) {
            if (type === 'donors') {
                const [results] = await db.execute('SELECT * FROM donors WHERE tenant_id = ? AND name LIKE ? ORDER BY name ASC LIMIT 20', [tenantId, `%${q}%`]);
                searchResults = results;
            } else if (type === 'students') {
                const [results] = await db.execute('SELECT * FROM students WHERE tenant_id = ? AND (name LIKE ? OR registration_number LIKE ?) ORDER BY name ASC LIMIT 20', [tenantId, `%${q}%`, `%${q}%`]);
                searchResults = results;
            }
        }
        
        const defaultType = req.tenant.enable_donations_module ? 'donors' : 'students';
        res.render('settings_merge', { type: type || defaultType, q: q || '', searchResults });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading merge view.');
    }
});

// GET /settings/merge/preview - Get preview stats for merging
router.get('/settings/merge/preview', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { type, source_id, target_id } = req.query;

        if (!source_id || !target_id || source_id === target_id) {
            return res.status(400).json({ error: 'Invalid source or target ID.' });
        }

        let previewData = {};

        if (type === 'donors') {
            // Get donation counts and sums
            const [sourceDonations] = await db.execute('SELECT COUNT(*) as count, SUM(amount) as total FROM donations WHERE donor_id = ? AND tenant_id = ?', [source_id, tenantId]);
            const [targetDonations] = await db.execute('SELECT COUNT(*) as count, SUM(amount) as total FROM donations WHERE donor_id = ? AND tenant_id = ?', [target_id, tenantId]);
            
            previewData = {
                source: {
                    donations_count: sourceDonations[0].count || 0,
                    donations_total: sourceDonations[0].total || 0
                },
                target: {
                    donations_count: targetDonations[0].count || 0,
                    donations_total: targetDonations[0].total || 0
                }
            };
        } else if (type === 'students') {
            // Get student related stats
            const [sourceFees] = await db.execute('SELECT COUNT(*) as count, SUM(amount_paid) as total FROM fee_payments WHERE student_id = ? AND tenant_id = ?', [source_id, tenantId]);
            const [targetFees] = await db.execute('SELECT COUNT(*) as count, SUM(amount_paid) as total FROM fee_payments WHERE student_id = ? AND tenant_id = ?', [target_id, tenantId]);

            const [sourceAttendance] = await db.execute('SELECT COUNT(*) as count FROM attendance_students WHERE student_id = ? AND tenant_id = ?', [source_id, tenantId]);
            const [targetAttendance] = await db.execute('SELECT COUNT(*) as count FROM attendance_students WHERE student_id = ? AND tenant_id = ?', [target_id, tenantId]);

            const [sourceEnrollments] = await db.execute('SELECT COUNT(*) as count FROM student_enrollments WHERE student_id = ? AND tenant_id = ?', [source_id, tenantId]);
            const [targetEnrollments] = await db.execute('SELECT COUNT(*) as count FROM student_enrollments WHERE student_id = ? AND tenant_id = ?', [target_id, tenantId]);

            const [sourceHifz] = await db.execute('SELECT COUNT(*) as count FROM hifz_logs WHERE student_id = ? AND tenant_id = ?', [source_id, tenantId]);
            const [targetHifz] = await db.execute('SELECT COUNT(*) as count FROM hifz_logs WHERE student_id = ? AND tenant_id = ?', [target_id, tenantId]);

            previewData = {
                source: {
                    fees_count: sourceFees[0].count || 0,
                    fees_total: sourceFees[0].total || 0,
                    attendance_count: sourceAttendance[0].count || 0,
                    enrollments_count: sourceEnrollments[0].count || 0,
                    hifz_count: sourceHifz[0].count || 0
                },
                target: {
                    fees_count: targetFees[0].count || 0,
                    fees_total: targetFees[0].total || 0,
                    attendance_count: targetAttendance[0].count || 0,
                    enrollments_count: targetEnrollments[0].count || 0,
                    hifz_count: targetHifz[0].count || 0
                }
            };
        }

        res.json(previewData);
    } catch (err) {
        console.error('Error in merge preview:', err);
        res.status(500).json({ error: 'Failed to generate preview' });
    }
});

// POST /settings/merge - Process the merge
router.post('/settings/merge', isAuthenticated, async (req, res) => {
    const conn = await db.getConnection();
    try {
        const tenantId = req.tenant.id;
        const { type, source_id, target_id } = req.body;

        if (!source_id || !target_id || source_id === target_id) {
            return res.status(400).send('Invalid source or target ID.');
        }

        await conn.beginTransaction();

        if (type === 'donors') {
            // Update donations
            await conn.execute('UPDATE donations SET donor_id = ? WHERE donor_id = ? AND tenant_id = ?', [target_id, source_id, tenantId]);
            // Delete source donor
            await conn.execute('DELETE FROM donors WHERE id = ? AND tenant_id = ?', [source_id, tenantId]);
            
        } else if (type === 'students') {
            // Update fee_payments
            await conn.execute('UPDATE fee_payments SET student_id = ? WHERE student_id = ? AND tenant_id = ?', [target_id, source_id, tenantId]);
            // Update attendance_students
            await conn.execute('UPDATE attendance_students SET student_id = ? WHERE student_id = ? AND tenant_id = ?', [target_id, source_id, tenantId]);
            // Update student_enrollments
            await conn.execute('UPDATE student_enrollments SET student_id = ? WHERE student_id = ? AND tenant_id = ?', [target_id, source_id, tenantId]);
            // Update hifz_logs
            await conn.execute('UPDATE hifz_logs SET student_id = ? WHERE student_id = ? AND tenant_id = ?', [target_id, source_id, tenantId]);
            
            // Delete source student
            await conn.execute('DELETE FROM students WHERE id = ? AND tenant_id = ?', [source_id, tenantId]);
        }

        await conn.commit();
        res.redirect(`/settings/merge?type=${type}&success=1`);
    } catch (err) {
        await conn.rollback();
        console.error(err);
        res.status(500).send('Error merging duplicates.');
    } finally {
        conn.release();
    }
});

// ============================================================
// GET /settings/holidays — Unified Holidays Manager
// ============================================================
router.get('/settings/holidays', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [schoolHolidays] = await db.execute(
            `SELECT * FROM holidays WHERE tenant_id = ? ORDER BY date DESC`,
            [tenantId]
        );
        const [hifzHolidays] = await db.execute(
            `SELECT * FROM hifz_school_holidays WHERE tenant_id = ? ORDER BY holiday_date DESC`,
            [tenantId]
        );
        const activeTab = req.query.tab || 'school';
        res.render('settings_holidays', { schoolHolidays, hifzHolidays, activeTab });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading holidays.');
    }
});

// ============================================================
// POST /settings/holidays/school — Add School Holiday(s)
// ============================================================
router.post('/settings/holidays/school', isAuthenticated, async (req, res) => {
    const { holiday_type, holiday_date, holiday_from, holiday_to, description } = req.body;
    try {
        if (holiday_type === 'range' && holiday_from && holiday_to) {
            const start = new Date(holiday_from);
            const end = new Date(holiday_to);
            if (start <= end) {
                let current = new Date(start);
                while (current <= end) {
                    const dateStr = current.toISOString().split('T')[0];
                    await db.execute(
                        `INSERT IGNORE INTO holidays (tenant_id, date, name) VALUES (?, ?, ?)`,
                        [req.tenant.id, dateStr, description || null]
                    );
                    current.setDate(current.getDate() + 1);
                }
            }
        } else if (holiday_date) {
            await db.execute(
                `INSERT IGNORE INTO holidays (tenant_id, date, name) VALUES (?, ?, ?)`,
                [req.tenant.id, holiday_date, description || null]
            );
        }
        res.redirect('/settings/holidays?tab=school');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding school holiday.');
    }
});

// POST /settings/holidays/school/delete/:id
router.post('/settings/holidays/school/delete/:id', isAuthenticated, async (req, res) => {
    await db.execute(`DELETE FROM holidays WHERE id = ? AND tenant_id = ?`, [req.params.id, req.tenant.id]);
    res.redirect('/settings/holidays?tab=school');
});

// ============================================================
// POST /settings/holidays/hifz — Add Hifz Holiday(s)
// ============================================================
router.post('/settings/holidays/hifz', isAuthenticated, async (req, res) => {
    const { holiday_type, holiday_date, holiday_from, holiday_to, description } = req.body;
    try {
        if (holiday_type === 'range' && holiday_from && holiday_to) {
            const start = new Date(holiday_from);
            const end = new Date(holiday_to);
            if (start <= end) {
                let current = new Date(start);
                while (current <= end) {
                    const dateStr = current.toISOString().split('T')[0];
                    await db.execute(
                        `INSERT IGNORE INTO hifz_school_holidays (tenant_id, holiday_date, description) VALUES (?, ?, ?)`,
                        [req.tenant.id, dateStr, description || null]
                    );
                    current.setDate(current.getDate() + 1);
                }
            }
        } else if (holiday_date) {
            await db.execute(
                `INSERT IGNORE INTO hifz_school_holidays (tenant_id, holiday_date, description) VALUES (?, ?, ?)`,
                [req.tenant.id, holiday_date, description || null]
            );
        }
        res.redirect('/settings/holidays?tab=hifz');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding Hifz holiday.');
    }
});

// POST /settings/holidays/hifz/delete/:id
router.post('/settings/holidays/hifz/delete/:id', isAuthenticated, async (req, res) => {
    await db.execute(`DELETE FROM hifz_school_holidays WHERE id = ? AND tenant_id = ?`, [req.params.id, req.tenant.id]);
    res.redirect('/settings/holidays?tab=hifz');
});

module.exports = router;
