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
        const fields = [school_name, subdomain, custom_domain || null, status, primary_color, secondary_color];
        let sql = `UPDATE tenants SET school_name = ?, subdomain = ?, custom_domain = ?, status = ?, primary_color = ?, secondary_color = ?`;

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

module.exports = router;
