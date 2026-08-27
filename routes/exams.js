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

// Helper to update paper total marks
async function updatePaperTotalMarks(paperId, tenantId) {
    const [result] = await db.query(`SELECT SUM(marks) as total FROM exam_questions WHERE exam_paper_id = ? AND tenant_id = ?`, [paperId, tenantId]);
    const total = result[0].total || 0;
    await db.query(`UPDATE exam_papers SET total_marks = ? WHERE id = ? AND tenant_id = ?`, [total, paperId, tenantId]);
}

// Manage Exams View
router.get('/exams/manage', async (req, res) => {
    try {
        const [exams] = await db.query('SELECT * FROM exams WHERE tenant_id = ? ORDER BY start_date DESC', [req.tenant.id]);
        
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
            [name, start_date, end_date, req.tenant.id]);
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
        const [exams] = await db.query('SELECT id, name FROM exams WHERE tenant_id = ?', [req.tenant.id]);
        
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
            const params = [selectedExamId, req.tenant.id];

            if (!isAdmin) {
                const [employee] = await db.query('SELECT id FROM employees WHERE user_id = ? AND tenant_id = ?', [req.session.userId, req.tenant.id]);
                if (employee.length > 0) {
                    query += ' AND ep.teacher_id = ?';
                    params.push(employee[0].id);
                } else {
                    query += ' AND ep.teacher_id = -1'; 
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
        const [assignments] = await db.query(`
            SELECT DISTINCT p.class_id, p.subject_id, p.employee_id
            FROM periods p
            WHERE p.subject_id IS NOT NULL AND p.employee_id IS NOT NULL AND p.tenant_id = ?
        `, [req.tenant.id]);

        let createdCount = 0;
        for (const assignment of assignments) {
            const [existing] = await db.query(`
                SELECT id FROM exam_papers 
                WHERE exam_id = ? AND class_id = ? AND subject_id = ? AND tenant_id = ?
            `, [exam_id, assignment.class_id, assignment.subject_id, req.tenant.id]);

            if (existing.length === 0) {
                const [insertRes] = await db.query(`
                    INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
                    VALUES (?, ?, ?, ?, 100, ?)
                `, [exam_id, assignment.class_id, assignment.subject_id, assignment.employee_id, req.tenant.id]);
                
                const paperId = insertRes.insertId;
                
                // Add default questions (Q1: 34, Q2: 33, Q3: 33)
                await db.query(`
                    INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
                    VALUES (?, 'Q1', 34, ?), (?, 'Q2', 33, ?), (?, 'Q3', 33, ?)
                `, [paperId, req.tenant.id, paperId, req.tenant.id, paperId, req.tenant.id]);

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

// Build Paper View
router.get('/exams/papers/:id/build', async (req, res) => {
    try {
        const paperId = req.params.id;
        const [paperRows] = await db.query(`
            SELECT ep.*, s.name as subject_name, c.name as class_name 
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            JOIN classes c ON ep.class_id = c.id
            WHERE ep.id = ? AND ep.tenant_id = ?
        `, [paperId, req.tenant.id]);

        if (paperRows.length === 0) return res.status(404).send('Paper not found');
        
        const [questions] = await db.query('SELECT * FROM exam_questions WHERE exam_paper_id = ? AND tenant_id = ? ORDER BY id', [paperId, req.tenant.id]);

        res.render('exams/build_paper', {
            title: 'Build Exam Paper',
            paper: paperRows[0],
            questions,
            success: req.session.success,
            error: req.session.error
        });
        
        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error(err);
        res.status(500).send("Error loading paper builder");
    }
});

// Add Question
router.post('/exams/papers/:id/questions/add', async (req, res) => {
    const paperId = req.params.id;
    const { question_text, marks } = req.body;
    try {
        await db.query('INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES (?, ?, ?, ?)', 
            [paperId, question_text, marks, req.tenant.id]);
        await updatePaperTotalMarks(paperId, req.tenant.id);
        req.session.success = 'Question added.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add question.';
    }
    res.redirect(`/exams/papers/${paperId}/build`);
});

// Delete Question
router.post('/exams/papers/:id/questions/delete/:q_id', async (req, res) => {
    const { id: paperId, q_id: questionId } = req.params;
    try {
        await db.query('DELETE FROM exam_questions WHERE id = ? AND exam_paper_id = ? AND tenant_id = ?', 
            [questionId, paperId, req.tenant.id]);
        await updatePaperTotalMarks(paperId, req.tenant.id);
        req.session.success = 'Question deleted.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to delete question.';
    }
    res.redirect(`/exams/papers/${paperId}/build`);
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
        `, [paperId, req.tenant.id]);

        if (paperRows.length === 0) return res.status(404).send('Paper not found');
        const paper = paperRows[0];

        const [questions] = await db.query('SELECT * FROM exam_questions WHERE exam_paper_id = ? AND tenant_id = ? ORDER BY id', [paperId, req.tenant.id]);

        const [students] = await db.query(`
            SELECT id, name, reg_no 
            FROM students 
            WHERE class_id = ? AND status = 'active' AND tenant_id = ?
            ORDER BY name
        `, [paper.class_id, req.tenant.id]);

        // Fetch question-level marks
        const [qMarks] = await db.query(`
            SELECT student_id, question_id, obtained_marks 
            FROM exam_question_marks 
            WHERE exam_paper_id = ? AND tenant_id = ?
        `, [paperId, req.tenant.id]);

        const qMarksMap = {}; // qMarksMap[studentId][questionId] = marks
        qMarks.forEach(m => {
            if (!qMarksMap[m.student_id]) qMarksMap[m.student_id] = {};
            qMarksMap[m.student_id][m.question_id] = m.obtained_marks;
        });

        res.render('exams/marks', {
            title: 'Enter Marks',
            paper,
            questions,
            students,
            qMarksMap,
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
    const { student_marks } = req.body; // format: { studentId: { questionId: mark } }
    
    try {
        const connection = await db.pool.getConnection();
        try {
            await connection.beginTransaction();

            if (student_marks && typeof student_marks === 'object') {
                for (const studentId in student_marks) {
                    const qMarks = student_marks[studentId];
                    let totalStudentMarks = 0;

                    for (const questionId in qMarks) {
                        const mark = qMarks[questionId];
                        if (mark !== '') {
                            const parsedMark = parseFloat(mark) || 0;
                            totalStudentMarks += parsedMark;
                            
                            const [existingQ] = await connection.query(`SELECT id FROM exam_question_marks WHERE exam_paper_id = ? AND question_id = ? AND student_id = ? AND tenant_id = ?`, 
                                [paperId, questionId, studentId, req.tenant.id]);

                            if (existingQ.length > 0) {
                                await connection.query(`UPDATE exam_question_marks SET obtained_marks = ? WHERE id = ?`, [parsedMark, existingQ[0].id]);
                            } else {
                                await connection.query(`INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id) VALUES (?, ?, ?, ?, ?)`, 
                                    [paperId, questionId, studentId, parsedMark, req.tenant.id]);
                            }
                        }
                    }

                    // Update the overall paper total for this student
                    const [existingTotal] = await connection.query(`SELECT id FROM exam_marks WHERE exam_paper_id = ? AND student_id = ? AND tenant_id = ?`, 
                        [paperId, studentId, req.tenant.id]);
                    if (existingTotal.length > 0) {
                        await connection.query(`UPDATE exam_marks SET obtained_marks = ? WHERE id = ?`, [totalStudentMarks, existingTotal[0].id]);
                    } else {
                        await connection.query(`INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id) VALUES (?, ?, ?, ?)`, 
                            [paperId, studentId, totalStudentMarks, req.tenant.id]);
                    }
                }
            }
            await connection.commit();
            req.session.success = 'Marks saved successfully.';
        } catch (error) {
            await connection.rollback();
            throw error;
        } finally {
            connection.release();
        }
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to save marks.';
    }
    res.redirect(`/exams/marks/${paperId}`);
});

module.exports = router;
