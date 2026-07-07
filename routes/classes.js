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
    const { name, default_monthly_fee, is_hifz_class } = req.body;
    try {
        const tenantId = req.tenant.id;
        if (!name || name.trim() === '') {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            return res.render('classes', { classes, error: 'Class name is required.' });
        }
        
        await db.execute(
            'INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES (?, ?, ?, ?)',
            [
                name.trim(), 
                default_monthly_fee ? parseFloat(default_monthly_fee) : 0.00, 
                tenantId,
                is_hifz_class === '1' || is_hifz_class === 'on' ? 1 : 0
            ]
        );
        res.redirect('/classes');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding class.');
    }
});

// POST /classes/edit/:id - edit a class
router.post('/classes/edit/:id', isAuthenticated, async (req, res) => {
    const { name, default_monthly_fee, is_hifz_class } = req.body;
    try {
        const tenantId = req.tenant.id;
        if (!name || name.trim() === '') {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            return res.render('classes', { classes, error: 'Class name is required.' });
        }
        
        await db.execute(
            'UPDATE classes SET name = ?, default_monthly_fee = ?, is_hifz_class = ? WHERE id = ? AND tenant_id = ?',
            [
                name.trim(),
                default_monthly_fee ? parseFloat(default_monthly_fee) : 0.00,
                is_hifz_class === '1' || is_hifz_class === 'on' ? 1 : 0,
                req.params.id,
                tenantId
            ]
        );
        res.redirect('/classes');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating class.');
    }
});

// POST /classes/delete/:id - delete a class
router.post('/classes/delete/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const classId = req.params.id;
        
        // Check if there are active students associated with this class
        const [[{ count }]] = await db.execute(
            'SELECT COUNT(*) as count FROM students WHERE class_id = ? AND tenant_id = ?',
            [classId, tenantId]
        );
        
        if (count > 0) {
            const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
            return res.render('classes', { 
                classes, 
                error: `Cannot delete class. There are ${count} student(s) currently enrolled in it. Please reassign them first.` 
            });
        }
        
        await db.execute('DELETE FROM classes WHERE id = ? AND tenant_id = ?', [classId, tenantId]);
        res.redirect('/classes');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting class.');
    }
});

module.exports = router;
