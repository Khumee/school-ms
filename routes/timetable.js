const express = require('express');
const router = express.Router();
const db = require('../db');

const requireLogin = (req, res, next) => {
    if (!req.session.userId) {
        return res.redirect('/login');
    }
    next();
};

router.use(requireLogin);

// Manage Timetable View
router.get('/timetable/manage', async (req, res) => {
    try {
        const { class_id, teacher_id } = req.query;
        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenant.id]);
        const [teachers] = await db.query('SELECT id, name FROM employees WHERE role = "teacher" AND tenant_id = ? ORDER BY name', [req.tenant.id]);
        
        let selectedClassId = class_id !== undefined ? class_id : (classes.length > 0 ? String(classes[0].id) : 'all');
        let selectedTeacherId = teacher_id || '';
        let subjects = [];
        let periods = [];
        let classTimetables = [];
        let selectedClassName = '';

        if (selectedClassId === 'all') {
            selectedClassName = 'All Classes';
            let query = `
                SELECT p.*, s.name as subject_name, e.name as teacher_name, c.name as class_name 
                FROM periods p
                LEFT JOIN subjects s ON p.subject_id = s.id
                LEFT JOIN employees e ON p.employee_id = e.id
                JOIN classes c ON p.class_id = c.id
                WHERE p.tenant_id = ?
            `;
            const params = [req.tenant.id];
            if (selectedTeacherId) {
                query += ' AND p.employee_id = ?';
                params.push(selectedTeacherId);
            }
            query += ' ORDER BY c.id, p.day_of_week, p.start_time';
            const [allPeriods] = await db.query(query, params);

            classes.forEach(c => {
                const cPeriods = allPeriods.filter(p => p.class_id === c.id);
                classTimetables.push({
                    class: c,
                    periods: cPeriods
                });
            });
        } else if (selectedClassId) {
            const foundClass = classes.find(c => String(c.id) === String(selectedClassId));
            selectedClassName = foundClass ? foundClass.name : 'Selected Class';

            [subjects] = await db.query('SELECT id, name FROM subjects WHERE class_id = ? AND tenant_id = ? ORDER BY name', [selectedClassId, req.tenant.id]);
            
            let query = `
                SELECT p.*, s.name as subject_name, e.name as teacher_name 
                FROM periods p
                LEFT JOIN subjects s ON p.subject_id = s.id
                LEFT JOIN employees e ON p.employee_id = e.id
                WHERE p.class_id = ? AND p.tenant_id = ?
            `;
            const params = [selectedClassId, req.tenant.id];

            if (selectedTeacherId) {
                query += ' AND p.employee_id = ?';
                params.push(selectedTeacherId);
            }

            [periods] = await db.query(query, params);
        }

        res.render('timetable/manage', {
            title: 'Manage Timetable',
            classes,
            teachers,
            subjects,
            periods,
            classTimetables,
            selectedClassId,
            selectedClassName,
            selectedTeacherId,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading timetable");
    }
});

// Add/Update Period
router.post('/timetable/add', async (req, res) => {
    const { class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number } = req.body;
    
    try {
        // Collision Detection for Teacher
        const [teacherCollisions] = await db.query(`
            SELECT p.id, c.name as class_name 
            FROM periods p
            JOIN classes c ON p.class_id = c.id
            WHERE p.employee_id = ? AND p.day_of_week = ? 
            AND p.tenant_id = ?
            AND (
                (p.start_time < ? AND p.end_time > ?)
            )
        `, [employee_id, day_of_week, req.tenant.id, end_time, start_time]);

        if (teacherCollisions.length > 0) {
            req.session.error = `Collision Detected: Teacher is already assigned to ${teacherCollisions[0].class_name} during this time slot.`;
            return res.redirect(`/timetable/manage?class_id=${class_id}`);
        }

        await db.query(`
            INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `, [class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, req.tenant.id]);
        
        req.session.success = 'Timetable slot added successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add timetable slot.';
    }
    res.redirect(`/timetable/manage?class_id=${class_id}`);
});

// Delete Period
router.post('/timetable/delete/:id', async (req, res) => {
    const { class_id } = req.body;
    try {
        await db.query('DELETE FROM periods WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        req.session.success = 'Slot deleted successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to delete slot.';
    }
    res.redirect(`/timetable/manage?class_id=${class_id}`);
});

module.exports = router;
