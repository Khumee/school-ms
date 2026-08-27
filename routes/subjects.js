const express = require('express');
const router = express.Router();
const db = require('../db');

// Middleware to ensure user is logged in
const requireLogin = (req, res, next) => {
    if (!req.session.userId) {
        return res.redirect('/login');
    }
    next();
};

// Apply middleware
router.use(requireLogin);

// Get all subjects
router.get('/subjects', async (req, res) => {
    try {
        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenantId]);
        
        const [subjects] = await db.query(`
            SELECT s.id, s.name, c.name as class_name 
            FROM subjects s
            JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
            ORDER BY c.id, s.name
        `, [req.tenantId]);

        res.render('subjects/index', {
            title: 'Manage Subjects',
            classes,
            subjects,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading subjects");
    }
});

// Add new subject
router.post('/subjects/add', async (req, res) => {
    const { class_id, name } = req.body;
    try {
        await db.query('INSERT INTO subjects (class_id, name, tenant_id) VALUES (?, ?, ?)', [class_id, name, req.tenantId]);
        req.session.success = 'Subject added successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add subject.';
    }
    res.redirect('/subjects');
});

// Delete subject
router.post('/subjects/delete/:id', async (req, res) => {
    try {
        await db.query('DELETE FROM subjects WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenantId]);
        req.session.success = 'Subject deleted successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to delete subject.';
    }
    res.redirect('/subjects');
});

module.exports = router;
