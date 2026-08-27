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

// Manage Exams View
router.get('/exams/manage', async (req, res) => {
    try {
        const [exams] = await db.query('SELECT * FROM exams WHERE tenant_id = ? ORDER BY start_date DESC', [req.tenantId]);
        
        res.render('exams/manage', {
            title: 'Manage Exams',
            exams,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading exams");
    }
});

// Add New Exam
router.post('/exams/add', async (req, res) => {
    const { name, start_date, end_date } = req.body;
    try {
        await db.query('INSERT INTO exams (name, start_date, end_date, tenant_id) VALUES (?, ?, ?, ?)', 
            [name, start_date, end_date, req.tenantId]);
        req.session.success = 'Exam added successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add exam.';
    }
    res.redirect('/exams/manage');
});

// Exam Papers View
router.get('/exams/papers', async (req, res) => {
    try {
        const isAdmin = req.session.role === 'admin' || req.session.role === 'master';
        const [exams] = await db.query('SELECT id, name FROM exams WHERE tenant_id = ?', [req.tenantId]);
        
        let selectedExamId = req.query.exam_id || (exams.length > 0 ? exams[0].id : null);
        let papers = [];

        if (selectedExamId) {
            let query = `
                SELECT ep.*, s.name as subject_name, c.name as class_name, e.name as teacher_name 
                FROM exam_papers ep
                JOIN subjects s ON ep.subject_id = s.id
                JOIN classes c ON ep.class_id = c.id
                JOIN employees e ON ep.teacher_id = e.id
                WHERE ep.exam_id = ? AND ep.tenant_id = ?
            `;
            const params = [selectedExamId, req.tenantId];

            if (!isAdmin) {
                // Assuming employee_id is linked to user_id. Let's fetch employee_id
                const [employee] = await db.query('SELECT id FROM employees WHERE user_id = ? AND tenant_id = ?', [req.session.userId, req.tenantId]);
                if (employee.length > 0) {
                    query += ' AND ep.teacher_id = ?';
                    params.push(employee[0].id);
                } else {
                    query += ' AND ep.teacher_id = -1'; // No employee found for this user
                }
            }

            [papers] = await db.query(query, params);
        }

        res.render('exams/papers', {
            title: 'Exam Papers',
            exams,
            papers,
            selectedExamId,
            isAdmin,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading exam papers");
    }
});

// Auto Generate Papers
router.post('/exams/generate_papers', async (req, res) => {
    const { exam_id } = req.body;
    try {
        // 1. Get all unique subject-teacher combinations from the timetable (periods)
        const [assignments] = await db.query(`
            SELECT DISTINCT p.class_id, p.subject_id, p.employee_id
            FROM periods p
            WHERE p.subject_id IS NOT NULL AND p.employee_id IS NOT NULL AND p.tenant_id = ?
        `, [req.tenantId]);

        let createdCount = 0;
        for (const assignment of assignments) {
            // Check if paper already exists
            const [existing] = await db.query(`
                SELECT id FROM exam_papers 
                WHERE exam_id = ? AND class_id = ? AND subject_id = ? AND tenant_id = ?
            `, [exam_id, assignment.class_id, assignment.subject_id, req.tenantId]);

            if (existing.length === 0) {
                await db.query(`
                    INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, tenant_id)
                    VALUES (?, ?, ?, ?, ?)
                `, [exam_id, assignment.class_id, assignment.subject_id, assignment.employee_id, req.tenantId]);
                createdCount++;
            }
        }
        
        req.session.success = `Successfully generated ${createdCount} new papers based on timetable.`;
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to generate papers.';
    }
    res.redirect(`/exams/papers?exam_id=${exam_id}`);
});

// Manage Marks View
router.get('/exams/marks/:paper_id', async (req, res) => {
    try {
        const paperId = req.params.paper_id;
        const [paperRows] = await db.query(`
            SELECT ep.*, s.name as subject_name, c.name as class_name 
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            JOIN classes c ON ep.class_id = c.id
            WHERE ep.id = ? AND ep.tenant_id = ?
        `, [paperId, req.tenantId]);

        if (paperRows.length === 0) {
            return res.status(404).send('Paper not found');
        }
        const paper = paperRows[0];

        // Fetch students in this class
        const [students] = await db.query(`
            SELECT id, name, reg_no 
            FROM students 
            WHERE class_id = ? AND status = 'active' AND tenant_id = ?
            ORDER BY name
        `, [paper.class_id, req.tenantId]);

        // Fetch existing marks
        const [marks] = await db.query(`
            SELECT student_id, obtained_marks 
            FROM exam_marks 
            WHERE exam_paper_id = ? AND tenant_id = ?
        `, [paperId, req.tenantId]);

        const marksMap = {};
        marks.forEach(m => {
            marksMap[m.student_id] = m.obtained_marks;
        });

        res.render('exams/marks', {
            title: 'Enter Marks',
            paper,
            students,
            marksMap,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading marks page");
    }
});

// Save Marks
router.post('/exams/marks/:paper_id', async (req, res) => {
    const paperId = req.params.paper_id;
    const { total_marks, student_marks } = req.body;
    
    try {
        // Update total marks for the paper
        await db.query('UPDATE exam_papers SET total_marks = ? WHERE id = ? AND tenant_id = ?', 
            [total_marks, paperId, req.tenantId]);

        // Upsert marks for students
        if (student_marks && typeof student_marks === 'object') {
            for (const studentId in student_marks) {
                const marks = student_marks[studentId];
                if (marks !== '') {
                    // Check if exists
                    const [existing] = await db.query(`
                        SELECT id FROM exam_marks WHERE exam_paper_id = ? AND student_id = ? AND tenant_id = ?
                    `, [paperId, studentId, req.tenantId]);

                    if (existing.length > 0) {
                        await db.query(`
                            UPDATE exam_marks SET obtained_marks = ? WHERE id = ?
                        `, [marks, existing[0].id]);
                    } else {
                        await db.query(`
                            INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
                            VALUES (?, ?, ?, ?)
                        `, [paperId, studentId, marks, req.tenantId]);
                    }
                }
            }
        }
        
        req.session.success = 'Marks saved successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to save marks.';
    }
    res.redirect(`/exams/marks/${paperId}`);
});

module.exports = router;
