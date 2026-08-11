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
        const { primary_color, secondary_color, fine_start_days, fine_amount_per_day, school_start_time, school_end_time, late_threshold_minutes, late_days_deduction_trigger } = req.body;
        
        let updateQuery = 'UPDATE tenants SET primary_color = ?, secondary_color = ?, fine_start_days = ?, fine_amount_per_day = ?, school_start_time = ?, school_end_time = ?, late_threshold_minutes = ?, late_days_deduction_trigger = ?';
        const queryParams = [
            primary_color, 
            secondary_color,
            fine_start_days ? parseInt(fine_start_days) : 10,
            fine_amount_per_day ? parseFloat(fine_amount_per_day) : 20.00,
            school_start_time || '08:00:00',
            school_end_time || '14:00:00',
            late_threshold_minutes ? parseInt(late_threshold_minutes) : 15,
            late_days_deduction_trigger ? parseInt(late_days_deduction_trigger) : 4
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

module.exports = router;
