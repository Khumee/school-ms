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
        const { primary_color, secondary_color } = req.body;
        
        let updateQuery = 'UPDATE tenants SET primary_color = ?, secondary_color = ?';
        const queryParams = [primary_color, secondary_color];

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
        
        res.render('settings_merge', { type: type || 'donors', q: q || '', searchResults });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading merge view.');
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
