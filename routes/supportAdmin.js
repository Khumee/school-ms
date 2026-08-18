const express = require('express');
const router = express.Router();
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const bcrypt = require('bcryptjs');
const db = require('../db');
const { isSupportStaff, isOnlySuperAdmin } = require('../middleware/auth');
const ensureSupportSchema = require('../utils/ensureSupportSchema');

const upload = multer({
    storage: multer.diskStorage({
        destination: async (req, file, cb) => {
            try {
                const [[ticket]] = await db.pool.execute('SELECT tenant_id FROM support_tickets WHERE id = ?', [req.params.id]);
                const tenantId = ticket ? ticket.tenant_id : 'default';
                const dir = path.join(__dirname, '..', 'public', 'uploads', String(tenantId), 'support_tickets');
                fs.mkdirSync(dir, { recursive: true });
                cb(null, dir);
            } catch (err) {
                cb(err);
            }
        },
        filename: (req, file, cb) => {
            const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
            cb(null, 'support-' + uniqueSuffix + path.extname(file.originalname).toLowerCase());
        }
    }),
    limits: { fileSize: 5 * 1024 * 1024 },
    fileFilter: (req, file, cb) => {
        const allowed = ['.png', '.jpg', '.jpeg', '.gif', '.webp'];
        cb(null, allowed.includes(path.extname(file.originalname).toLowerCase()));
    }
});

// GET /admin/support/tickets — all tenants' tickets
router.get('/admin/support/tickets', isSupportStaff, async (req, res) => {
    try {
        await ensureSupportSchema();
        const { status } = req.query;
        let sql = `
            SELECT t.*, tn.school_name
            FROM support_tickets t
            JOIN tenants tn ON t.tenant_id = tn.id
            WHERE 1=1
        `;
        const params = [];
        if (status) {
            sql += ` AND t.status = ?`;
            params.push(status);
        }
        sql += ` ORDER BY (t.status = 'open') DESC, (t.status = 'in_progress') DESC, t.updated_at DESC`;

        const [tickets] = await db.pool.execute(sql, params);
        const [[openCount]] = await db.pool.execute(`SELECT COUNT(*) as cnt FROM support_tickets WHERE status = 'open'`);

        res.render('super_admin/support_tickets_list', {
            tickets,
            openCount: openCount.cnt || 0,
            query: req.query,
            username: req.session.masterAdminUsername,
            role: req.session.masterAdminRole,
            success: req.query.success
        });
    } catch (err) {
        console.error('Error loading support tickets:', err);
        res.status(500).send('Error loading support tickets.');
    }
});

// GET /admin/support/tickets/:id — ticket detail + reply form
router.get('/admin/support/tickets/:id', isSupportStaff, async (req, res) => {
    try {
        await ensureSupportSchema();
        const [[ticket]] = await db.pool.execute(
            `SELECT t.*, tn.school_name FROM support_tickets t JOIN tenants tn ON t.tenant_id = tn.id WHERE t.id = ?`,
            [req.params.id]
        );
        if (!ticket) return res.status(404).send('Ticket not found.');

        const [messages] = await db.pool.execute(
            `SELECT * FROM support_ticket_messages WHERE ticket_id = ? ORDER BY created_at ASC`,
            [ticket.id]
        );

        res.render('super_admin/support_ticket_view', {
            ticket,
            messages,
            username: req.session.masterAdminUsername,
            role: req.session.masterAdminRole,
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error('Error loading support ticket:', err);
        res.status(500).send('Error loading ticket.');
    }
});

// POST /admin/support/tickets/:id/reply — respond and optionally update status
router.post('/admin/support/tickets/:id/reply', isSupportStaff, (req, res) => {
    upload.single('screenshot')(req, res, async (err) => {
        const ticketId = req.params.id;
        if (err) {
            return res.redirect(`/admin/support/tickets/${ticketId}?error=${encodeURIComponent('Screenshot upload failed: ' + err.message)}`);
        }
        try {
            const [[ticket]] = await db.pool.execute('SELECT id, tenant_id, status FROM support_tickets WHERE id = ?', [ticketId]);
            if (!ticket) return res.status(404).send('Ticket not found.');

            const { message, status } = req.body;
            const screenshotPath = req.file ? `/uploads/${ticket.tenant_id}/support_tickets/${req.file.filename}` : null;

            if (!message && !screenshotPath) {
                return res.redirect(`/admin/support/tickets/${ticketId}?error=Please add a message or a screenshot`);
            }

            await db.pool.execute(
                `INSERT INTO support_ticket_messages (ticket_id, sender_role, sender_name, message, screenshot_path)
                 VALUES (?, 'support', ?, ?, ?)`,
                [ticketId, req.session.masterAdminUsername, message || null, screenshotPath]
            );

            const newStatus = status && ['open', 'in_progress', 'resolved', 'closed'].includes(status) ? status : ticket.status;
            await db.pool.execute(`UPDATE support_tickets SET status = ? WHERE id = ?`, [newStatus, ticketId]);

            res.redirect(`/admin/support/tickets/${ticketId}?success=Reply sent`);
        } catch (dbErr) {
            console.error('Error replying to support ticket:', dbErr);
            res.redirect(`/admin/support/tickets/${ticketId}?error=Failed to send reply`);
        }
    });
});

// GET /admin/support/team — Support Agent roster
router.get('/admin/support/team', isOnlySuperAdmin, async (req, res) => {
    try {
        await ensureSupportSchema();
        const [agents] = await db.pool.execute(
            `SELECT * FROM master_admins WHERE role = 'support_agent' ORDER BY created_at DESC`
        );
        res.render('super_admin/support_team', {
            agents,
            username: req.session.masterAdminUsername,
            role: 'super_admin',
            success: req.query.success,
            error: req.query.error
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading support team.');
    }
});

// POST /admin/support/team/new — Create Support Agent
router.post('/admin/support/team/new', isOnlySuperAdmin, async (req, res) => {
    try {
        const { username, password, name, phone } = req.body;
        const hashedPassword = await bcrypt.hash(password, 10);

        await db.pool.execute(
            `INSERT INTO master_admins (username, password, role, name, phone, is_active)
             VALUES (?, ?, 'support_agent', ?, ?, 1)`,
            [username.trim(), hashedPassword, name || null, phone || null]
        );

        res.redirect('/admin/support/team?success=Support agent created');
    } catch (err) {
        console.error('Error creating support agent:', err);
        res.redirect('/admin/support/team?error=Username already exists');
    }
});

// POST /admin/support/team/:id/toggle — Activate/Deactivate Support Agent
router.post('/admin/support/team/:id/toggle', isOnlySuperAdmin, async (req, res) => {
    try {
        await db.pool.execute(`UPDATE master_admins SET is_active = NOT is_active WHERE id = ? AND role = 'support_agent'`, [req.params.id]);
        res.redirect('/admin/support/team?success=Support agent status updated');
    } catch (err) {
        console.error(err);
        res.redirect('/admin/support/team?error=Failed to toggle status');
    }
});

module.exports = router;
