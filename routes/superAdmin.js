const express = require('express');
const router = express.Router();
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const bcrypt = require('bcryptjs');
const db = require('../db');
const { isSuperAdmin } = require('../middleware/auth');

const logoDir = path.join(__dirname, '..', 'public', 'images', 'logos');
fs.mkdirSync(logoDir, { recursive: true });

const upload = multer({
    storage: multer.diskStorage({
        destination: (req, file, cb) => cb(null, logoDir),
        filename: (req, file, cb) => {
            const ext = path.extname(file.originalname).toLowerCase();
            cb(null, `tenant-${req.params.id}-${Date.now()}${ext}`);
        }
    }),
    limits: { fileSize: 2 * 1024 * 1024 },
    fileFilter: (req, file, cb) => {
        const allowed = ['.png', '.jpg', '.jpeg', '.svg', '.webp'];
        cb(null, allowed.includes(path.extname(file.originalname).toLowerCase()));
    }
});

// GET Super Admin Login
router.get('/admin/login', (req, res) => {
    res.render('super_admin/login', { error: null });
});

// POST Super Admin Login
router.post('/admin/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const [rows] = await db.pool.execute(
            'SELECT * FROM master_admins WHERE username = ? LIMIT 1',
            [username ? username.trim() : '']
        );
        if (rows.length > 0 && await bcrypt.compare(password, rows[0].password)) {
            req.session.masterAdminId = rows[0].id;
            req.session.masterAdminUsername = rows[0].username;
            return req.session.save(() => res.redirect('/admin'));
        }
        res.render('super_admin/login', { error: 'Invalid username or password.' });
    } catch (err) {
        console.error('Super Admin Login Error:', err);
        res.render('super_admin/login', { error: 'An internal error occurred.' });
    }
});

// GET Super Admin Logout
router.get('/admin/logout', (req, res) => {
    req.session.destroy(() => res.redirect('/admin/login'));
});

// GET Tenant Dashboard (list)
router.get('/admin', isSuperAdmin, async (req, res) => {
    const [tenants] = await db.pool.execute('SELECT * FROM tenants ORDER BY created_at DESC');
    res.render('super_admin/dashboard', { tenants, username: req.session.masterAdminUsername, success: req.query.success || null });
});

// GET Add Tenant Form
router.get('/admin/tenants/new', isSuperAdmin, (req, res) => {
    res.render('super_admin/tenant_add', { error: null });
});

// POST Create Tenant (info + optional logo upload)
router.post('/admin/tenants/new', isSuperAdmin, (req, res) => {
    upload.single('logo')(req, res, async (err) => {
        if (err) {
            return res.render('super_admin/tenant_add', { error: 'Logo upload failed: ' + err.message });
        }

        const { name, school_name, subdomain, custom_domain, status, primary_color, secondary_color, admin_username, admin_password } = req.body;
        const enable_donations_module = req.body.enable_donations_module === 'on' ? 1 : 0;
        const enable_hifz_module      = req.body.enable_hifz_module === 'on' ? 1 : 0;
        const logo_url = req.file ? `/images/logos/${req.file.filename}` : '/images/default_logo.png';

        try {
            const connection = await db.pool.getConnection();
            try {
                await connection.beginTransaction();

                const [result] = await connection.execute(
                    `INSERT INTO tenants (name, school_name, subdomain, custom_domain, status, primary_color, secondary_color, enable_donations_module, enable_hifz_module, logo_url) 
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                    [name, school_name, subdomain, custom_domain || null, status, primary_color, secondary_color, enable_donations_module, enable_hifz_module, logo_url]
                );
                const tenantId = result.insertId;

                const hashedPwd = await bcrypt.hash(admin_password, 10);
                await connection.execute(
                    `INSERT INTO users (tenant_id, username, password, role) VALUES (?, ?, ?, 'admin')`,
                    [tenantId, admin_username, hashedPwd]
                );

                await connection.commit();
                res.redirect('/admin?success=Tenant created successfully');
            } catch (innerErr) {
                await connection.rollback();
                throw innerErr;
            } finally {
                connection.release();
            }
        } catch (dbErr) {
            console.error('Error creating tenant:', dbErr);
            res.render('super_admin/tenant_add', { error: 'Database error: ' + dbErr.message });
        }
    });
});

// GET Edit Tenant Form
router.get('/admin/tenants/:id/edit', isSuperAdmin, async (req, res) => {
    const [rows] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [req.params.id]);
    if (rows.length === 0) return res.status(404).send('Tenant not found');
    res.render('super_admin/tenant_edit', { tenant: rows[0], error: null });
});

// POST Update Tenant (info + optional logo upload)
router.post('/admin/tenants/:id', isSuperAdmin, (req, res) => {
    upload.single('logo')(req, res, async (err) => {
        if (err) {
            const [rows] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [req.params.id]);
            return res.render('super_admin/tenant_edit', { tenant: rows[0], error: 'Logo upload failed: ' + err.message });
        }

        const { school_name, subdomain, custom_domain, status, primary_color, secondary_color } = req.body;
        const enable_donations_module = req.body.enable_donations_module === 'on' ? 1 : 0;
        const enable_hifz_module      = req.body.enable_hifz_module === 'on' ? 1 : 0;

        const fields = [school_name, subdomain, custom_domain || null, status, primary_color, secondary_color,
                        enable_donations_module, enable_hifz_module];
        let sql = `UPDATE tenants SET school_name = ?, subdomain = ?, custom_domain = ?, status = ?, 
                   primary_color = ?, secondary_color = ?,
                   enable_donations_module = ?, enable_hifz_module = ?`;

        if (req.file) {
            sql += `, logo_url = ?`;
            fields.push(`/images/logos/${req.file.filename}`);
        }
        sql += ` WHERE id = ?`;
        fields.push(req.params.id);

        await db.pool.execute(sql, fields);
        res.redirect('/admin?success=Tenant updated successfully');
    });
});

// POST Delete Tenant
router.post('/admin/tenants/:id/delete', isSuperAdmin, async (req, res) => {
    const tenantId = req.params.id;
    const connection = await db.pool.getConnection();
    try {
        await connection.beginTransaction();
        
        // Manually delete dependent records that have ON DELETE RESTRICT to classes/sessions
        await connection.execute('DELETE FROM hifz_enrollment WHERE tenant_id = ?', [tenantId]);
        await connection.execute('DELETE FROM student_enrollments WHERE tenant_id = ?', [tenantId]);
        await connection.execute('DELETE FROM periods WHERE tenant_id = ?', [tenantId]);
        
        // Now safely delete the tenant and cascade the rest
        await connection.execute('DELETE FROM tenants WHERE id = ?', [tenantId]);
        
        await connection.commit();
        res.redirect('/admin?success=Tenant deleted successfully');
    } catch (err) {
        await connection.rollback();
        console.error('Error deleting tenant:', err);
        res.redirect('/admin?success=Error deleting tenant');
    } finally {
        connection.release();
    }
});

module.exports = router;
