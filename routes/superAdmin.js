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
    res.render('super_admin/dashboard', { 
        tenants, 
        username: req.session.masterAdminUsername, 
        success: req.query.success || null,
        error: req.query.error || null
    });
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
        res.redirect('/admin?error=' + encodeURIComponent('Deletion failed: ' + err.message));
    } finally {
        connection.release();
    }
});

// ============================================================
// SaaS Contracts & Billing
// ============================================================

// GET Contract Form
router.get('/admin/tenants/:id/contract', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [[tenant]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        if (!tenant) return res.redirect('/admin?error=Tenant not found');

        const [[contract]] = await db.pool.execute('SELECT * FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        res.render('super_admin/tenant_contract_form', { 
            title: 'Manage Contract - ' + tenant.name, 
            tenant, 
            contract: contract || {}, 
            error: req.query.error, 
            success: req.query.success 
        });
    } catch (err) {
        console.error('Error loading contract form:', err);
        res.redirect('/admin?error=Database error');
    }
});

// POST Save Contract
router.post('/admin/tenants/:id/contract', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const {
            rate_per_student, contract_start_date, free_trial_start, free_trial_end,
            billing_start_date, max_students_allowed, support_sla, cancellation_notice_days, data_retention_days
        } = req.body;

        const [[existing]] = await db.pool.execute('SELECT id FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);

        if (existing) {
            await db.pool.execute(`
                UPDATE tenant_contracts SET 
                rate_per_student=?, contract_start_date=?, free_trial_start=?, free_trial_end=?,
                billing_start_date=?, max_students_allowed=?, support_sla=?, cancellation_notice_days=?, data_retention_days=?
                WHERE tenant_id=?
            `, [
                rate_per_student || 0, contract_start_date, free_trial_start || null, free_trial_end || null,
                billing_start_date, max_students_allowed || 500, support_sla || 'Standard 24h', cancellation_notice_days || 30, data_retention_days || 30,
                tenantId
            ]);
        } else {
            await db.pool.execute(`
                INSERT INTO tenant_contracts 
                (tenant_id, rate_per_student, contract_start_date, free_trial_start, free_trial_end, billing_start_date, max_students_allowed, support_sla, cancellation_notice_days, data_retention_days)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `, [
                tenantId, rate_per_student || 0, contract_start_date, free_trial_start || null, free_trial_end || null,
                billing_start_date, max_students_allowed || 500, support_sla || 'Standard 24h', cancellation_notice_days || 30, data_retention_days || 30
            ]);
        }
        res.redirect(`/admin/tenants/${tenantId}/contract?success=Contract updated successfully`);
    } catch (err) {
        console.error('Error saving contract:', err);
        res.redirect(`/admin/tenants/${req.params.id}/contract?error=Failed to save contract`);
    }
});

// GET View Printable Contract
router.get('/admin/tenants/:id/contract/view', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [[tenant]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        const [[contract]] = await db.pool.execute('SELECT * FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        if (!tenant || !contract) {
            return res.redirect(`/admin/tenants/${tenantId}/contract?error=Please generate a contract first`);
        }

        res.render('super_admin/tenant_contract_document', { 
            title: 'SaaS Contract - ' + tenant.name, 
            tenant, 
            contract 
        });
    } catch (err) {
        console.error('Error viewing contract:', err);
        res.redirect('/admin?error=Database error');
    }
});

// GET Billing Dashboard
router.get('/admin/tenants/:id/billing', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [[tenant]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        if (!tenant) return res.redirect('/admin?error=Tenant not found');

        const [invoices] = await db.pool.execute('SELECT * FROM tenant_invoices WHERE tenant_id = ? ORDER BY issue_date DESC', [tenantId]);
        const [payments] = await db.pool.execute('SELECT p.*, i.invoice_number FROM tenant_payments p JOIN tenant_invoices i ON p.invoice_id = i.id WHERE p.tenant_id = ? ORDER BY p.payment_date DESC', [tenantId]);
        const [[contract]] = await db.pool.execute('SELECT * FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        // Count active students for dynamic invoice generation
        const [[studentCount]] = await db.pool.execute("SELECT COUNT(*) as count FROM students WHERE tenant_id = ? AND status = 'active'", [tenantId]);
        
        res.render('super_admin/tenant_billing', { 
            title: 'Billing - ' + tenant.name, 
            tenant, 
            invoices,
            payments,
            contract,
            activeStudents: studentCount.count,
            error: req.query.error, 
            success: req.query.success 
        });
    } catch (err) {
        console.error('Error loading billing:', err);
        res.redirect('/admin?error=Database error');
    }
});

// POST Generate Invoice
router.post('/admin/tenants/:id/invoices/generate', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const { billing_period_start, billing_period_end, issue_date, due_date, total_students_billed, discount, notes } = req.body;
        
        const [[contract]] = await db.pool.execute('SELECT rate_per_student FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        const rate = contract ? parseFloat(contract.rate_per_student) : 0;
        
        const subtotal = rate * parseInt(total_students_billed);
        const disc = parseFloat(discount || 0);
        const total = subtotal - disc;
        
        const invoiceNumber = 'INV-' + tenantId + '-' + Date.now().toString().slice(-6);

        await db.pool.execute(`
            INSERT INTO tenant_invoices 
            (tenant_id, invoice_number, billing_period_start, billing_period_end, issue_date, due_date, total_students_billed, subtotal, discount, total_amount_pkr, status, notes)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Sent', ?)
        `, [
            tenantId, invoiceNumber, billing_period_start, billing_period_end, issue_date, due_date, 
            total_students_billed, subtotal, disc, total, notes || ''
        ]);

        res.redirect(`/admin/tenants/${tenantId}/billing?success=Invoice generated successfully`);
    } catch (err) {
        console.error('Error generating invoice:', err);
        res.redirect(`/admin/tenants/${req.params.id}/billing?error=Failed to generate invoice`);
    }
});

// POST Add Payment
router.post('/admin/tenants/:id/payments/add', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const { invoice_id, payment_date, amount_paid, payment_method, reference_number, notes } = req.body;

        await db.pool.execute(`
            INSERT INTO tenant_payments (tenant_id, invoice_id, payment_date, amount_paid, payment_method, reference_number, notes)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        `, [tenantId, invoice_id, payment_date, amount_paid, payment_method, reference_number || '', notes || '']);

        // Check if fully paid
        const [[invoice]] = await db.pool.execute('SELECT total_amount_pkr FROM tenant_invoices WHERE id = ?', [invoice_id]);
        const [[paid]] = await db.pool.execute('SELECT SUM(amount_paid) as total_paid FROM tenant_payments WHERE invoice_id = ?', [invoice_id]);
        
        if (paid.total_paid >= invoice.total_amount_pkr) {
            await db.pool.execute("UPDATE tenant_invoices SET status = 'Paid' WHERE id = ?", [invoice_id]);
        }

        res.redirect(`/admin/tenants/${tenantId}/billing?success=Payment recorded successfully`);
    } catch (err) {
        console.error('Error adding payment:', err);
        res.redirect(`/admin/tenants/${req.params.id}/billing?error=Failed to record payment`);
    }
});

// GET View Printable Invoice
router.get('/admin/tenants/:id/invoices/:invoiceId/view', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const invoiceId = req.params.invoiceId;
        
        const [[tenant]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        const [[invoice]] = await db.pool.execute('SELECT * FROM tenant_invoices WHERE id = ? AND tenant_id = ?', [invoiceId, tenantId]);
        const [[contract]] = await db.pool.execute('SELECT * FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        if (!tenant || !invoice) {
            return res.redirect(`/admin/tenants/${tenantId}/billing?error=Invoice not found`);
        }

        res.render('super_admin/tenant_invoice_document', { 
            title: 'Invoice - ' + invoice.invoice_number, 
            tenant, 
            invoice,
            contract
        });
    } catch (err) {
        console.error('Error viewing invoice:', err);
        res.redirect('/admin?error=Database error');
    }
});

module.exports = router;
