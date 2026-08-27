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
        const isAdmin = req.session.roleName === 'Admin' || req.session.role === 'admin' || req.session.role === 'master' || req.session.userId === -1 || (req.session.permissions && req.session.permissions.includes('Exams'));
        const [exams] = await db.query('SELECT * FROM exams WHERE tenant_id = ? ORDER BY start_date DESC', [req.tenant.id]);
        
        res.render('exams/manage', {
            title: 'Manage Exams',
            exams,
            isAdmin,
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
        const [insertRes] = await db.query('INSERT INTO exams (name, start_date, end_date, tenant_id) VALUES (?, ?, ?, ?)', 
            [name, start_date, end_date, req.tenant.id]);
        const newExamId = insertRes.insertId;

        // Initialize papers for all subjects with 0 marks (Not Started)
        const [subjects] = await db.query(`
            SELECT s.id as subject_id, s.class_id,
                   (SELECT p.employee_id FROM periods p WHERE p.subject_id = s.id AND p.tenant_id = s.tenant_id LIMIT 1) as teacher_id
            FROM subjects s
            WHERE s.tenant_id = ?
        `, [req.tenant.id]);

        const [teachers] = await db.query('SELECT id FROM employees WHERE role = "teacher" AND tenant_id = ? LIMIT 1', [req.tenant.id]);
        const defaultTeacherId = teachers.length > 0 ? teachers[0].id : null;

        for (const sub of subjects) {
            const assignedTeacher = sub.teacher_id || defaultTeacherId;
            if (assignedTeacher) {
                await db.query(`
                    INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
                    VALUES (?, ?, ?, ?, 0, ?)
                `, [newExamId, sub.class_id, sub.subject_id, assignedTeacher, req.tenant.id]);
            }
        }

        req.session.success = `Exam "${name}" created with papers initialized.`;
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add exam.';
    }
    res.redirect('/exams/manage');
});

// Delete Exam (Admin Only with cascading cleanup)
router.post('/exams/delete/:id', async (req, res) => {
    const isAdmin = req.session.roleName === 'Admin' || req.session.role === 'admin' || req.session.role === 'master' || req.session.userId === -1;
    if (!isAdmin) {
        req.session.error = 'Unauthorized: Only Administrators can delete examination terms.';
        return res.redirect('/exams/manage');
    }

    const examId = req.params.id;
    try {
        const [paperRows] = await db.query('SELECT id FROM exam_papers WHERE exam_id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        const paperIds = paperRows.map(p => p.id);

        if (paperIds.length > 0) {
            await db.query(`DELETE FROM exam_question_marks WHERE exam_paper_id IN (?) AND tenant_id = ?`, [paperIds, req.tenant.id]);
            await db.query(`DELETE FROM exam_marks WHERE exam_paper_id IN (?) AND tenant_id = ?`, [paperIds, req.tenant.id]);
            await db.query(`DELETE FROM exam_questions WHERE exam_paper_id IN (?) AND tenant_id = ?`, [paperIds, req.tenant.id]);
            await db.query(`DELETE FROM exam_papers WHERE exam_id = ? AND tenant_id = ?`, [examId, req.tenant.id]);
        }

        await db.query('DELETE FROM exams WHERE id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        req.session.success = 'Examination and all associated papers/marks deleted successfully.';
    } catch (err) {
        console.error('Error deleting exam:', err);
        req.session.error = 'Failed to delete examination.';
    }
    res.redirect('/exams/manage');
});

// Exam Papers View
router.get('/exams/papers', async (req, res) => {
    try {
        const isAdmin = req.session.roleName === 'Admin' || req.session.role === 'admin' || req.session.role === 'master' || req.session.userId === -1 || (req.session.permissions && req.session.permissions.includes('Exams'));
        const { exam_id, classId, search } = req.query;
        
        const [exams] = await db.query('SELECT id, name FROM exams WHERE tenant_id = ? ORDER BY id DESC', [req.tenant.id]);
        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenant.id]);
        const [teachers] = await db.query('SELECT id, name FROM employees WHERE role = "teacher" AND tenant_id = ? ORDER BY name', [req.tenant.id]);
        const [allSubjects] = await db.query('SELECT id, name, class_id FROM subjects WHERE tenant_id = ? ORDER BY name', [req.tenant.id]);
        
        let selectedExamId = exam_id || (exams.length > 0 ? exams[0].id : null);
        // Default to first class (Nursery class) if no filter specified
        let selectedClassId = classId !== undefined ? classId : (classes.length > 0 ? String(classes[0].id) : '');
        let papers = [];

        if (selectedExamId) {
            let query = `
                SELECT ep.*, s.name as subject_name, c.name as class_name, e.name as teacher_name 
                FROM exam_papers ep
                JOIN subjects s ON ep.subject_id = s.id
                JOIN classes c ON ep.class_id = c.id
                LEFT JOIN employees e ON ep.teacher_id = e.id
                WHERE ep.exam_id = ? AND ep.tenant_id = ?
            `;
            const params = [selectedExamId, req.tenant.id];

            if (selectedClassId) {
                query += ' AND ep.class_id = ?';
                params.push(selectedClassId);
            }

            if (search && search.trim()) {
                query += ' AND (s.name LIKE ? OR e.name LIKE ? OR c.name LIKE ?)';
                params.push(`%${search.trim()}%`, `%${search.trim()}%`, `%${search.trim()}%`);
            }

            if (!isAdmin) {
                const [employee] = await db.query('SELECT id FROM employees WHERE user_id = ? AND tenant_id = ?', [req.session.userId, req.tenant.id]);
                if (employee.length > 0) {
                    query += ' AND ep.teacher_id = ?';
                    params.push(employee[0].id);
                } else {
                    query += ' AND ep.teacher_id = -1'; 
                }
            }

            query += ' ORDER BY c.id, s.name';

            [papers] = await db.query(query, params);
        }

        res.render('exams/papers', {
            title: 'Exam Papers',
            exams,
            classes,
            teachers,
            allSubjects,
            papers,
            selectedExamId,
            classId: selectedClassId,
            search: search || '',
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

// Add Single Exam Paper manually
router.post('/exams/papers/add', async (req, res) => {
    const { exam_id, class_id, subject_id, teacher_id, total_marks } = req.body;
    try {
        const [existing] = await db.query(
            'SELECT id FROM exam_papers WHERE exam_id = ? AND class_id = ? AND subject_id = ? AND tenant_id = ?',
            [exam_id, class_id, subject_id, req.tenant.id]
        );

        if (existing.length > 0) {
            req.session.error = 'A paper for this subject and class already exists in this examination.';
            return res.redirect(`/exams/papers?exam_id=${exam_id}`);
        }

        await db.query(`
            INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
            VALUES (?, ?, ?, ?, ?, ?)
        `, [exam_id, class_id, subject_id, teacher_id, total_marks || 0, req.tenant.id]);

        req.session.success = 'Exam paper added successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to add exam paper.';
    }
    res.redirect(`/exams/papers?exam_id=${exam_id}&classId=${class_id}`);
});

// Delete Exam Paper
router.post('/exams/papers/delete/:id', async (req, res) => {
    const { exam_id } = req.body;
    try {
        await db.query('DELETE FROM exam_question_marks WHERE exam_paper_id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        await db.query('DELETE FROM exam_marks WHERE exam_paper_id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        await db.query('DELETE FROM exam_questions WHERE exam_paper_id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        await db.query('DELETE FROM exam_papers WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        req.session.success = 'Exam paper deleted successfully.';
    } catch (err) {
        console.error(err);
        req.session.error = 'Failed to delete exam paper.';
    }
    res.redirect(`/exams/papers?exam_id=${exam_id}`);
});

// Build Paper View
router.get('/exams/papers/:id/build', async (req, res) => {
    try {
        const paperId = req.params.id;
        const [paperRows] = await db.query(`
            SELECT ep.*, s.name as subject_name, c.name as class_name, ex.name as exam_name 
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            JOIN classes c ON ep.class_id = c.id
            JOIN exams ex ON ep.exam_id = ex.id
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

// Exam Date Sheet View
router.get('/exams/:id/datesheet', async (req, res) => {
    try {
        const examId = req.params.id;
        const { class_id } = req.query;

        const [exams] = await db.query('SELECT * FROM exams WHERE id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        if (exams.length === 0) return res.status(404).send('Exam not found');
        const exam = exams[0];

        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenant.id]);
        let selectedClassId = class_id !== undefined ? class_id : (classes.length > 0 ? String(classes[0].id) : 'all');

        let query = `
            SELECT ep.*, s.name as subject_name, c.name as class_name, e.name as teacher_name 
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            JOIN classes c ON ep.class_id = c.id
            LEFT JOIN employees e ON ep.teacher_id = e.id
            WHERE ep.exam_id = ? AND ep.tenant_id = ?
        `;
        const params = [examId, req.tenant.id];

        if (selectedClassId !== 'all') {
            query += ' AND ep.class_id = ?';
            params.push(selectedClassId);
        }

        query += ' ORDER BY c.id, ep.paper_date ASC, s.name ASC';
        const [papers] = await db.query(query, params);

        let classDateSheets = [];
        if (selectedClassId === 'all') {
            classes.forEach(c => {
                const cPapers = papers.filter(p => p.class_id === c.id);
                if (cPapers.length > 0) {
                    classDateSheets.push({
                        classId: c.id,
                        className: c.name,
                        papers: cPapers
                    });
                }
            });
        } else {
            const foundClass = classes.find(c => String(c.id) === String(selectedClassId));
            classDateSheets.push({
                classId: selectedClassId,
                className: foundClass ? foundClass.name : 'Class',
                papers: papers
            });
        }

        res.render('exams/datesheet', {
            title: `Date Sheet - ${exam.name}`,
            exam,
            classes,
            classDateSheets,
            selectedClassId,
            success: req.session.success,
            error: req.session.error
        });

        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error('Error loading datesheet:', err);
        res.status(500).send('Error loading datesheet');
    }
});

// Set Paper Date & Time
router.post('/exams/papers/:id/set-date', async (req, res) => {
    const paperId = req.params.id;
    const { exam_id, class_id, paper_date, start_time, end_time } = req.body;
    try {
        await db.query(`
            UPDATE exam_papers 
            SET paper_date = ?, start_time = ?, end_time = ?
            WHERE id = ? AND tenant_id = ?
        `, [paper_date || null, start_time || null, end_time || null, paperId, req.tenant.id]);

        req.session.success = 'Paper date & time updated.';
    } catch (err) {
        console.error('Error updating paper date:', err);
        req.session.error = 'Failed to update paper date.';
    }
    res.redirect(`/exams/${exam_id}/datesheet?class_id=${class_id || ''}`);
});

// Quick Update Paper Date via AJAX from Papers View
router.post('/exams/papers/:id/quick-date', async (req, res) => {
    const paperId = req.params.id;
    const { paper_date } = req.body;
    try {
        await db.query(`
            UPDATE exam_papers 
            SET paper_date = ?
            WHERE id = ? AND tenant_id = ?
        `, [paper_date || null, paperId, req.tenant.id]);

        res.json({ success: true, message: 'Exam date saved' });
    } catch (err) {
        console.error('Error in quick-date:', err);
        res.status(500).json({ success: false, error: 'Failed to update date' });
    }
});

// Grade & Status helper
function calculateGrade(percentage) {
    if (percentage >= 90) return { grade: 'A+ (Outstanding)', gradeClass: 'success', status: 'Passed' };
    if (percentage >= 80) return { grade: 'A (Excellent)', gradeClass: 'primary', status: 'Passed' };
    if (percentage >= 70) return { grade: 'B+ (Very Good)', gradeClass: 'info', status: 'Passed' };
    if (percentage >= 60) return { grade: 'B (Good)', gradeClass: 'info', status: 'Passed' };
    if (percentage >= 50) return { grade: 'C (Satisfactory)', gradeClass: 'warning', status: 'Passed' };
    if (percentage >= 40) return { grade: 'D (Pass)', gradeClass: 'warning', status: 'Passed' };
    return { grade: 'F (Needs Improvement)', gradeClass: 'danger', status: 'Failed' };
}

// 1. Exam Results Tabulation View
router.get('/exams/:id/results', async (req, res) => {
    try {
        const examId = req.params.id;
        const { class_id } = req.query;

        const [exams] = await db.query('SELECT * FROM exams WHERE id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        if (exams.length === 0) return res.status(404).send('Exam not found');
        const exam = exams[0];

        const [classes] = await db.query('SELECT id, name FROM classes WHERE tenant_id = ? ORDER BY id', [req.tenant.id]);
        let selectedClassId = class_id !== undefined ? class_id : (classes.length > 0 ? String(classes[0].id) : '');
        const selectedClass = classes.find(c => String(c.id) === String(selectedClassId));
        const selectedClassName = selectedClass ? selectedClass.name : 'Class';

        let studentsList = [];

        if (selectedClassId) {
            // Get active students of the class
            const [students] = await db.query(`
                SELECT id, name, father_name, reg_no, class_id 
                FROM students 
                WHERE class_id = ? AND tenant_id = ? AND status = 'active'
                ORDER BY reg_no, name
            `, [selectedClassId, req.tenant.id]);

            // Get papers and max marks of this class
            const [papers] = await db.query(`
                SELECT ep.id as paper_id, ep.total_marks, s.name as subject_name 
                FROM exam_papers ep
                JOIN subjects s ON ep.subject_id = s.id
                WHERE ep.exam_id = ? AND ep.class_id = ? AND ep.tenant_id = ?
            `, [examId, selectedClassId, req.tenant.id]);

            // Get obtained marks
            const [marks] = await db.query(`
                SELECT em.exam_paper_id, em.student_id, em.obtained_marks 
                FROM exam_marks em
                JOIN exam_papers ep ON em.exam_paper_id = ep.id
                WHERE ep.exam_id = ? AND ep.class_id = ? AND em.tenant_id = ?
            `, [examId, selectedClassId, req.tenant.id]);

            let totalClassMax = 0;
            papers.forEach(p => { totalClassMax += Number(p.total_marks) || 0; });

            students.forEach(st => {
                const stMarks = marks.filter(m => m.student_id === st.id);
                let totalObtained = 0;
                let hasMarks = false;

                stMarks.forEach(m => {
                    if (m.obtained_marks !== null && m.obtained_marks !== undefined) {
                        totalObtained += Number(m.obtained_marks);
                        hasMarks = true;
                    }
                });

                const pct = (totalClassMax > 0 && hasMarks) ? (totalObtained / totalClassMax) * 100 : 0;
                const gradeInfo = calculateGrade(pct);

                studentsList.push({
                    ...st,
                    totalMax: totalClassMax,
                    totalObtained: Math.round(totalObtained * 100) / 100,
                    percentage: pct,
                    gradeInfo: gradeInfo,
                    hasMarks: hasMarks
                });
            });
        }

        res.render('exams/results', {
            title: `Results - ${exam.name}`,
            exam,
            classes,
            selectedClassId,
            selectedClassName,
            students: studentsList,
            success: req.session.success,
            error: req.session.error
        });

        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error('Error loading exam results:', err);
        res.status(500).send("Error loading exam results: " + err.message);
    }
});

// 2. Single Student Report Card
router.get('/exams/:id/student/:student_id/report-card', async (req, res) => {
    try {
        const examId = req.params.id;
        const studentId = req.params.student_id;

        const [exams] = await db.query('SELECT * FROM exams WHERE id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        if (exams.length === 0) return res.status(404).send('Exam not found');
        const exam = exams[0];

        const [students] = await db.query(`
            SELECT s.*, c.name as class_name 
            FROM students s 
            JOIN classes c ON s.class_id = c.id
            WHERE s.id = ? AND s.tenant_id = ?
        `, [studentId, req.tenant.id]);
        if (students.length === 0) return res.status(404).send('Student not found');
        const student = students[0];

        // Fetch all subject papers & marks for this student in this exam
        const [papers] = await db.query(`
            SELECT ep.id as paper_id, ep.total_marks as max_marks, s.name as subject_name,
                   em.obtained_marks
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            LEFT JOIN exam_marks em ON em.exam_paper_id = ep.id AND em.student_id = ? AND em.tenant_id = ep.tenant_id
            WHERE ep.exam_id = ? AND ep.class_id = ? AND ep.tenant_id = ?
            ORDER BY s.name ASC
        `, [student.id, examId, student.class_id, req.tenant.id]);

        let totalMax = 0;
        let totalObtained = 0;
        let hasAnyMarks = false;

        papers.forEach(p => {
            const maxM = Number(p.max_marks) || 0;
            totalMax += maxM;
            if (p.obtained_marks !== null && p.obtained_marks !== undefined) {
                totalObtained += Number(p.obtained_marks);
                hasAnyMarks = true;
            }
        });

        const pct = totalMax > 0 && hasAnyMarks ? (totalObtained / totalMax) * 100 : 0;
        const gradeInfo = calculateGrade(pct);

        const card = {
            student,
            results: papers,
            totalMax,
            totalObtained: Math.round(totalObtained * 100) / 100,
            percentage: pct,
            gradeInfo,
            hasAnyMarks
        };

        res.render('exams/report_card', {
            title: `Report Card - ${student.name}`,
            exam,
            examCards: [card],
            success: req.session.success,
            error: req.session.error
        });

        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error('Error rendering report card:', err);
        res.status(500).send('Error rendering report card: ' + err.message);
    }
});

// 3. Batch Class Report Cards (for Whole Class Printing)
router.get('/exams/:id/class/:class_id/report-cards', async (req, res) => {
    try {
        const examId = req.params.id;
        const classId = req.params.class_id;

        const [exams] = await db.query('SELECT * FROM exams WHERE id = ? AND tenant_id = ?', [examId, req.tenant.id]);
        if (exams.length === 0) return res.status(404).send('Exam not found');
        const exam = exams[0];

        const [students] = await db.query(`
            SELECT s.*, c.name as class_name 
            FROM students s 
            JOIN classes c ON s.class_id = c.id
            WHERE s.class_id = ? AND s.tenant_id = ? AND s.status = 'active'
            ORDER BY s.reg_no, s.name
        `, [classId, req.tenant.id]);

        const [papers] = await db.query(`
            SELECT ep.id as paper_id, ep.total_marks as max_marks, s.name as subject_name 
            FROM exam_papers ep
            JOIN subjects s ON ep.subject_id = s.id
            WHERE ep.exam_id = ? AND ep.class_id = ? AND ep.tenant_id = ?
            ORDER BY s.name ASC
        `, [examId, classId, req.tenant.id]);

        const [marks] = await db.query(`
            SELECT em.exam_paper_id, em.student_id, em.obtained_marks 
            FROM exam_marks em
            JOIN exam_papers ep ON em.exam_paper_id = ep.id
            WHERE ep.exam_id = ? AND ep.class_id = ? AND em.tenant_id = ?
        `, [examId, classId, req.tenant.id]);

        let examCards = [];

        students.forEach(st => {
            let totalMax = 0;
            let totalObtained = 0;
            let hasAnyMarks = false;

            const stResults = papers.map(p => {
                const maxM = Number(p.max_marks) || 0;
                totalMax += maxM;
                const foundMark = marks.find(m => m.student_id === st.id && m.exam_paper_id === p.paper_id);
                const obt = (foundMark && foundMark.obtained_marks !== null) ? Number(foundMark.obtained_marks) : null;
                if (obt !== null) {
                    totalObtained += obt;
                    hasAnyMarks = true;
                }
                return {
                    ...p,
                    obtained_marks: obt
                };
            });

            const pct = totalMax > 0 && hasAnyMarks ? (totalObtained / totalMax) * 100 : 0;
            const gradeInfo = calculateGrade(pct);

            examCards.push({
                student: st,
                results: stResults,
                totalMax,
                totalObtained: Math.round(totalObtained * 100) / 100,
                percentage: pct,
                gradeInfo,
                hasAnyMarks
            });
        });

        res.render('exams/report_card', {
            title: `Batch Report Cards - Class`,
            exam,
            examCards,
            success: req.session.success,
            error: req.session.error
        });

        delete req.session.success;
        delete req.session.error;
    } catch (err) {
        console.error('Error rendering batch report cards:', err);
        res.status(500).send('Error rendering report cards: ' + err.message);
    }
});

module.exports = router;
