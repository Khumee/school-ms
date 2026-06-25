const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { requireModule } = require('../middleware/modules');
const {
    detectPhase, getPhaseByKey, computeKhatamPrediction,
    suggestManzilRange, computeAlarms, computeStreak,
    buildParaMap, checkWaqafMilestone
} = require('../utils/hifzEngine');

// Block all Hifz routes if module is disabled
router.use(requireModule('hifz'));

// ============================================================
// Helper: get enrollment + recent entries for a student
// ============================================================
async function getStudentHifzData(tenantId, studentId, entryLimit = 30) {
    const [enrollments] = await db.execute(
        `SELECT e.*, s.name as student_name, s.reg_no, c.name as class_name
         FROM hifz_enrollment e
         JOIN students s ON e.student_id = s.id
         JOIN classes c ON e.class_id = c.id
         WHERE e.tenant_id = ? AND e.student_id = ? AND e.status = 'active' LIMIT 1`,
        [tenantId, studentId]
    );
    if (enrollments.length === 0) return null;
    const enrollment = enrollments[0];

    const [entries] = await db.execute(
        `SELECT * FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ? ORDER BY entry_date DESC LIMIT ${parseInt(entryLimit)}`,
        [tenantId, studentId]
    );
    const [completions] = await db.execute(
        `SELECT * FROM hifz_para_completions WHERE tenant_id = ? AND student_id = ? ORDER BY para_no`,
        [tenantId, studentId]
    );
    const [waqafRows] = await db.execute(
        `SELECT * FROM hifz_waqaf_periods WHERE tenant_id = ? AND student_id = ? AND status = 'active' LIMIT 1`,
        [tenantId, studentId]
    );
    const [holidays] = await db.execute(
        `SELECT * FROM hifz_school_holidays WHERE tenant_id = ?`,
        [tenantId]
    );

    const alarms = computeAlarms(entries, enrollment, holidays);
    const streak = computeStreak(entries);
    const paraMap = buildParaMap(enrollment.current_para, completions);
    const activeWaqaf = waqafRows[0] || null;
    const phase = getPhaseByKey(enrollment.current_phase);

    return { enrollment, entries, completions, activeWaqaf, alarms, streak, paraMap, phase };
}

// ============================================================
// GET /hifz — Hifz Roster
// ============================================================
router.get('/hifz', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const userDesignation = req.session.designation || '';
        const isNazimOrAdmin = ['admin', 'superadmin'].includes(req.session.role) ||
                               userDesignation.includes('Nazim') || userDesignation.includes('Principal');

        // Get Hifz classes this user can see
        let classQuery = `SELECT * FROM classes WHERE tenant_id = ? AND is_hifz_class = 1 ORDER BY name`;
        const [hifzClasses] = await db.execute(classQuery, [tenantId]);

        // Get all enrolled students with today's entry status
        const today = new Date().toISOString().split('T')[0];
        const [students] = await db.execute(
            `SELECT e.*, s.name as student_name, s.reg_no, s.gender,
                    c.name as class_name,
                    d.id as today_entry_id,
                    d.is_absent as today_absent,
                    d.sabaq_quality as today_sabaq_quality,
                    d.sabaq_lines as today_sabaq_lines
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date = ?
             WHERE e.tenant_id = ? AND e.status = 'active'
             ORDER BY c.name, s.name`,
            [today, tenantId]
        );

        // Compute alarms count per student (quick check — last 5 entries each)
        const studentsWithAlarms = await Promise.all(students.map(async (s) => {
            const [entries] = await db.execute(
                `SELECT * FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ? ORDER BY entry_date DESC LIMIT 5`,
                [tenantId, s.student_id]
            );
            const phase = getPhaseByKey(s.current_phase);
            const alarms = computeAlarms(entries, s, []);
            const hasCritical = alarms.some(a => a.severity === 'critical');
            const hasWarning  = alarms.some(a => a.severity === 'warning' || a.severity === 'alert');
            return { ...s, alarms, alarmLevel: hasCritical ? 'critical' : hasWarning ? 'warning' : 'ok', phase };
        }));

        const totalStudents = students.length;
        const markedToday   = students.filter(s => s.today_entry_id).length;
        const alarmCount    = studentsWithAlarms.filter(s => s.alarmLevel !== 'ok').length;

        res.render('hifz_roster', {
            students: studentsWithAlarms,
            hifzClasses,
            today,
            totalStudents,
            markedToday,
            alarmCount,
        });
    } catch (err) {
        console.error('Hifz Roster Error:', err);
        res.status(500).send('Error loading Hifz roster.');
    }
});

// ============================================================
// GET /hifz/mark-all — Quick Mark All Matrix
// ============================================================
router.get('/hifz/mark-all', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const today = req.query.date || new Date().toISOString().split('T')[0];

        const [students] = await db.execute(
            `SELECT e.*, s.name as student_name, s.reg_no,
                    c.name as class_name,
                    d.id as entry_id, d.is_absent,
                    d.sabaq_status, d.sabaq_lines, d.sabaq_para, d.sabaq_quality, d.sabaq_tajweed,
                    d.sabqi_status, d.sabqi_para, d.sabqi_quality,
                    d.manzil_status, d.manzil_from_para, d.manzil_to_para, d.manzil_quality,
                    d.teacher_remarks
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date = ?
             WHERE e.tenant_id = ? AND e.status = 'active'
             ORDER BY c.name, s.name`,
            [today, tenantId]
        );

        // For each student without today's entry, get last entry for pre-fill
        const studentsWithPrefill = await Promise.all(students.map(async (s) => {
            const phase = getPhaseByKey(s.current_phase);
            if (s.entry_id) return { ...s, phase, prefill: null };

            const [lastEntries] = await db.execute(
                `SELECT * FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ? ORDER BY entry_date DESC LIMIT 1`,
                [tenantId, s.student_id]
            );
            const last = lastEntries[0] || null;
            return {
                ...s, phase,
                prefill: last ? {
                    sabaq_para: last.sabaq_para || s.current_para,
                    sabaq_lines: last.sabaq_lines || phase.minLines,
                    sabqi_para: last.sabqi_para || Math.max(1, s.current_para - 1),
                    manzil_from_para: last.manzil_from_para || 1,
                    manzil_to_para: last.manzil_to_para || Math.min(3, s.current_para - 1),
                } : {
                    sabaq_para: s.current_para,
                    sabaq_lines: phase.minLines,
                    sabqi_para: Math.max(1, s.current_para - 1),
                    manzil_from_para: 1,
                    manzil_to_para: Math.min(3, s.current_para - 1),
                }
            };
        }));

        res.render('hifz_mark_all', { students: studentsWithPrefill, today });
    } catch (err) {
        console.error('Hifz Mark All Error:', err);
        res.status(500).send('Error loading Quick Mark All.');
    }
});

// ============================================================
// POST /hifz/mark-all — Save bulk entries
// ============================================================
router.post('/hifz/mark-all', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const markedBy = req.session.userId;
        const { date, entries } = req.body; // entries is an object keyed by student_id

        const entryDate = date || new Date().toISOString().split('T')[0];
        const studentIds = Object.keys(entries || {});

        for (const studentId of studentIds) {
            const e = entries[studentId];
            const isAbsent = e.is_absent === 'on' ? 1 : 0;

            // UPSERT using INSERT ... ON DUPLICATE KEY UPDATE
            await db.execute(
                `INSERT INTO hifz_diary_entries
                 (tenant_id, student_id, entry_date, is_absent,
                  sabaq_status, sabaq_lines, sabaq_para, sabaq_quality, sabaq_tajweed,
                  sabqi_status, sabqi_para, sabqi_quality,
                  manzil_status, manzil_from_para, manzil_to_para, manzil_quality,
                  teacher_remarks, marked_by)
                 VALUES (?,?,?,?, ?,?,?,?,?, ?,?,?, ?,?,?,?, ?,?)
                 ON DUPLICATE KEY UPDATE
                  is_absent=VALUES(is_absent),
                  sabaq_status=VALUES(sabaq_status), sabaq_lines=VALUES(sabaq_lines),
                  sabaq_para=VALUES(sabaq_para), sabaq_quality=VALUES(sabaq_quality),
                  sabaq_tajweed=VALUES(sabaq_tajweed),
                  sabqi_status=VALUES(sabqi_status), sabqi_para=VALUES(sabqi_para),
                  sabqi_quality=VALUES(sabqi_quality),
                  manzil_status=VALUES(manzil_status), manzil_from_para=VALUES(manzil_from_para),
                  manzil_to_para=VALUES(manzil_to_para), manzil_quality=VALUES(manzil_quality),
                  teacher_remarks=VALUES(teacher_remarks), marked_by=VALUES(marked_by)`,
                [
                    tenantId, studentId, entryDate, isAbsent,
                    isAbsent ? 'recited' : (e.sabaq_status || 'not_recited'),
                    isAbsent ? null : (e.sabaq_lines || null),
                    isAbsent ? null : (e.sabaq_para || null),
                    isAbsent ? null : (e.sabaq_quality || null),
                    isAbsent ? null : (e.sabaq_tajweed || null),
                    isAbsent ? 'recited' : (e.sabqi_status || 'not_recited'),
                    isAbsent ? null : (e.sabqi_para || null),
                    isAbsent ? null : (e.sabqi_quality || null),
                    isAbsent ? 'recited' : (e.manzil_status || 'not_recited'),
                    isAbsent ? null : (e.manzil_from_para || null),
                    isAbsent ? null : (e.manzil_to_para || null),
                    isAbsent ? null : (e.manzil_quality || null),
                    e.teacher_remarks || null,
                    markedBy
                ]
            );

            // Update enrollment totals if not absent and sabaq recited
            if (!isAbsent && e.sabaq_status === 'recited' && e.sabaq_lines) {
                await db.execute(
                    `UPDATE hifz_enrollment SET
                        total_lines_memorized = total_lines_memorized + ?,
                        current_para = ?,
                        updated_at = NOW()
                     WHERE tenant_id = ? AND student_id = ?`,
                    [parseInt(e.sabaq_lines), parseInt(e.sabaq_para) || null, tenantId, studentId]
                );
            }
        }

        res.redirect(`/hifz/mark-all?date=${entryDate}&success=1`);
    } catch (err) {
        console.error('Hifz Save Error:', err);
        res.status(500).send('Error saving Hifz entries.');
    }
});

// ============================================================
// GET /hifz/student/:studentId — Student Hifz Profile
// ============================================================
router.get('/hifz/student/:studentId', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = parseInt(req.params.studentId);
        const data = await getStudentHifzData(tenantId, studentId);
        if (!data) return res.status(404).send('Student not enrolled in Hifz.');

        // For JSON API (mobile app)
        if (req.headers.accept?.includes('application/json') || req.query.format === 'json') {
            return res.json({
                student: { id: studentId, name: data.enrollment.student_name, reg_no: data.enrollment.reg_no },
                enrollment: {
                    current_phase: data.enrollment.current_phase,
                    phase_label: data.phase.label,
                    current_para: data.enrollment.current_para,
                    expected_lines_min: data.phase.minLines,
                    expected_lines_max: data.phase.maxLines,
                    predicted_khatam: data.enrollment.predicted_khatam_date,
                    streak_days: data.streak,
                    total_lines: data.enrollment.total_lines_memorized,
                },
                alarms: data.alarms,
                para_map: data.paraMap,
                recent_entries: data.entries.slice(0, 10),
            });
        }

        res.render('hifz_student', { ...data, studentId });
    } catch (err) {
        console.error('Hifz Student Error:', err);
        res.status(500).send('Error loading student Hifz profile.');
    }
});

// ============================================================
// GET /hifz/enroll — Enrollment form
// ============================================================
router.get('/hifz/enroll', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [hifzClasses] = await db.execute(
            `SELECT * FROM classes WHERE tenant_id = ? AND is_hifz_class = 1 ORDER BY name`, [tenantId]
        );
        const [enrolledIds] = await db.execute(
            `SELECT student_id FROM hifz_enrollment WHERE tenant_id = ? AND status = 'active'`, [tenantId]
        );
        const enrolledSet = new Set(enrolledIds.map(r => r.student_id));
        const [allStudents] = await db.execute(
            `SELECT s.id, s.name, s.reg_no, c.name as class_name FROM students s
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE s.tenant_id = ? AND s.status = 'active' ORDER BY s.name`,
            [tenantId]
        );
        const unenrolled = allStudents.filter(s => !enrolledSet.has(s.id));
        res.render('hifz_enroll', { unenrolled, hifzClasses });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading enrollment form.');
    }
});

// POST /hifz/enroll
router.post('/hifz/enroll', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { student_id, class_id, enrolled_date, notes } = req.body;
        await db.execute(
            `INSERT INTO hifz_enrollment (tenant_id, student_id, class_id, enrolled_date, notes)
             VALUES (?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE status='active', class_id=VALUES(class_id), notes=VALUES(notes)`,
            [tenantId, student_id, class_id, enrolled_date || new Date().toISOString().split('T')[0], notes || null]
        );
        res.redirect('/hifz');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error enrolling student.');
    }
});

// ============================================================
// GET/POST /hifz/test/:studentId — Para Test
// ============================================================
router.get('/hifz/test/:studentId', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = parseInt(req.params.studentId);
        const data = await getStudentHifzData(tenantId, studentId);
        if (!data) return res.status(404).send('Student not enrolled.');

        const [pendingTests] = await db.execute(
            `SELECT * FROM hifz_para_completions WHERE tenant_id = ? AND student_id = ? AND test_result = 'pending' ORDER BY para_no`,
            [tenantId, studentId]
        );
        res.render('hifz_para_test', { ...data, studentId, pendingTests });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading para test form.');
    }
});

router.post('/hifz/test/:studentId', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = parseInt(req.params.studentId);
        const { para_no, test_date, test_result, evaluator_name, evaluated_by_self, test_notes } = req.body;
        await db.execute(
            `INSERT INTO hifz_para_completions
             (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
             VALUES (?, ?, ?, CURDATE(), ?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE
              test_date=VALUES(test_date), test_result=VALUES(test_result),
              test_evaluator_name=VALUES(test_evaluator_name), evaluated_by_self=VALUES(evaluated_by_self),
              test_notes=VALUES(test_notes)`,
            [tenantId, studentId, para_no, test_date || null, test_result,
             evaluator_name || null, evaluated_by_self === 'on' ? 1 : 0, test_notes || null]
        );
        res.redirect(`/hifz/student/${studentId}?test=saved`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error saving para test.');
    }
});

// ============================================================
// GET /hifz/calendar — School Holidays
// ============================================================
router.get('/hifz/calendar', isAuthenticated, async (req, res) => {
    try {
        const [holidays] = await db.execute(
            `SELECT * FROM hifz_school_holidays WHERE tenant_id = ? ORDER BY holiday_date DESC`,
            [req.tenant.id]
        );
        res.render('hifz_calendar', { holidays });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading calendar.');
    }
});

router.post('/hifz/calendar', isAuthenticated, async (req, res) => {
    const { holiday_date, description } = req.body;
    try {
        await db.execute(
            `INSERT IGNORE INTO hifz_school_holidays (tenant_id, holiday_date, description) VALUES (?, ?, ?)`,
            [req.tenant.id, holiday_date, description || null]
        );
        res.redirect('/hifz/calendar');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding holiday.');
    }
});

router.post('/hifz/calendar/delete/:id', isAuthenticated, async (req, res) => {
    await db.execute(`DELETE FROM hifz_school_holidays WHERE id = ? AND tenant_id = ?`, [req.params.id, req.tenant.id]);
    res.redirect('/hifz/calendar');
});

// ============================================================
// GET /hifz/report/weekly — Weekly Report
// ============================================================
router.get('/hifz/report/weekly', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const weekAgo = new Date(); weekAgo.setDate(weekAgo.getDate() - 7);
        const weekAgoStr = weekAgo.toISOString().split('T')[0];

        const [students] = await db.execute(
            `SELECT e.*, s.name as student_name, s.reg_no, c.name as class_name,
                    COUNT(d.id) as days_logged,
                    SUM(CASE WHEN d.is_absent = 1 THEN 1 ELSE 0 END) as days_absent,
                    AVG(CASE WHEN d.sabaq_status = 'recited' THEN d.sabaq_lines ELSE NULL END) as avg_lines
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date >= ?
             WHERE e.tenant_id = ? AND e.status = 'active'
             GROUP BY e.id
             ORDER BY c.name, s.name`,
            [weekAgoStr, tenantId]
        );

        const studentsWithAlarms = await Promise.all(students.map(async (s) => {
            const [entries] = await db.execute(
                `SELECT * FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ? ORDER BY entry_date DESC LIMIT 7`,
                [tenantId, s.student_id]
            );
            const alarms = computeAlarms(entries, s, []);
            return { ...s, alarms, phase: getPhaseByKey(s.current_phase) };
        }));

        res.render('hifz_report', { students: studentsWithAlarms, weekAgoStr });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading weekly report.');
    }
});

module.exports = router;
