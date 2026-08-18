const express = require('express');
const router = express.Router();
const db = require('../db');
const fs = require('fs');
const path = require('path');
const multer = require('multer');
const { isAuthenticated, hasPermission } = require('../middleware/auth');
const ensureSupportSchema = require('../utils/ensureSupportSchema');

const upload = multer({
    storage: multer.diskStorage({
        destination: (req, file, cb) => {
            const tenantId = req.tenant ? req.tenant.id : 'default';
            const dir = path.join(__dirname, '..', 'public', 'uploads', String(tenantId), 'support_tickets');
            fs.mkdirSync(dir, { recursive: true });
            cb(null, dir);
        },
        filename: (req, file, cb) => {
            const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
            cb(null, 'ticket-' + uniqueSuffix + path.extname(file.originalname).toLowerCase());
        }
    }),
    limits: { fileSize: 5 * 1024 * 1024 },
    fileFilter: (req, file, cb) => {
        const allowed = ['.png', '.jpg', '.jpeg', '.gif', '.webp'];
        cb(null, allowed.includes(path.extname(file.originalname).toLowerCase()));
    }
});

// GET /support — list this school's tickets
router.get('/support', isAuthenticated, hasPermission('Support'), async (req, res) => {
    try {
        await ensureSupportSchema();
        const [tickets] = await db.execute(
            `SELECT * FROM support_tickets WHERE tenant_id = ? ORDER BY updated_at DESC`,
            [req.tenant.id]
        );
        res.render('support_list', { tickets, success: req.query.success });
    } catch (err) {
        console.error('Error loading support tickets:', err);
        res.status(500).send('Error loading support tickets.');
    }
});

// GET /support/new — new ticket form
router.get('/support/new', isAuthenticated, hasPermission('Support'), (req, res) => {
    res.render('support_new', { error: req.query.error });
});

// POST /support/new — create ticket
router.post('/support/new', isAuthenticated, hasPermission('Support'), async (req, res) => {
    upload.single('screenshot')(req, res, async (err) => {
        if (err) {
            return res.redirect('/support/new?error=' + encodeURIComponent('Screenshot upload failed: ' + err.message));
        }
        try {
            await ensureSupportSchema();
            const { subject, description, priority } = req.body;
            const screenshotPath = req.file ? `/uploads/${req.tenant.id}/support_tickets/${req.file.filename}` : null;

            const [result] = await db.execute(
                `INSERT INTO support_tickets (tenant_id, subject, description, screenshot_path, priority, created_by, created_by_name)
                 VALUES (?, ?, ?, ?, ?, ?, ?)`,
                [req.tenant.id, subject, description, screenshotPath, priority || 'medium', req.session.userId, req.session.username]
            );

            res.redirect(`/support/${result.insertId}?success=Ticket submitted successfully`);
        } catch (dbErr) {
            console.error('Error creating support ticket:', dbErr);
            res.redirect('/support/new?error=Failed to submit ticket');
        }
    });
});

// GET /support/:id — ticket detail + conversation thread
router.get('/support/:id', isAuthenticated, hasPermission('Support'), async (req, res) => {
    try {
        await ensureSupportSchema();
        const [[ticket]] = await db.execute(
            `SELECT * FROM support_tickets WHERE id = ? AND tenant_id = ?`,
            [req.params.id, req.tenant.id]
        );
        if (!ticket) return res.status(404).send('Ticket not found.');

        const [messages] = await db.execute(
            `SELECT * FROM support_ticket_messages WHERE ticket_id = ? ORDER BY created_at ASC`,
            [ticket.id]
        );

        res.render('support_view', { ticket, messages, success: req.query.success, error: req.query.error });
    } catch (err) {
        console.error('Error loading support ticket:', err);
        res.status(500).send('Error loading ticket.');
    }
});

// POST /support/:id/reply — add a message to the ticket
router.post('/support/:id/reply', isAuthenticated, hasPermission('Support'), async (req, res) => {
    upload.single('screenshot')(req, res, async (err) => {
        const ticketId = req.params.id;
        if (err) {
            return res.redirect(`/support/${ticketId}?error=${encodeURIComponent('Screenshot upload failed: ' + err.message)}`);
        }
        try {
            const [[ticket]] = await db.execute(
                `SELECT * FROM support_tickets WHERE id = ? AND tenant_id = ?`,
                [ticketId, req.tenant.id]
            );
            if (!ticket) return res.status(404).send('Ticket not found.');

            const { message } = req.body;
            const screenshotPath = req.file ? `/uploads/${req.tenant.id}/support_tickets/${req.file.filename}` : null;

            if (!message && !screenshotPath) {
                return res.redirect(`/support/${ticketId}?error=Please add a message or a screenshot`);
            }

            await db.execute(
                `INSERT INTO support_ticket_messages (ticket_id, sender_role, sender_name, message, screenshot_path)
                 VALUES (?, 'tenant', ?, ?, ?)`,
                [ticketId, req.session.username, message || null, screenshotPath]
            );

            // Replying to a resolved/closed ticket re-opens it for support to review
            if (ticket.status === 'resolved' || ticket.status === 'closed') {
                await db.execute(`UPDATE support_tickets SET status = 'open' WHERE id = ? AND tenant_id = ?`, [ticketId, req.tenant.id]);
            } else {
                await db.execute(`UPDATE support_tickets SET updated_at = NOW() WHERE id = ? AND tenant_id = ?`, [ticketId, req.tenant.id]);
            }

            res.redirect(`/support/${ticketId}?success=Reply sent`);
        } catch (dbErr) {
            console.error('Error replying to support ticket:', dbErr);
            res.redirect(`/support/${ticketId}?error=Failed to send reply`);
        }
    });
});

// POST /support/:id/close — tenant self-closes a resolved issue
router.post('/support/:id/close', isAuthenticated, hasPermission('Support'), async (req, res) => {
    try {
        const [result] = await db.execute(
            `UPDATE support_tickets SET status = 'closed' WHERE id = ? AND tenant_id = ? AND status != 'closed'`,
            [req.params.id, req.tenant.id]
        );
        if (result.affectedRows === 0) return res.status(404).send('Ticket not found.');
        res.redirect(`/support/${req.params.id}?success=Ticket closed`);
    } catch (err) {
        console.error('Error closing support ticket:', err);
        res.status(500).send('Error closing ticket.');
    }
});

module.exports = router;
