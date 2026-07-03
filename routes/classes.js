const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');

// GET /classes - list all classes & show add form
router.get('/classes', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [classes] = await db.execute(
            'SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC',
            [tenantId]
        );
        res.render('classes', { classes, error: null });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading classes.');
    }
});

// POST /classes/add - add a class
router.post('/classes/add', isAuthenticated, async (req, res) => {
    const { name, default_monthly_fee } = req.body;
    try {
        const tenantId = req.tenant.id;
        if (!name || name.trim() === '') {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            return res.render('classes', { classes, error: 'Class name is required.' });
        }
        
        await db.execute(
            'INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES (?, ?, ?)',
            [name.trim(), default_monthly_fee ? parseFloat(default_monthly_fee) : 0.00, tenantId]
        );
        res.redirect('/classes');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding class.');
    }
});

module.exports = router;
