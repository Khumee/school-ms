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
        const { classId, search } = req.query;
        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenant.id]);
        
        let selectedClassId = classId !== undefined ? classId : (classes.length > 0 ? String(classes[0].id) : '');
        
        let query = `
            SELECT s.id, s.name, c.name as class_name 
            FROM subjects s
            JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
        `;
        const params = [req.tenant.id];

        if (selectedClassId) {
            query += ' AND s.class_id = ?';
            params.push(selectedClassId);
        }

        if (search && search.trim()) {
            query += ' AND (s.name LIKE ? OR c.name LIKE ?)';
            params.push(`%${search.trim()}%`, `%${search.trim()}%`);
        }

        query += ' ORDER BY c.id, s.name';

        const [subjects] = await db.query(query, params);

        res.render('subjects/index', {
            title: 'Manage Subjects',
            classes,
            subjects,
            classId: selectedClassId,
            search: search || '',
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
        await db.query('INSERT INTO subjects (class_id, name, tenant_id) VALUES (?, ?, ?)', [class_id, name, req.tenant.id]);
        req.session.success = 'Subject added successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add subject.';
    }
    res.redirect('/subjects');
});

// Delete subject
router.post('/subjects/delete/:id', async (req, res) => {
    const subjectId = req.params.id;
    try {
        // 1. Check if subject is used in timetable periods
        const [periodCount] = await db.query('SELECT COUNT(*) as count FROM periods WHERE subject_id = ? AND tenant_id = ?', [subjectId, req.tenant.id]);
        
        // 2. Check if subject is used in exam papers
        const [paperCount] = await db.query('SELECT COUNT(*) as count FROM exam_papers WHERE subject_id = ? AND tenant_id = ?', [subjectId, req.tenant.id]);

        const pCount = periodCount[0].count;
        const epCount = paperCount[0].count;

        if (pCount > 0 || epCount > 0) {
            let reasons = [];
            if (pCount > 0) reasons.push(`${pCount} timetable period(s)`);
            if (epCount > 0) reasons.push(`${epCount} exam paper(s)`);
            
            req.session.error = `Cannot delete subject: It is currently assigned to ${reasons.join(' and ')}. Please remove or reassign those periods/papers first.`;
            return res.redirect('/subjects');
        }

        await db.query('DELETE FROM subjects WHERE id = ? AND tenant_id = ?', [subjectId, req.tenant.id]);
        req.session.success = 'Subject deleted successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to delete subject.';
    }
    res.redirect('/subjects');
});

module.exports = router;
