const express = require('express');
const router = express.Router();
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const bcrypt = require('bcryptjs');
const { generateGeminiContent } = require('../utils/geminiHelper');
const db = require('../db');
const { isSuperAdmin, isOnlySuperAdmin } = require('../middleware/auth');
const { parseInsightText } = require('../utils/formatInsight');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

// Strict Domain Isolation: Prevent tenants from accessing super admin routes
router.use((req, res, next) => {
    if (req.path.startsWith('/admin') && !req.isSuperAdminSite) {
        return res.status(404).send('Not Found');
    }
    next();
});

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
            if (rows[0].is_active === 0) {
                return res.render('super_admin/login', { error: 'Account is deactivated. Please contact Super Admin.' });
            }
            req.session.masterAdminId = rows[0].id;
            req.session.masterAdminUsername = rows[0].username;
            req.session.masterAdminRole = rows[0].role || 'super_admin';

            return req.session.save(() => {
                if (rows[0].role === 'sales_rep') {
                    res.redirect('/admin/crm/leads');
                } else if (rows[0].role === 'support_agent') {
                    res.redirect('/admin/support/tickets');
                } else {
                    res.redirect('/admin');
                }
            });
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

// POST /admin/change-password — Master Admin / Sales Rep Change Password
router.post('/admin/change-password', isSuperAdmin, async (req, res) => {
    try {
        const masterId = req.session.masterAdminId;
        const { current_password, new_password, confirm_password } = req.body;

        if (!current_password || !new_password || !confirm_password) {
            return res.redirect('/admin/crm/leads?error=All password fields are required.');
        }

        if (new_password !== confirm_password) {
            return res.redirect('/admin/crm/leads?error=New password and confirmation do not match.');
        }

        if (new_password.length < 6) {
            return res.redirect('/admin/crm/leads?error=New password must be at least 6 characters long.');
        }

        const [[adminRow]] = await db.pool.execute('SELECT password FROM master_admins WHERE id = ?', [masterId]);
        if (!adminRow) {
            return res.redirect('/admin/login');
        }

        const match = await bcrypt.compare(current_password, adminRow.password);
        if (!match) {
            return res.redirect('/admin/crm/leads?error=Current password is incorrect.');
        }

        const hashed = await bcrypt.hash(new_password, 10);
        await db.pool.execute('UPDATE master_admins SET password = ? WHERE id = ?', [hashed, masterId]);

        res.redirect('/admin/crm/leads?success=Password updated successfully!');
    } catch (err) {
        console.error('Master Admin Change Password Error:', err);
        res.redirect('/admin/crm/leads?error=Error updating password.');
    }
});

// GET Tenant Dashboard (list)
router.get('/admin', isOnlySuperAdmin, async (req, res) => {
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

        const { name, school_name, subdomain, custom_domain, status, primary_color, secondary_color, admin_username, admin_password, address, contact_phone, contact_email } = req.body;
        const enable_donations_module = req.body.enable_donations_module === 'on' ? 1 : 0;
        const enable_hifz_module      = req.body.enable_hifz_module === 'on' ? 1 : 0;
        const feature_ocr_student     = req.body.feature_ocr_student === 'on' ? 1 : 0;
        const feature_ocr_hifz        = req.body.feature_ocr_hifz === 'on' ? 1 : 0;
        const logo_url = req.file ? `/images/logos/${req.file.filename}` : '/images/default_logo.png';

        try {
            const connection = await db.pool.getConnection();
            try {
                await connection.beginTransaction();

                const [result] = await connection.execute(
                    `INSERT INTO tenants (name, school_name, subdomain, custom_domain, status, primary_color, secondary_color, enable_donations_module, enable_hifz_module, feature_ocr_student, feature_ocr_hifz, logo_url, address, contact_phone, contact_email) 
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                    [name, school_name, subdomain, custom_domain || null, status, primary_color, secondary_color, enable_donations_module, enable_hifz_module, feature_ocr_student, feature_ocr_hifz, logo_url, address || null, contact_phone || null, contact_email || null]
                );
                const tenantId = result.insertId;

                // Create default Admin role
                const [roleResult] = await connection.execute(
                    `INSERT INTO roles (name, tenant_id) VALUES ('Admin', ?)`,
                    [tenantId]
                );
                const roleId = roleResult.insertId;

                // Add default permissions for the Admin role
                const permissions = [
                    'Dashboard', 'Students', 'Employees', 'Fees', 
                    'Donations', 'Attendance', 'Ledgers', 'Hifz', 'Settings'
                ];
                for (const perm of permissions) {
                    await connection.execute(
                        `INSERT INTO role_permissions (role_id, function_name, allowed, tenant_id) VALUES (?, ?, 1, ?)`,
                        [roleId, perm, tenantId]
                    );
                }

                // Create default admin user linked to the Admin role
                const hashedPwd = await bcrypt.hash(admin_password, 10);
                await connection.execute(
                    `INSERT INTO users (tenant_id, username, password, role_id) VALUES (?, ?, ?, ?)`,
                    [tenantId, admin_username, hashedPwd, roleId]
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

        const { school_name, subdomain, custom_domain, status, primary_color, secondary_color, address, contact_phone, contact_email } = req.body;
        const enable_donations_module = req.body.enable_donations_module === 'on' ? 1 : 0;
        const enable_hifz_module      = req.body.enable_hifz_module === 'on' ? 1 : 0;
        const feature_ocr_student     = req.body.feature_ocr_student === 'on' ? 1 : 0;
        const feature_ocr_hifz        = req.body.feature_ocr_hifz === 'on' ? 1 : 0;

        const fields = [school_name, subdomain, custom_domain || null, status, primary_color, secondary_color,
                        enable_donations_module, enable_hifz_module, feature_ocr_student, feature_ocr_hifz, address || null, contact_phone || null, contact_email || null];
        let sql = `UPDATE tenants SET school_name = ?, subdomain = ?, custom_domain = ?, status = ?, 
                   primary_color = ?, secondary_color = ?,
                   enable_donations_module = ?, enable_hifz_module = ?,
                   feature_ocr_student = ?, feature_ocr_hifz = ?,
                   address = ?, contact_phone = ?, contact_email = ?`;

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

// GET Impersonate Tenant
router.get('/admin/impersonate/:id', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [tenants] = await db.pool.execute('SELECT subdomain FROM tenants WHERE id = ?', [tenantId]);
        if (tenants.length === 0) return res.status(404).send('Tenant not found');

        const tenant = tenants[0];
        
        // Generate a random token using crypto
        const crypto = require('crypto');
        const token = crypto.randomBytes(32).toString('hex');
        
        // Insert the token (master_admin_id comes from req.session.masterAdminId)
        await db.pool.execute(
            'INSERT INTO impersonation_tokens (token, master_admin_id, tenant_id) VALUES (?, ?, ?)',
            [token, req.session.masterAdminId, tenantId]
        );

        // Construct target URL
        const baseHost = req.headers.host.replace('admin.', '');
        const targetUrl = `${req.protocol}://${tenant.subdomain}.${baseHost}/impersonate?token=${token}`;
        
        res.redirect(targetUrl);
    } catch (err) {
        console.error('Impersonation error:', err);
        res.status(500).send('Internal Server Error');
    }
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
            rate_per_student, base_students_threshold, base_amount, extra_student_rate,
            contract_start_date, free_trial_start, free_trial_end,
            billing_start_date, max_students_allowed, support_sla, cancellation_notice_days, data_retention_days
        } = req.body;

        const [[existing]] = await db.pool.execute('SELECT id, status FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);

        if (existing && existing.status === 'Finalized') {
            return res.redirect(`/admin/tenants/${tenantId}/contract?error=Cannot edit a finalized contract`);
        }

        if (existing) {
            await db.pool.execute(`
                UPDATE tenant_contracts SET 
                rate_per_student=?, base_students_threshold=?, base_amount=?, extra_student_rate=?,
                contract_start_date=?, free_trial_start=?, free_trial_end=?,
                billing_start_date=?, max_students_allowed=?, support_sla=?, cancellation_notice_days=?, data_retention_days=?
                WHERE tenant_id=?
            `, [
                rate_per_student || 0, base_students_threshold || 100, base_amount || 1000, extra_student_rate || 5,
                contract_start_date, free_trial_start || null, free_trial_end || null,
                billing_start_date, max_students_allowed || 500, support_sla || 'Standard 24h', cancellation_notice_days || 30, data_retention_days || 30,
                tenantId
            ]);
        } else {
            await db.pool.execute(`
                INSERT INTO tenant_contracts 
                (tenant_id, rate_per_student, base_students_threshold, base_amount, extra_student_rate,
                 contract_start_date, free_trial_start, free_trial_end, billing_start_date, max_students_allowed, support_sla, cancellation_notice_days, data_retention_days)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `, [
                tenantId, rate_per_student || 0, base_students_threshold || 100, base_amount || 1000, extra_student_rate || 5,
                contract_start_date, free_trial_start || null, free_trial_end || null,
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

// GET View Printable Contract (PDF via Puppeteer/Python script)
router.get('/admin/tenants/:id/contract/pdf', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [[tenant]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [tenantId]);
        const [[contract]] = await db.pool.execute('SELECT * FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        if (!tenant || !contract) {
            return res.redirect(`/admin/tenants/${tenantId}/contract?error=Please generate a contract first`);
        }

        const tenantForPdf = { ...tenant, logo_url: resolvePublicAsset(tenant.logo_url) };

        renderPdf(res, {
            templateName: 'super_admin/tenant_contract_document',
            data: { 
                title: 'SaaS Contract - ' + tenant.name, 
                tenant: tenantForPdf, 
                contract,
                isPdf: true
            },
            fileBaseName: `contract-${tenantId}`,
            downloadName: `SaaS-Contract-${tenant.school_name.replace(/[^a-zA-Z0-9]/g, '_')}.pdf`
        });
    } catch (err) {
        console.error('Error generating contract PDF:', err);
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
        
        const [[contract]] = await db.pool.execute('SELECT base_students_threshold, base_amount, extra_student_rate, rate_per_student FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        
        let subtotal = 0;
        const students = parseInt(total_students_billed) || 0;
        
        if (contract) {
            if (contract.base_amount > 0) {
                subtotal = parseFloat(contract.base_amount);
                if (students > contract.base_students_threshold) {
                    subtotal += (students - contract.base_students_threshold) * parseFloat(contract.extra_student_rate);
                }
            } else {
                subtotal = parseFloat(contract.rate_per_student || 0) * students;
            }
        }
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

// POST Delete Invoice
router.post('/admin/tenants/:id/invoices/:invoiceId/delete', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const invoiceId = req.params.invoiceId;
        
        const [[invoice]] = await db.pool.execute('SELECT status FROM tenant_invoices WHERE id = ? AND tenant_id = ?', [invoiceId, tenantId]);
        
        if (!invoice) return res.redirect(`/admin/tenants/${tenantId}/billing?error=Invoice not found`);
        if (invoice.status === 'Paid') {
            return res.redirect(`/admin/tenants/${tenantId}/billing?error=Cannot delete a paid invoice`);
        }

        await db.pool.execute('DELETE FROM tenant_invoices WHERE id = ? AND tenant_id = ?', [invoiceId, tenantId]);
        res.redirect(`/admin/tenants/${tenantId}/billing?success=Invoice deleted successfully`);
    } catch (err) {
        console.error('Error deleting invoice:', err);
        res.redirect(`/admin/tenants/${req.params.id}/billing?error=Failed to delete invoice`);
    }
});

// POST Finalize Contract
router.post('/admin/tenants/:id/contract/finalize', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        await db.pool.execute("UPDATE tenant_contracts SET status = 'Finalized' WHERE tenant_id = ?", [tenantId]);
        res.redirect(`/admin/tenants/${tenantId}/contract?success=Contract finalized successfully`);
    } catch (err) {
        console.error('Error finalizing contract:', err);
        res.redirect(`/admin/tenants/${req.params.id}/contract?error=Failed to finalize contract`);
    }
});

// POST Delete Contract
router.post('/admin/tenants/:id/contract/delete', isSuperAdmin, async (req, res) => {
    try {
        const tenantId = req.params.id;
        const [[contract]] = await db.pool.execute('SELECT status FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        if (!contract) return res.redirect(`/admin/tenants/${tenantId}/contract?error=Contract not found`);
        
        if (contract.status === 'Finalized') {
            return res.redirect(`/admin/tenants/${tenantId}/contract?error=Cannot delete a finalized contract`);
        }

        await db.pool.execute('DELETE FROM tenant_contracts WHERE tenant_id = ?', [tenantId]);
        res.redirect(`/admin/tenants/${tenantId}/contract?success=Contract deleted successfully`);
    } catch (err) {
        console.error('Error deleting contract:', err);
        res.redirect(`/admin/tenants/${req.params.id}/contract?error=Failed to delete contract`);
    }
});

// ============================================================
// SUPER ADMIN CRM & SALES LEADS MODULE
// ============================================================

let crmSchemaEnsured = false;
async function ensureCrmSchema() {
    if (crmSchemaEnsured) return;
    try {
        await db.pool.execute(`
            ALTER TABLE master_admins
            ADD COLUMN role ENUM('super_admin', 'sales_rep') NOT NULL DEFAULT 'super_admin',
            ADD COLUMN name VARCHAR(150) NULL,
            ADD COLUMN phone VARCHAR(50) NULL,
            ADD COLUMN is_active TINYINT(1) DEFAULT 1,
            ADD COLUMN commission_rate DECIMAL(5,2) DEFAULT 0.00
        `).catch(() => {});

        await db.pool.execute(`
            CREATE TABLE IF NOT EXISTS crm_leads (
              id INT AUTO_INCREMENT PRIMARY KEY,
              school_name VARCHAR(255) NOT NULL,
              contact_person VARCHAR(150) NOT NULL,
              designation VARCHAR(100) NULL,
              phone VARCHAR(50) NOT NULL,
              email VARCHAR(255) NULL,
              address TEXT NULL,
              city VARCHAR(100) NULL,
              est_students INT DEFAULT 0,
              current_system VARCHAR(150) NULL,
              assigned_to INT NULL,
              status ENUM('new', 'contacted', 'meeting_scheduled', 'demo_given', 'negotiation', 'won', 'lost') DEFAULT 'new',
              lead_source VARCHAR(100) NULL,
              agreed_setup_fee DECIMAL(10,2) DEFAULT 0.00,
              agreed_monthly_rate DECIMAL(10,2) DEFAULT 0.00,
              agreed_rate_per_student DECIMAL(10,2) DEFAULT 0.00,
              rep_commission_pct DECIMAL(5,2) DEFAULT 0.00,
              rep_commission_flat DECIMAL(10,2) DEFAULT 0.00,
              converted_tenant_id INT NULL,
              notes TEXT NULL,
              next_meeting_date DATETIME NULL,
              next_meeting_agenda VARCHAR(255) NULL,
              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              CONSTRAINT fk_crm_leads_assigned_to FOREIGN KEY (assigned_to) REFERENCES master_admins (id) ON DELETE SET NULL,
              CONSTRAINT fk_crm_leads_converted_tenant FOREIGN KEY (converted_tenant_id) REFERENCES tenants (id) ON DELETE SET NULL
            ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
        `).catch(() => {});

        const columnsToAdd = [
            `ALTER TABLE crm_leads ADD COLUMN next_meeting_date DATETIME NULL`,
            `ALTER TABLE crm_leads ADD COLUMN next_meeting_agenda VARCHAR(255) NULL`,
            `ALTER TABLE crm_leads ADD COLUMN agreed_setup_fee DECIMAL(10,2) DEFAULT 0.00`,
            `ALTER TABLE crm_leads ADD COLUMN agreed_monthly_rate DECIMAL(10,2) DEFAULT 0.00`,
            `ALTER TABLE crm_leads ADD COLUMN agreed_rate_per_student DECIMAL(10,2) DEFAULT 0.00`,
            `ALTER TABLE crm_leads ADD COLUMN rep_commission_pct DECIMAL(5,2) DEFAULT 0.00`,
            `ALTER TABLE crm_leads ADD COLUMN rep_commission_flat DECIMAL(10,2) DEFAULT 0.00`,
            `ALTER TABLE crm_leads ADD COLUMN group_director VARCHAR(255) NULL`,
            `ALTER TABLE crm_leads ADD COLUMN referred_by_contact VARCHAR(255) NULL`
        ];
        for (const colSql of columnsToAdd) {
            try { await db.pool.execute(colSql); } catch (e) {}
        }

        await db.pool.execute(`
            CREATE TABLE IF NOT EXISTS crm_meetings (
              id INT AUTO_INCREMENT PRIMARY KEY,
              lead_id INT NOT NULL,
              rep_id INT NOT NULL,
              meeting_date DATETIME NOT NULL,
              meeting_type ENUM('in_person_visit', 'phone_call', 'video_demo', 'follow_up') DEFAULT 'in_person_visit',
              person_met VARCHAR(150) NULL,
              discussion_notes TEXT NOT NULL,
              client_demands TEXT NULL,
              outcome ENUM('positive', 'neutral', 'requires_followup', 'demo_requested', 'deal_closed', 'rejected') DEFAULT 'requires_followup',
              next_meeting_date DATETIME NULL,
              next_meeting_agenda VARCHAR(255) NULL,
              expense_amount DECIMAL(10,2) DEFAULT 0.00,
              expense_notes VARCHAR(255) NULL,
              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              CONSTRAINT fk_crm_meetings_lead FOREIGN KEY (lead_id) REFERENCES crm_leads (id) ON DELETE CASCADE,
              CONSTRAINT fk_crm_meetings_rep FOREIGN KEY (rep_id) REFERENCES master_admins (id) ON DELETE CASCADE
            ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
        `).catch(() => {});

        await db.pool.execute(`
            CREATE TABLE IF NOT EXISTS crm_rep_finances (
              id INT AUTO_INCREMENT PRIMARY KEY,
              rep_id INT NOT NULL,
              transaction_type ENUM('disbursement', 'expense_claim', 'commission_payout') NOT NULL,
              amount DECIMAL(10,2) NOT NULL,
              transaction_date DATE NOT NULL,
              description VARCHAR(255) NOT NULL,
              receipt_url VARCHAR(255) NULL,
              created_by INT NOT NULL,
              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              CONSTRAINT fk_crm_finances_rep FOREIGN KEY (rep_id) REFERENCES master_admins (id) ON DELETE CASCADE,
              CONSTRAINT fk_crm_finances_created_by FOREIGN KEY (created_by) REFERENCES master_admins (id) ON DELETE CASCADE
            ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
        `).catch(() => {});

        await db.pool.execute(`
            CREATE TABLE IF NOT EXISTS crm_lead_handoffs (
              id INT AUTO_INCREMENT PRIMARY KEY,
              lead_id INT NOT NULL,
              from_rep_id INT NULL,
              to_rep_id INT NOT NULL,
              handed_off_by INT NOT NULL,
              note VARCHAR(255) NULL,
              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              CONSTRAINT fk_crm_handoffs_lead FOREIGN KEY (lead_id) REFERENCES crm_leads (id) ON DELETE CASCADE,
              CONSTRAINT fk_crm_handoffs_from_rep FOREIGN KEY (from_rep_id) REFERENCES master_admins (id) ON DELETE SET NULL,
              CONSTRAINT fk_crm_handoffs_to_rep FOREIGN KEY (to_rep_id) REFERENCES master_admins (id) ON DELETE CASCADE,
              CONSTRAINT fk_crm_handoffs_by FOREIGN KEY (handed_off_by) REFERENCES master_admins (id) ON DELETE CASCADE
            ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
        `).catch(() => {});

        crmSchemaEnsured = true;
    } catch (err) {
        console.error('CRM Schema self-heal note:', err.message);
    }
}

// GET /admin/crm/prescreening — List all scraped pending leads
router.get('/admin/crm/prescreening', isSuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const [scraped_leads] = await db.pool.execute("SELECT * FROM crm_scraped_leads WHERE status = 'pending' ORDER BY created_at DESC");
        const [reps] = await db.pool.execute("SELECT id, username, name FROM master_admins WHERE is_active = 1 AND role = 'sales_rep' ORDER BY name");
        
        res.render('super_admin/crm_prescreening', {
            scraped_leads,
            reps,
            activeTab: 'prescreening',
            username: req.session.masterAdminUsername,
            role: req.session.masterAdminRole || 'super_admin',
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error('Prescreening Leads Error:', err);
        res.redirect('/admin?error=Error loading prescreening leads');
    }
});

// POST /admin/crm/prescreening/:id/convert — Convert a scraped lead to actual lead
router.post('/admin/crm/prescreening/:id/convert', isSuperAdmin, async (req, res) => {
    const connection = await db.pool.getConnection();
    try {
        await connection.beginTransaction();
        const leadId = req.params.id;
        const { assigned_to, contact_person, est_students, notes } = req.body;
        
        const [[scraped_lead]] = await connection.execute("SELECT * FROM crm_scraped_leads WHERE id = ?", [leadId]);
        if (!scraped_lead || scraped_lead.status !== 'pending') {
            return res.redirect('/admin/crm/prescreening?error=Lead not found or already processed');
        }

        // Insert into crm_leads
        await connection.execute(`
            INSERT INTO crm_leads (school_name, phone, address, city, lead_source, status, assigned_to, contact_person, est_students, notes)
            VALUES (?, ?, ?, ?, ?, 'new', ?, ?, ?, ?)
        `, [
            scraped_lead.school_name,
            scraped_lead.phone || '',
            scraped_lead.address || '',
            scraped_lead.city || '',
            'Automated Scraper',
            assigned_to || null,
            contact_person || 'Unknown',
            est_students || 0,
            notes || ''
        ]);

        // Update scraped lead status
        await connection.execute("UPDATE crm_scraped_leads SET status = 'converted' WHERE id = ?", [leadId]);
        
        await connection.commit();
        res.redirect('/admin/crm/prescreening?success=Lead successfully converted');
    } catch (err) {
        await connection.rollback();
        console.error('Convert Scraped Lead Error:', err);
        res.redirect('/admin/crm/prescreening?error=Failed to convert lead');
    } finally {
        connection.release();
    }
});

// POST /admin/crm/prescreening/:id/reject — Reject a scraped lead
router.post('/admin/crm/prescreening/:id/reject', isSuperAdmin, async (req, res) => {
    try {
        await db.pool.execute("UPDATE crm_scraped_leads SET status = 'rejected' WHERE id = ?", [req.params.id]);
        res.redirect('/admin/crm/prescreening?success=Lead rejected successfully');
    } catch (err) {
        console.error('Reject Scraped Lead Error:', err);
        res.redirect('/admin/crm/prescreening?error=Failed to reject lead');
    }
});

// GET /admin/crm/leads — List all leads & pipeline overview
router.get('/admin/crm/leads', isSuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        const { search, status, rep_id } = req.query;
        let querySql = `
            SELECT l.*, m.name as rep_name, m.username as rep_username
            FROM crm_leads l
            LEFT JOIN master_admins m ON l.assigned_to = m.id
            WHERE 1=1
        `;
        const params = [];

        if (userRole === 'sales_rep') {
            querySql += ` AND l.assigned_to = ?`;
            params.push(userId);
        } else if (rep_id) {
            querySql += ` AND l.assigned_to = ?`;
            params.push(rep_id);
        }

        if (search) {
            querySql += ` AND (l.school_name LIKE ? OR l.contact_person LIKE ? OR l.city LIKE ? OR l.phone LIKE ?)`;
            const s = `%${search.trim()}%`;
            params.push(s, s, s, s);
        }
        if (status) {
            querySql += ` AND l.status = ?`;
            params.push(status);
        }

        querySql += ` ORDER BY l.updated_at DESC`;

        const [leads] = await db.pool.execute(querySql, params);
        const [reps] = await db.pool.execute(`SELECT id, username, name FROM master_admins WHERE is_active = 1 ORDER BY name`);

        // Compute Stats based on user role scope
        let totalSql = `SELECT COUNT(*) as cnt FROM crm_leads`;
        let activeMtgSql = `SELECT COUNT(*) as cnt FROM crm_leads WHERE (status = 'meeting_scheduled' OR next_meeting_date >= NOW())`;
        let wonSql = `SELECT COUNT(*) as cnt FROM crm_leads WHERE status = 'won'`;
        let valSql = `SELECT SUM(agreed_monthly_rate + agreed_setup_fee) as val FROM crm_leads WHERE status != 'lost'`;
        
        const statParams = [];
        if (userRole === 'sales_rep') {
            totalSql += ` WHERE assigned_to = ?`;
            activeMtgSql += ` AND assigned_to = ?`;
            wonSql += ` AND assigned_to = ?`;
            valSql += ` AND assigned_to = ?`;
            statParams.push(userId);
        }

        const [totalRows] = await db.pool.execute(totalSql, statParams);
        const [activeMtgRows] = await db.pool.execute(activeMtgSql, statParams);
        const [wonRows] = await db.pool.execute(wonSql, statParams);
        const [valRows] = await db.pool.execute(valSql, statParams);

        const stats = {
            totalLeads: totalRows[0]?.cnt || 0,
            activeMeetings: activeMtgRows[0]?.cnt || 0,
            wonLeads: wonRows[0]?.cnt || 0,
            pipelineValue: valRows[0]?.val || 0
        };

        res.render('super_admin/crm_leads_list', {
            leads,
            reps,
            stats,
            query: req.query,
            username: req.session.masterAdminUsername,
            role: userRole,
            success: req.query.success
        });
    } catch (err) {
        console.error('CRM Leads Error:', err);
        res.status(500).send('Error loading CRM leads.');
    }
});

// GET /admin/crm/referees — List all referees/lead sources
router.get('/admin/crm/referees', isSuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        const { search } = req.query;
        let querySql = `
            SELECT l.id, l.school_name, l.contact_person, l.phone as lead_phone, l.status, l.referred_by_contact, m.name as rep_name
            FROM crm_leads l
            LEFT JOIN master_admins m ON l.assigned_to = m.id
            WHERE l.referred_by_contact IS NOT NULL AND l.referred_by_contact != ''
        `;
        const params = [];

        if (userRole === 'sales_rep') {
            querySql += ` AND l.assigned_to = ?`;
            params.push(userId);
        }

        if (search) {
            querySql += ` AND (l.referred_by_contact LIKE ? OR l.school_name LIKE ?)`;
            const s = `%${search.trim()}%`;
            params.push(s, s);
        }

        querySql += ` ORDER BY l.updated_at DESC`;

        const [referees] = await db.pool.execute(querySql, params);

        res.render('super_admin/crm_referees', {
            referees,
            query: req.query,
            username: req.session.masterAdminUsername,
            role: userRole,
            success: req.query.success
        });
    } catch (err) {
        console.error('CRM Referees Error:', err);
        res.status(500).send('Error loading CRM referees.');
    }
});

// GET /admin/crm/leads/new — Add Lead Form
router.get('/admin/crm/leads/new', isSuperAdmin, async (req, res) => {
    try {
        const [reps] = await db.pool.execute(`SELECT id, username, name FROM master_admins WHERE is_active = 1 ORDER BY name`);
        res.render('super_admin/crm_lead_form', { isEdit: false, lead: {}, reps, username: req.session.masterAdminUsername });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading new lead form.');
    }
});

// POST /admin/crm/leads/new — Create Lead
router.post('/admin/crm/leads/new', isSuperAdmin, async (req, res) => {
    try {
        const { school_name, contact_person, designation, phone, email, address, city, est_students, current_system, assigned_to, status, lead_source, notes, group_director, referred_by_contact } = req.body;
        
        await db.pool.execute(
            `INSERT INTO crm_leads 
             (school_name, contact_person, designation, phone, email, address, city, est_students, current_system, assigned_to, status, lead_source, notes, group_director, referred_by_contact)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                school_name, contact_person, designation || null, phone, email || null,
                address || null, city, parseInt(est_students) || 0, current_system || null,
                assigned_to ? parseInt(assigned_to) : null, status || 'new', lead_source || null, notes || null,
                group_director || null, referred_by_contact || null
            ]
        );

        res.redirect('/admin/crm/leads?success=Lead created successfully');
    } catch (err) {
        console.error('Error creating lead:', err);
        res.status(500).send('Error creating lead.');
    }
});

// GET /admin/crm/leads/:id — Lead 360 View
router.get('/admin/crm/leads/:id', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        const [[lead]] = await db.pool.execute(
            `SELECT l.*, m.name as rep_name, m.username as rep_username
             FROM crm_leads l
             LEFT JOIN master_admins m ON l.assigned_to = m.id
             WHERE l.id = ?`,
            [leadId]
        );

        if (!lead) return res.status(404).send('Lead not found.');

        // Data Scope check for sales reps
        if (userRole === 'sales_rep' && lead.assigned_to != userId) {
            return res.status(403).send('Unauthorized. You can only view leads assigned to you.');
        }

        const [meetings] = await db.pool.execute(
            `SELECT mt.*, m.name as rep_name, m.username as rep_username
             FROM crm_meetings mt
             JOIN master_admins m ON mt.rep_id = m.id
             WHERE mt.lead_id = ?
             ORDER BY mt.meeting_date DESC`,
            [leadId]
        );

        const [reps] = await db.pool.execute(
            `SELECT id, username, name FROM master_admins WHERE is_active = 1 AND id != ? ORDER BY name`,
            [lead.assigned_to || 0]
        );

        const [handoffs] = await db.pool.execute(
            `SELECT h.*, fr.name as from_rep_name, tr.name as to_rep_name, hb.name as handed_off_by_name
             FROM crm_lead_handoffs h
             LEFT JOIN master_admins fr ON h.from_rep_id = fr.id
             JOIN master_admins tr ON h.to_rep_id = tr.id
             JOIN master_admins hb ON h.handed_off_by = hb.id
             WHERE h.lead_id = ?
             ORDER BY h.created_at DESC`,
            [leadId]
        );

        res.render('super_admin/crm_lead_view', {
            lead,
            meetings,
            reps,
            handoffs,
            username: req.session.masterAdminUsername,
            role: userRole,
            userId,
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error('Error viewing lead:', err);
        res.status(500).send('Error loading lead profile.');
    }
});

// GET /admin/crm/leads/:id/edit — Edit Lead Form
router.get('/admin/crm/leads/:id/edit', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        const [[lead]] = await db.pool.execute(`SELECT * FROM crm_leads WHERE id = ?`, [leadId]);
        if (!lead) return res.status(404).send('Lead not found.');

        // Data Scope check for sales reps
        if (userRole === 'sales_rep' && lead.assigned_to != userId) {
            return res.status(403).send('Unauthorized. You can only edit leads assigned to you.');
        }

        const [reps] = await db.pool.execute(`SELECT id, username, name FROM master_admins WHERE is_active = 1 ORDER BY name`);
        res.render('super_admin/crm_lead_form', { isEdit: true, lead, reps, username: req.session.masterAdminUsername, role: userRole });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading edit form.');
    }
});

// POST /admin/crm/leads/:id/edit — Update Lead
router.post('/admin/crm/leads/:id/edit', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;
        const { school_name, contact_person, designation, phone, email, address, city, est_students, current_system, assigned_to, status, lead_source, notes, group_director, referred_by_contact } = req.body;

        const [[existingLead]] = await db.pool.execute(`SELECT assigned_to FROM crm_leads WHERE id = ?`, [leadId]);
        if (!existingLead) return res.status(404).send('Lead not found.');

        // Data Scope check for sales reps
        if (userRole === 'sales_rep' && existingLead.assigned_to != userId) {
            return res.status(403).send('Unauthorized. You can only edit leads assigned to you.');
        }

        // Sales reps cannot reassign ownership here — use the dedicated Hand Off action so it stays audited
        const newAssignedTo = userRole === 'sales_rep'
            ? existingLead.assigned_to
            : (assigned_to ? parseInt(assigned_to) : null);

        await db.pool.execute(
            `UPDATE crm_leads
             SET school_name = ?, contact_person = ?, designation = ?, phone = ?, email = ?, address = ?, city = ?,
                 est_students = ?, current_system = ?, assigned_to = ?, status = ?, lead_source = ?, notes = ?,
                 group_director = ?, referred_by_contact = ?
             WHERE id = ?`,
            [
                school_name, contact_person, designation || null, phone, email || null, address || null, city,
                parseInt(est_students) || 0, current_system || null, newAssignedTo,
                status || 'new', lead_source || null, notes || null, group_director || null, referred_by_contact || null, leadId
            ]
        );

        res.redirect(`/admin/crm/leads/${leadId}?success=Lead updated successfully`);
    } catch (err) {
        console.error('Error updating lead:', err);
        res.status(500).send('Error updating lead.');
    }
});

// POST /admin/crm/leads/:id/delete — Delete Lead (Super Admin only)
router.post('/admin/crm/leads/:id/delete', isOnlySuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const [[lead]] = await db.pool.execute('SELECT id, converted_tenant_id FROM crm_leads WHERE id = ?', [leadId]);
        if (!lead) return res.status(404).send('Lead not found.');

        if (lead.converted_tenant_id) {
            return res.redirect(`/admin/crm/leads/${leadId}?error=Cannot delete a lead that has already been converted to an active tenant`);
        }

        await db.pool.execute('DELETE FROM crm_leads WHERE id = ?', [leadId]);
        res.redirect('/admin/crm/leads?success=Lead deleted successfully');
    } catch (err) {
        console.error('Error deleting lead:', err);
        res.redirect(`/admin/crm/leads/${req.params.id}?error=${encodeURIComponent('Deletion failed: ' + err.message)}`);
    }
});

// POST /admin/crm/leads/:id/status — Quick Status Change
router.post('/admin/crm/leads/:id/status', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const { status } = req.body;
        await db.pool.execute(`UPDATE crm_leads SET status = ? WHERE id = ?`, [status, leadId]);
        res.redirect(`/admin/crm/leads/${leadId}?success=Status updated`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating status.');
    }
});

// POST /admin/crm/leads/:id/pricing — Update Financial Rates & Commission
router.post('/admin/crm/leads/:id/pricing', isOnlySuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const { agreed_setup_fee, agreed_monthly_rate, agreed_base_students_threshold, agreed_base_amount, agreed_extra_student_rate, rep_commission_pct, rep_commission_flat } = req.body;

        await db.pool.execute(
            `UPDATE crm_leads
             SET agreed_setup_fee = ?, agreed_monthly_rate = ?, agreed_base_students_threshold = ?, agreed_base_amount = ?, agreed_extra_student_rate = ?, rep_commission_pct = ?, rep_commission_flat = ?
             WHERE id = ?`,
            [
                parseFloat(agreed_setup_fee) || 0, parseFloat(agreed_monthly_rate) || 0,
                parseInt(agreed_base_students_threshold) || 100, parseFloat(agreed_base_amount) || 1000,
                parseFloat(agreed_extra_student_rate) || 5, parseFloat(rep_commission_pct) || 0,
                parseFloat(rep_commission_flat) || 0, leadId
            ]
        );

        res.redirect(`/admin/crm/leads/${leadId}?success=Financial rates saved`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving rates.');
    }
});

// POST /admin/crm/leads/:id/meeting — Record Meeting Log & Schedule Next Visit
router.post('/admin/crm/leads/:id/meeting', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const repId = req.session.masterAdminId;
        const { meeting_date, meeting_type, person_met, discussion_notes, client_demands, outcome, next_meeting_date, next_meeting_agenda, expense_amount, expense_notes } = req.body;

        const expAmt = parseFloat(expense_amount) || 0;

        await db.pool.execute(
            `INSERT INTO crm_meetings 
             (lead_id, rep_id, meeting_date, meeting_type, person_met, discussion_notes, client_demands, outcome, next_meeting_date, next_meeting_agenda, expense_amount, expense_notes)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                leadId, repId, meeting_date || new Date(), meeting_type || 'in_person_visit',
                person_met || null, discussion_notes, client_demands || null, outcome || 'requires_followup',
                next_meeting_date || null, next_meeting_agenda || null, expAmt, expense_notes || null
            ]
        );

        // Update Lead's next meeting date/agenda and pipeline status if requested
        let newStatusQuery = '';
        const params = [next_meeting_date || null, next_meeting_agenda || null];
        if (outcome === 'deal_closed') {
            newStatusQuery = `, status = 'won'`;
        } else if (outcome === 'demo_requested') {
            newStatusQuery = `, status = 'demo_given'`;
        } else if (outcome === 'rejected') {
            newStatusQuery = `, status = 'lost'`;
        } else if (next_meeting_date) {
            newStatusQuery = `, status = 'meeting_scheduled'`;
        }
        params.push(leadId);

        await db.pool.execute(
            `UPDATE crm_leads SET next_meeting_date = ?, next_meeting_agenda = ? ${newStatusQuery} WHERE id = ?`,
            params
        );

        // If expense claimed, log to financial ledger
        if (expAmt > 0) {
            const [[lead]] = await db.pool.execute(`SELECT school_name FROM crm_leads WHERE id = ?`, [leadId]);
            await db.pool.execute(
                `INSERT INTO crm_rep_finances (rep_id, transaction_type, amount, transaction_date, description, created_by)
                 VALUES (?, 'expense_claim', ?, ?, ?, ?)`,
                [repId, expAmt, meeting_date ? meeting_date.split('T')[0] : new Date().toISOString().split('T')[0], `Meeting Visit Expense: ${lead ? lead.school_name : ''} (${expense_notes || 'Travel/Food'})`, repId]
            );
        }

        res.redirect(`/admin/crm/leads/${leadId}?success=Meeting record saved`);
    } catch (err) {
        console.error('Error logging meeting:', err);
        res.status(500).send('Error recording meeting.');
    }
});

// POST /admin/crm/leads/:id/meeting/:meetingId/edit — Edit Discussion Notes of a Logged Meeting
router.post('/admin/crm/leads/:id/meeting/:meetingId/edit', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const meetingId = req.params.meetingId;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;
        const { discussion_notes, client_demands } = req.body;

        const [[meeting]] = await db.pool.execute(
            `SELECT id, lead_id, rep_id FROM crm_meetings WHERE id = ? AND lead_id = ?`,
            [meetingId, leadId]
        );
        if (!meeting) return res.status(404).send('Meeting record not found.');

        // Data Scope check: sales reps may only edit their own meeting logs
        if (userRole === 'sales_rep' && meeting.rep_id != userId) {
            return res.status(403).send('Unauthorized. You can only edit meetings you logged.');
        }

        await db.pool.execute(
            `UPDATE crm_meetings SET discussion_notes = ?, client_demands = ? WHERE id = ?`,
            [discussion_notes, client_demands || null, meetingId]
        );

        res.redirect(`/admin/crm/leads/${leadId}?success=Meeting notes updated`);
    } catch (err) {
        console.error('Error editing meeting:', err);
        res.status(500).send('Error updating meeting record.');
    }
});

// POST /admin/crm/leads/:id/convert — Convert Lead to Tenant (Super Admin or Sales Rep for assigned lead)
router.post('/admin/crm/leads/:id/convert', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;
        const { school_name, subdomain, admin_email, admin_password } = req.body;

        const [[lead]] = await db.pool.execute('SELECT * FROM crm_leads WHERE id = ?', [leadId]);
        if (!lead) return res.status(404).send('Lead not found.');

        if (userRole === 'sales_rep' && lead.assigned_to != userId) {
            return res.status(403).send('Unauthorized. You can only convert leads assigned to you.');
        }

        const cleanSubdomain = subdomain.toLowerCase().replace(/[^a-z0-9]/g, '');
        const [[existing]] = await db.pool.execute('SELECT id FROM tenants WHERE subdomain = ? LIMIT 1', [cleanSubdomain]);
        if (existing) {
            return res.redirect(`/admin/crm/leads/${leadId}?error=Subdomain already taken`);
        }

        const connection = await db.pool.getConnection();
        try {
            await connection.beginTransaction();

            // Insert new tenant
            const [tenantResult] = await connection.execute(
                `INSERT INTO tenants (name, school_name, subdomain, status) VALUES (?, ?, ?, 'active')`,
                [school_name, school_name, cleanSubdomain]
            );
            const tenantId = tenantResult.insertId;

            // Create default Admin role
            const [roleResult] = await connection.execute(
                `INSERT INTO roles (name, tenant_id) VALUES ('Admin', ?)`,
                [tenantId]
            );
            const roleId = roleResult.insertId;

            // Add default permissions for the Admin role
            const permissions = [
                'Dashboard', 'Students', 'Employees', 'Fees', 
                'Donations', 'Attendance', 'Ledgers', 'Hifz', 'Settings'
            ];
            for (const perm of permissions) {
                await connection.execute(
                    `INSERT INTO role_permissions (role_id, function_name, allowed, tenant_id) VALUES (?, ?, 1, ?)`,
                    [roleId, perm, tenantId]
                );
            }

            // Create default admin user
            const hashedPassword = await bcrypt.hash(admin_password, 10);
            await connection.execute(
                `INSERT INTO users (tenant_id, username, password, role_id) VALUES (?, ?, ?, ?)`,
                [tenantId, admin_email, hashedPassword, roleId]
            );

            // Insert default contract with negotiated tiered rates
            const today = new Date().toISOString().split('T')[0];
            await connection.execute(
                `INSERT INTO tenant_contracts 
                (tenant_id, base_students_threshold, base_amount, extra_student_rate, contract_start_date, billing_start_date) 
                VALUES (?, ?, ?, ?, ?, ?)`,
                [
                    tenantId, 
                    lead.agreed_base_students_threshold || 100, 
                    lead.agreed_base_amount || 1000, 
                    lead.agreed_extra_student_rate || 5,
                    today,
                    today
                ]
            );

            // Update lead status & link tenant
            await connection.execute(
                `UPDATE crm_leads SET status = 'won', converted_tenant_id = ? WHERE id = ?`,
                [tenantId, leadId]
            );

            await connection.commit();

            if (userRole === 'sales_rep') {
                res.redirect(`/admin/crm/leads/${leadId}?success=Lead successfully converted to Active Tenant (#${tenantId})! Admin account created.`);
            } else {
                res.redirect(`/admin/tenants/${tenantId}/contract?success=Lead converted to Tenant successfully! Please setup contract terms.`);
            }
        } catch (innerErr) {
            await connection.rollback();
            throw innerErr;
        } finally {
            connection.release();
        }
    } catch (err) {
        console.error('Error converting lead:', err);
        res.status(500).send('Error converting lead to tenant.');
    }
});

// GET /admin/crm/leads/:id/thanks-letter - Download onboarding thanks letter PDF
router.get('/admin/crm/leads/:id/thanks-letter', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const [[lead]] = await db.pool.execute('SELECT * FROM crm_leads WHERE id = ?', [leadId]);
        if (!lead) return res.status(404).send('Lead not found.');
        
        let tenantForPdf = null;
        if (lead.converted_tenant_id) {
            const [[t]] = await db.pool.execute('SELECT * FROM tenants WHERE id = ?', [lead.converted_tenant_id]);
            if (t) {
                tenantForPdf = { ...t, logo_url: resolvePublicAsset(t.logo_url) };
            }
        }

        renderPdf(res, {
            templateName: 'super_admin/thanks_letter_document',
            data: {
                title: 'Welcome Letter - ' + lead.school_name,
                lead,
                tenant: tenantForPdf,
                omniLogo: resolvePublicAsset('/images/omnischool_logo.png'),
                isPdf: true
            },
            fileBaseName: `thanks-letter-${leadId}`,
            downloadName: `Welcome-Letter-${lead.school_name.replace(/[^a-zA-Z0-9]/g, '_')}.pdf`
        });
    } catch (err) {
        console.error('Error generating thanks letter:', err);
        res.status(500).send('Error generating thanks letter.');
    }
});

// POST /admin/crm/leads/:id/handoff — Reassign lead to a peer sales rep
router.post('/admin/crm/leads/:id/handoff', isSuperAdmin, async (req, res) => {
    try {
        const leadId = req.params.id;
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;
        const { to_rep_id, note } = req.body;

        const [[lead]] = await db.pool.execute('SELECT id, assigned_to FROM crm_leads WHERE id = ?', [leadId]);
        if (!lead) return res.status(404).send('Lead not found.');

        // Data Scope check: sales reps may only hand off leads currently assigned to them
        if (userRole === 'sales_rep' && lead.assigned_to != userId) {
            return res.status(403).send('Unauthorized. You can only hand off leads assigned to you.');
        }

        const toRepId = parseInt(to_rep_id);
        if (!toRepId) {
            return res.redirect(`/admin/crm/leads/${leadId}?error=Please select a rep to hand off to`);
        }
        if (toRepId === lead.assigned_to) {
            return res.redirect(`/admin/crm/leads/${leadId}?error=Lead is already assigned to that rep`);
        }

        const [[toRep]] = await db.pool.execute('SELECT id FROM master_admins WHERE id = ? AND is_active = 1', [toRepId]);
        if (!toRep) {
            return res.redirect(`/admin/crm/leads/${leadId}?error=Selected rep is not valid`);
        }

        await db.pool.execute('UPDATE crm_leads SET assigned_to = ? WHERE id = ?', [toRepId, leadId]);
        await db.pool.execute(
            `INSERT INTO crm_lead_handoffs (lead_id, from_rep_id, to_rep_id, handed_off_by, note)
             VALUES (?, ?, ?, ?, ?)`,
            [leadId, lead.assigned_to || null, toRepId, userId, note || null]
        );

        res.redirect(`/admin/crm/leads/${leadId}?success=Lead handed off successfully`);
    } catch (err) {
        console.error('Error handing off lead:', err);
        res.status(500).send('Error handing off lead.');
    }
});

// GET /admin/crm/meetings — Overview of all meetings & upcoming visits
router.get('/admin/crm/meetings', isSuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;
        const { rep_id, type } = req.query;

        let upcomingSql = `
            SELECT l.id, l.school_name, l.contact_person, l.phone, l.next_meeting_date, l.next_meeting_agenda, m.name as rep_name
            FROM crm_leads l
            LEFT JOIN master_admins m ON l.assigned_to = m.id
            WHERE l.next_meeting_date >= NOW()
        `;
        const upcomingParams = [];
        if (userRole === 'sales_rep') {
            upcomingSql += ` AND l.assigned_to = ?`;
            upcomingParams.push(userId);
        }
        upcomingSql += ` ORDER BY l.next_meeting_date ASC`;

        const [upcoming] = await db.pool.execute(upcomingSql, upcomingParams);

        let querySql = `
            SELECT mt.*, l.school_name, m.name as rep_name
            FROM crm_meetings mt
            JOIN crm_leads l ON mt.lead_id = l.id
            JOIN master_admins m ON mt.rep_id = m.id
            WHERE 1=1
        `;
        const params = [];
        if (userRole === 'sales_rep') {
            querySql += ` AND (mt.rep_id = ? OR l.assigned_to = ?)`;
            params.push(userId, userId);
        } else if (rep_id) {
            querySql += ` AND mt.rep_id = ?`;
            params.push(rep_id);
        }
        if (type) {
            querySql += ` AND mt.meeting_type = ?`;
            params.push(type);
        }
        querySql += ` ORDER BY mt.meeting_date DESC`;

        const [meetings] = await db.pool.execute(querySql, params);
        const [reps] = await db.pool.execute(`SELECT id, username, name FROM master_admins WHERE is_active = 1 ORDER BY name`);

        res.render('super_admin/crm_meetings', {
            upcoming,
            meetings,
            reps,
            query: req.query,
            username: req.session.masterAdminUsername,
            role: userRole,
            success: req.query.success
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading meetings.');
    }
});

// GET /admin/crm/team — Sales Team Management
router.get('/admin/crm/team', isOnlySuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const [reps] = await db.pool.execute(
            `SELECT m.*, 
                    (SELECT COUNT(*) FROM crm_leads WHERE assigned_to = m.id) as total_leads,
                    (SELECT COUNT(*) FROM crm_meetings WHERE rep_id = m.id) as total_meetings
             FROM master_admins m
             ORDER BY m.created_at DESC`
        );

        res.render('super_admin/crm_team', {
            reps,
            username: req.session.masterAdminUsername,
            role: 'super_admin',
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading sales team.');
    }
});

// POST /admin/crm/team/new — Create Sales Rep
router.post('/admin/crm/team/new', isOnlySuperAdmin, async (req, res) => {
    try {
        const { username, password, name, phone, commission_rate } = req.body;
        const hashedPassword = await bcrypt.hash(password, 10);

        await db.pool.execute(
            `INSERT INTO master_admins (username, password, role, name, phone, commission_rate, is_active)
             VALUES (?, ?, 'sales_rep', ?, ?, ?, 1)`,
            [username.trim(), hashedPassword, name || null, phone || null, parseFloat(commission_rate) || 0]
        );

        res.redirect('/admin/crm/team?success=Sales representative created');
    } catch (err) {
        console.error('Error creating sales rep:', err);
        res.redirect('/admin/crm/team?error=Username already exists');
    }
});

// POST /admin/crm/team/:id/edit — Edit Sales Rep
router.post('/admin/crm/team/:id/edit', isOnlySuperAdmin, async (req, res) => {
    try {
        const repId = req.params.id;
        const { name, phone, commission_rate, password } = req.body;

        if (password && password.trim().length > 0) {
            const hashedPassword = await bcrypt.hash(password, 10);
            await db.pool.execute(
                `UPDATE master_admins SET name = ?, phone = ?, commission_rate = ?, password = ? WHERE id = ?`,
                [name || null, phone || null, parseFloat(commission_rate) || 0, hashedPassword, repId]
            );
        } else {
            await db.pool.execute(
                `UPDATE master_admins SET name = ?, phone = ?, commission_rate = ? WHERE id = ?`,
                [name || null, phone || null, parseFloat(commission_rate) || 0, repId]
            );
        }

        res.redirect('/admin/crm/team?success=Sales representative updated');
    } catch (err) {
        console.error(err);
        res.redirect('/admin/crm/team?error=Failed to update sales rep');
    }
});

// POST /admin/crm/team/:id/toggle — Activate/Deactivate Sales Rep
router.post('/admin/crm/team/:id/toggle', isOnlySuperAdmin, async (req, res) => {
    try {
        const repId = req.params.id;
        await db.pool.execute(`UPDATE master_admins SET is_active = NOT is_active WHERE id = ?`, [repId]);
        res.redirect('/admin/crm/team?success=Sales rep status updated');
    } catch (err) {
        console.error(err);
        res.redirect('/admin/crm/team?error=Failed to toggle status');
    }
});

// GET /admin/crm/finances — Finances & Expense Ledger
router.get('/admin/crm/finances', isSuperAdmin, async (req, res) => {
    try {
        await ensureCrmSchema();
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        const [reps] = await db.pool.execute(`SELECT id, username, name FROM master_admins WHERE is_active = 1 ORDER BY name`);

        let disbursedSql = `SELECT SUM(amount) as total FROM crm_rep_finances WHERE transaction_type = 'disbursement'`;
        let expenseSql = `SELECT SUM(amount) as total FROM crm_rep_finances WHERE transaction_type = 'expense_claim'`;
        let commSql = `SELECT SUM(amount) as total FROM crm_rep_finances WHERE transaction_type = 'commission_payout'`;
        const statParams = [];

        if (userRole === 'sales_rep') {
            disbursedSql += ` AND rep_id = ?`;
            expenseSql += ` AND rep_id = ?`;
            commSql += ` AND rep_id = ?`;
            statParams.push(userId);
        }

        const [disbursedRow] = await db.pool.execute(disbursedSql, statParams);
        const [expenseRow] = await db.pool.execute(expenseSql, statParams);
        const [commRow] = await db.pool.execute(commSql, statParams);

        const summary = {
            totalDisbursed: disbursedRow[0]?.total || 0,
            totalExpenses: expenseRow[0]?.total || 0,
            totalCommissions: commRow[0]?.total || 0
        };

        // Per rep balances
        let repBalSql = `
            SELECT m.id, m.name, m.username,
                   COALESCE(SUM(CASE WHEN f.transaction_type = 'disbursement' THEN f.amount ELSE 0 END), 0) as disbursed,
                   COALESCE(SUM(CASE WHEN f.transaction_type = 'expense_claim' THEN f.amount ELSE 0 END), 0) as expenses
            FROM master_admins m
            LEFT JOIN crm_rep_finances f ON f.rep_id = m.id
            WHERE 1=1
        `;
        const repBalParams = [];
        if (userRole === 'sales_rep') {
            repBalSql += ` AND m.id = ?`;
            repBalParams.push(userId);
        }
        repBalSql += ` GROUP BY m.id, m.name, m.username ORDER BY m.name`;

        const [repBalances] = await db.pool.execute(repBalSql, repBalParams);

        // Transaction Ledger
        let txSql = `
            SELECT f.*, r.name as rep_name, c.name as creator_name
            FROM crm_rep_finances f
            JOIN master_admins r ON f.rep_id = r.id
            JOIN master_admins c ON f.created_by = c.id
            WHERE 1=1
        `;
        const txParams = [];
        if (userRole === 'sales_rep') {
            txSql += ` AND f.rep_id = ?`;
            txParams.push(userId);
        }
        txSql += ` ORDER BY f.transaction_date DESC, f.id DESC`;

        const [transactions] = await db.pool.execute(txSql, txParams);

        res.render('super_admin/crm_finances', {
            summary,
            repBalances,
            transactions,
            reps,
            username: req.session.masterAdminUsername,
            role: userRole,
            success: req.query.success
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading finances.');
    }
});

// POST /admin/crm/finances/disburse — Disburse Funds
router.post('/admin/crm/finances/disburse', isOnlySuperAdmin, async (req, res) => {
    try {
        const creatorId = req.session.masterAdminId;
        const { rep_id, transaction_type, amount, transaction_date, description } = req.body;

        await db.pool.execute(
            `INSERT INTO crm_rep_finances (rep_id, transaction_type, amount, transaction_date, description, created_by)
             VALUES (?, ?, ?, ?, ?, ?)`,
            [parseInt(rep_id), transaction_type || 'disbursement', parseFloat(amount) || 0, transaction_date || new Date().toISOString().split('T')[0], description, creatorId]
        );

        res.redirect('/admin/crm/finances?success=Funds transaction recorded');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording disbursement.');
    }
});

// ============================================================
// AI Strategy Advisor — reads real sales meeting notes/demands
// across the whole CRM plus the owner's own feedback notes, and
// asks Gemini for costing & marketing strategy recommendations.
// Super-admin only: this surfaces cross-lead competitive/pricing
// analysis that individual sales reps shouldn't see.
// ============================================================
const STRATEGY_MEETINGS_LIMIT = 300;

// GET /admin/crm/strategy — Super Admin: full advisor (feedback log from
// everyone + generated insights). Sales Rep: a cut-down view scoped to
// just their own feedback notes — reps give input here but never see
// the generated competitive/pricing strategy insights.
router.get('/admin/crm/strategy', isSuperAdmin, async (req, res) => {
    try {
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        let feedback, insights = [], counts = null;

        if (userRole === 'sales_rep') {
            [feedback] = await db.pool.execute(
                `SELECT f.*, m.name as admin_name, m.username as admin_username
                 FROM crm_strategy_feedback f
                 JOIN master_admins m ON f.admin_id = m.id
                 WHERE f.admin_id = ?
                 ORDER BY f.created_at DESC`,
                [userId]
            );
        } else {
            [feedback] = await db.pool.execute(
                `SELECT f.*, m.name as admin_name, m.username as admin_username
                 FROM crm_strategy_feedback f
                 JOIN master_admins m ON f.admin_id = m.id
                 ORDER BY f.created_at DESC`
            );

            [insights] = await db.pool.execute(
                `SELECT i.*, m.name as admin_name, m.username as admin_username
                 FROM crm_strategy_insights i
                 JOIN master_admins m ON i.generated_by = m.id
                 ORDER BY i.created_at DESC
                 LIMIT 20`
            );
            insights = insights.map(ins => ({ ...ins, sections: parseInsightText(ins.insight_text) }));

            const [[c]] = await db.pool.execute(
                `SELECT (SELECT COUNT(*) FROM crm_leads) as total_leads,
                        (SELECT COUNT(*) FROM crm_meetings) as total_meetings`
            );
            counts = c;
        }

        res.render('super_admin/crm_strategy', {
            feedback,
            insights,
            counts,
            username: req.session.masterAdminUsername,
            role: userRole,
            userId,
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error('Error loading Strategy Advisor:', err);
        res.status(500).send('Error loading Strategy Advisor.');
    }
});

// POST /admin/crm/strategy/feedback — Add a business-context note (Super Admin or Sales Rep)
router.post('/admin/crm/strategy/feedback', isSuperAdmin, async (req, res) => {
    try {
        const adminId = req.session.masterAdminId;
        const { feedback_text } = req.body;
        if (!feedback_text || !feedback_text.trim()) {
            return res.redirect('/admin/crm/strategy?error=Feedback text cannot be empty');
        }

        await db.pool.execute(
            `INSERT INTO crm_strategy_feedback (admin_id, feedback_text) VALUES (?, ?)`,
            [adminId, feedback_text.trim()]
        );

        res.redirect('/admin/crm/strategy?success=Feedback added');
    } catch (err) {
        console.error('Error adding strategy feedback:', err);
        res.status(500).send('Error adding feedback.');
    }
});

// POST /admin/crm/strategy/feedback/:id/delete — Remove a feedback note
// (Super Admin can remove any note; a Sales Rep only their own)
router.post('/admin/crm/strategy/feedback/:id/delete', isSuperAdmin, async (req, res) => {
    try {
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        if (userRole === 'sales_rep') {
            const [[fb]] = await db.pool.execute(`SELECT admin_id FROM crm_strategy_feedback WHERE id = ?`, [req.params.id]);
            if (!fb || fb.admin_id != userId) {
                return res.status(403).send('Unauthorized. You can only remove your own feedback notes.');
            }
        }

        await db.pool.execute(`DELETE FROM crm_strategy_feedback WHERE id = ?`, [req.params.id]);
        res.redirect('/admin/crm/strategy?success=Feedback removed');
    } catch (err) {
        console.error('Error deleting strategy feedback:', err);
        res.status(500).send('Error deleting feedback.');
    }
});

// GET /admin/crm/competitors — Competitor Tracking page (Super Admin or Sales Rep)
router.get('/admin/crm/competitors', isSuperAdmin, async (req, res) => {
    try {
        const [competitors] = await db.pool.execute(
            `SELECT c.*, m.name as admin_name, m.username as admin_username
             FROM crm_competitors c
             JOIN master_admins m ON c.added_by = m.id
             ORDER BY c.created_at DESC`
        );

        res.render('super_admin/crm_competitors', {
            competitors,
            username: req.session.masterAdminUsername,
            role: req.session.masterAdminRole,
            userId: req.session.masterAdminId,
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error('Error loading Competitor Tracking:', err);
        res.status(500).send('Error loading Competitor Tracking.');
    }
});

// POST /admin/crm/competitors — Log a competitor product (Super Admin or Sales Rep)
router.post('/admin/crm/competitors', isSuperAdmin, async (req, res) => {
    try {
        const adminId = req.session.masterAdminId;
        const { product_name, website, price_offering, user_base, strengths, weaknesses, notes } = req.body;
        if (!product_name || !product_name.trim()) {
            return res.redirect('/admin/crm/competitors?error=Competitor product name is required');
        }

        await db.pool.execute(
            `INSERT INTO crm_competitors (product_name, website, price_offering, user_base, strengths, weaknesses, notes, added_by)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [product_name.trim(), website || null, price_offering || null, user_base || null, strengths || null, weaknesses || null, notes || null, adminId]
        );

        res.redirect('/admin/crm/competitors?success=Competitor added');
    } catch (err) {
        console.error('Error adding competitor:', err);
        res.status(500).send('Error adding competitor.');
    }
});

// POST /admin/crm/competitors/:id/delete — Remove a competitor entry
// (Super Admin can remove any; a Sales Rep only ones they added)
router.post('/admin/crm/competitors/:id/delete', isSuperAdmin, async (req, res) => {
    try {
        const userRole = req.session.masterAdminRole || 'super_admin';
        const userId = req.session.masterAdminId;

        if (userRole === 'sales_rep') {
            const [[c]] = await db.pool.execute(`SELECT added_by FROM crm_competitors WHERE id = ?`, [req.params.id]);
            if (!c || c.added_by != userId) {
                return res.status(403).send('Unauthorized. You can only remove competitors you added.');
            }
        }

        await db.pool.execute(`DELETE FROM crm_competitors WHERE id = ?`, [req.params.id]);
        res.redirect('/admin/crm/competitors?success=Competitor removed');
    } catch (err) {
        console.error('Error deleting competitor:', err);
        res.status(500).send('Error deleting competitor.');
    }
});

// POST /admin/crm/strategy/transcribe — Voice-to-text for the feedback note box (Super Admin or Sales Rep)
router.post('/admin/crm/strategy/transcribe', isSuperAdmin, async (req, res) => {
    try {
        const { audio_b64, mime_type } = req.body;
        if (!audio_b64) {
            return res.status(400).json({ error: 'No audio data received.' });
        }

        const audioPart = {
            inlineData: {
                data: audio_b64,
                mimeType: mime_type || 'audio/webm'
            }
        };

        const prompt = 'Transcribe this audio recording to plain text, exactly as spoken, with normal punctuation. Return ONLY the transcription — no commentary, no markdown, no speaker labels. If the audio is silent or unintelligible, return an empty string.';

        const result = await generateGeminiContent([prompt, audioPart], {
            model: 'gemini-3.6-flash'
        });
        const text = result.response.text().trim();

        res.json({ success: true, text });
    } catch (err) {
        console.error('Voice transcription error:', err);
        const errMsg = err.message.includes('busy processing other sheets')
            ? err.message
            : 'Error transcribing audio: ' + err.message;
        res.status(500).json({ error: errMsg });
    }
});

// POST /admin/crm/strategy/generate — Generate a new AI strategy insight
router.post('/admin/crm/strategy/generate', isOnlySuperAdmin, async (req, res) => {
    try {
        const adminId = req.session.masterAdminId;

        if (!process.env.GEMINI_API_KEY) {
            return res.redirect('/admin/crm/strategy?error=Gemini API key not configured.');
        }

        const [meetings] = await db.pool.execute(
            `SELECT m.meeting_date, m.meeting_type, m.discussion_notes, m.client_demands, m.outcome,
                    l.school_name, l.city, l.est_students, l.current_system, l.status,
                    l.agreed_setup_fee, l.agreed_monthly_rate, l.agreed_rate_per_student,
                    r.name as rep_name, r.username as rep_username
             FROM crm_meetings m
             JOIN crm_leads l ON m.lead_id = l.id
             JOIN master_admins r ON m.rep_id = r.id
             ORDER BY m.meeting_date DESC
             LIMIT ${STRATEGY_MEETINGS_LIMIT}`
        );

        if (meetings.length === 0) {
            return res.redirect('/admin/crm/strategy?error=No meetings logged yet to analyze.');
        }

        const [feedbackRows] = await db.pool.execute(
            `SELECT feedback_text, created_at FROM crm_strategy_feedback ORDER BY created_at DESC`
        );

        const [competitorRows] = await db.pool.execute(
            `SELECT product_name, website, price_offering, user_base, strengths, weaknesses, notes FROM crm_competitors ORDER BY created_at DESC`
        );

        const meetingsBlock = meetings.map(m => {
            const pricingBits = [];
            if (m.agreed_setup_fee > 0) pricingBits.push(`setup Rs.${m.agreed_setup_fee}`);
            if (m.agreed_monthly_rate > 0) pricingBits.push(`monthly Rs.${m.agreed_monthly_rate}`);
            if (m.agreed_rate_per_student > 0) pricingBits.push(`per-student Rs.${m.agreed_rate_per_student}`);
            const pricingStr = pricingBits.length ? ` | Agreed pricing so far: ${pricingBits.join(', ')}` : '';

            return `- [${new Date(m.meeting_date).toISOString().split('T')[0]}] ${m.school_name} (${m.city || 'city n/a'}, ~${m.est_students || '?'} students, currently using: ${m.current_system || 'unknown/none'}) | Lead status: ${m.status} | Meeting: ${m.meeting_type}, outcome: ${m.outcome} | Rep: ${m.rep_name || m.rep_username}${pricingStr}
  Discussion: ${(m.discussion_notes || '').trim() || '(none recorded)'}
  Client demands/objections: ${(m.client_demands || '').trim() || '(none recorded)'}`;
        }).join('\n\n');

        const feedbackBlock = feedbackRows.length
            ? feedbackRows.map(f => `- [${new Date(f.created_at).toISOString().split('T')[0]}] ${f.feedback_text}`).join('\n')
            : '(none provided yet)';

        const competitorsBlock = competitorRows.length
            ? competitorRows.map(c => {
                const bits = [`Product: ${c.product_name}`];
                if (c.website) bits.push(`Website: ${c.website}`);
                if (c.price_offering) bits.push(`Pricing/offering: ${c.price_offering}`);
                if (c.user_base) bits.push(`User base: ${c.user_base}`);
                if (c.strengths) bits.push(`Strengths: ${c.strengths}`);
                if (c.weaknesses) bits.push(`Weaknesses: ${c.weaknesses}`);
                if (c.notes) bits.push(`Notes: ${c.notes}`);
                return `- ${bits.join(' | ')}`;
            }).join('\n')
            : '(none logged yet)';

        const prompt = `You are a business strategy analyst for an EdTech SaaS company ("OmniSchool") that sells a School Management System to private schools and madrassas in Pakistan.

Below is real data pulled directly from the sales CRM: actual sales meeting notes, customer demands/objections, pricing already negotiated with individual leads, competitor products the sales team has logged from the field, and context the business owner has personally added about their own priorities — treat the owner's notes as important steering input, not just background.

Your job: analyze this raw data and produce a concise, actionable strategy brief with EXACTLY these four section headings:

PRICING / COSTING STRATEGY
Based on what clients are actually asking for, pushing back on, or agreeing to (discounts requested, competitor pricing mentioned, deal sizes by student count, which pricing tiers correlate with won vs lost deals) and the logged competitor pricing/offerings below, recommend concrete pricing/packaging adjustments.

MARKETING STRATEGY
Based on recurring objections, competitor systems mentioned, customer pain points, logged competitor strengths/weaknesses and user base, and which messaging seems to resonate (deals that went positive/won) vs fail (rejected/lost), recommend target segments, messaging angles, and channels to prioritize — including how to position against specific competitors where relevant.

KEY PATTERNS OBSERVED
The 3-5 most important recurring signals you noticed across the meetings (objections, feature requests, competitor mentions, price sensitivity, etc.) with rough frequency if apparent.

IMMEDIATE ACTION ITEMS
A short numbered list of the next concrete steps for the sales team and the business owner.

Ground every recommendation in specifics from the data below — reference actual patterns you found, don't give generic SaaS sales advice. If the data is too sparse to support a claim, say so rather than inventing detail.

Return plain text only: the four headings above in capitals, each followed by short paragraphs or "-" bullet points. No markdown tables, no asterisks for bold.

=== BUSINESS OWNER'S CONTEXT / FEEDBACK (most recent first) ===
${feedbackBlock}

=== COMPETITOR INTELLIGENCE LOGGED BY THE TEAM ===
${competitorsBlock}

=== SALES MEETING DATA (${meetings.length} most recent meetings) ===
${meetingsBlock}`;

        const result = await generateGeminiContent(prompt, {
            model: 'gemini-3.6-flash'
        });
        const insightText = result.response.text().trim();

        await db.pool.execute(
            `INSERT INTO crm_strategy_insights (generated_by, meetings_analyzed, feedback_analyzed, insight_text)
             VALUES (?, ?, ?, ?)`,
            [adminId, meetings.length, feedbackRows.length, insightText]
        );

        res.redirect('/admin/crm/strategy?success=New strategy insight generated');
    } catch (err) {
        console.error('Error generating strategy insight:', err);
        const errMsg = err.message.includes('busy processing other sheets')
            ? err.message
            : 'Error generating insight: ' + err.message;
        res.redirect('/admin/crm/strategy?error=' + encodeURIComponent(errMsg));
    }
});

module.exports = router;
