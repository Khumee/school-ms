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
router.use('/hifz', requireModule('hifz'));

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

// Helper: Dynamically calculate 30-day pace and update Estimated Khatam Date
async function updateStudentKhatamPrediction(tenantId, studentId) {
    const [entries] = await db.execute(
        `SELECT sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line 
         FROM hifz_diary_entries 
         WHERE tenant_id = ? AND student_id = ? AND sabaq_status = 'recited' AND is_absent = 0 
         ORDER BY entry_date DESC LIMIT 30`,
        [tenantId, studentId]
    );

    let totalLines = 0;
    let count = 0;
    for (const e of entries) {
        if (e.sabaq_from_page !== null && e.sabaq_to_page !== null) {
            const fromP = parseInt(e.sabaq_from_page) || 0;
            const toP = parseInt(e.sabaq_to_page) || 0;
            const fromL = parseInt(e.sabaq_from_line) || 1;
            const toL = parseInt(e.sabaq_to_line) || 16;
            
            if (fromP > 0 && toP >= fromP) {
                let lines = 0;
                if (toP === fromP) {
                    lines = Math.max(0, toL - fromL + 1);
                } else {
                    lines = Math.max(0, (15 - fromL + 1) + (toP - fromP - 1) * 15 + toL);
                }
                totalLines += lines;
                count++;
            }
        }
    }

    const avgLines30d = count > 0 ? (totalLines / count) : 4.5;

    // Get total lines memorized so far
    const [enrollments] = await db.execute(
        `SELECT total_lines_memorized FROM hifz_enrollment WHERE tenant_id = ? AND student_id = ?`,
        [tenantId, studentId]
    );
    if (enrollments.length === 0) return;
    const totalMemorized = enrollments[0].total_lines_memorized || 0;

    const predicted = computeKhatamPrediction(totalMemorized, avgLines30d);

    await db.execute(
        `UPDATE hifz_enrollment 
         SET avg_lines_30d = ?, predicted_khatam_date = ?, updated_at = NOW() 
         WHERE tenant_id = ? AND student_id = ?`,
        [avgLines30d, predicted, tenantId, studentId]
    );
}

// ============================================================
// GET /hifz — Hifz Roster
// ============================================================
router.get('/hifz', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const userDesignation = req.session.designation || '';

        // Get Hifz classes this user can see
        let classQuery = `SELECT * FROM classes WHERE tenant_id = ? AND is_hifz_class = 1 ORDER BY name`;
        const [hifzClasses] = await db.execute(classQuery, [tenantId]);

        // Get all enrolled students with today's entry status
        const today = new Date().toISOString().split('T')[0];
        const [students] = await db.execute(
            `SELECT e.*, s.name as student_name, s.reg_no, s.gender,
                    c.name as class_name,
                    d.id as today_entry_id,
                    d.is_absent as today_absent
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date = ?
             WHERE e.tenant_id = ? AND e.status = 'active'
             ORDER BY c.name, s.name`,
            [today, tenantId]
        );

        // Compute alarms count per student
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
// GET /hifz/student/:studentId/diary — Individual Student Form
// ============================================================
router.get('/hifz/student/:studentId/diary', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = parseInt(req.params.studentId);
        const data = await getStudentHifzData(tenantId, studentId);
        if (!data) return res.status(404).send('Student not enrolled in Hifz.');

        res.render('hifz_diary', { ...data, studentId });
    } catch (err) {
        console.error('Hifz Diary Form Error:', err);
        res.status(500).send('Error loading Hifz diary form.');
    }
});

// ============================================================
// POST /hifz/student/:studentId/diary — Save Individual Student Entry
// ============================================================
router.post('/hifz/student/:studentId/diary', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const studentId = parseInt(req.params.studentId);
        const markedBy = req.session.userId;
        const {
            entry_date, is_absent,
            sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_quality, sabaq_tajweed,
            sabqi_status, sabqi_para, sabqi_para_2, sabqi_quality,
            manzil_status, manzil_para_1, manzil_para_2, manzil_para_3, manzil_quality,
            teacher_remarks
        } = req.body;

        const absentVal = is_absent === 'on' ? 1 : 0;

        await db.execute(
            `INSERT INTO hifz_diary_entries
             (tenant_id, student_id, entry_date, is_absent,
              sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_quality, sabaq_tajweed,
              sabqi_status, sabqi_para, sabqi_para_2, sabqi_quality,
              manzil_status, manzil_para_1, manzil_para_2, manzil_para_3, manzil_quality,
              teacher_remarks, marked_by)
             VALUES (?,?,?,?, ?,?,?,?,?,?,?,?,?, ?,?,?,?, ?,?,?,?,?, ?,?)
             ON DUPLICATE KEY UPDATE
              is_absent=VALUES(is_absent),
              sabaq_status=VALUES(sabaq_status), sabaq_from_para=VALUES(sabaq_from_para), sabaq_to_para=VALUES(sabaq_to_para),
              sabaq_from_page=VALUES(sabaq_from_page), sabaq_to_page=VALUES(sabaq_to_page),
              sabaq_from_line=VALUES(sabaq_from_line), sabaq_to_line=VALUES(sabaq_to_line),
              sabaq_quality=VALUES(sabaq_quality), sabaq_tajweed=VALUES(sabaq_tajweed),
              sabqi_status=VALUES(sabqi_status), sabqi_para=VALUES(sabqi_para), sabqi_para_2=VALUES(sabqi_para_2), sabqi_quality=VALUES(sabqi_quality),
              manzil_status=VALUES(manzil_status), manzil_para_1=VALUES(manzil_para_1), manzil_para_2=VALUES(manzil_para_2), manzil_para_3=VALUES(manzil_para_3),
              manzil_quality=VALUES(manzil_quality), teacher_remarks=VALUES(teacher_remarks), marked_by=VALUES(marked_by)`,
            [
                tenantId, studentId, entry_date, absentVal,
                absentVal ? 'recited' : (sabaq_status || 'not_recited'),
                absentVal ? null : (sabaq_from_para || null),
                absentVal ? null : (sabaq_to_para || null),
                absentVal ? null : (sabaq_from_page || null),
                absentVal ? null : (sabaq_to_page || null),
                absentVal ? null : (sabaq_from_line || null),
                absentVal ? null : (sabaq_to_line || null),
                absentVal ? null : (sabaq_quality || null),
                absentVal ? null : (sabaq_tajweed || null),
                absentVal ? 'recited' : (sabqi_status || 'not_recited'),
                absentVal ? null : (sabqi_para || null),
                absentVal ? null : (sabqi_para_2 || null),
                absentVal ? null : (sabqi_quality || null),
                absentVal ? 'recited' : (manzil_status || 'not_recited'),
                absentVal ? null : (manzil_para_1 || null),
                absentVal ? null : (manzil_para_2 || null),
                absentVal ? null : (manzil_para_3 || null),
                absentVal ? null : (manzil_quality || null),
                teacher_remarks || null,
                markedBy
            ]
        );

        // Update enrollment current_para and trigger Waqaf if sabaq was recited
        if (!absentVal && sabaq_status === 'recited' && sabaq_to_para) {
            const newPara = parseInt(sabaq_to_para);
            await db.execute(
                `UPDATE hifz_enrollment SET current_para = ?, updated_at = NOW() WHERE tenant_id = ? AND student_id = ?`,
                [newPara, tenantId, studentId]
            );

            // If reached milestone 5, 15, or 25, start Waqaf revision break
            if ([5, 15, 25].includes(newPara)) {
                const [waqafCheck] = await db.execute(
                    `SELECT id FROM hifz_waqaf_periods WHERE tenant_id = ? AND student_id = ? AND status = 'active' LIMIT 1`,
                    [tenantId, studentId]
                );
                if (waqafCheck.length === 0) {
                    await db.execute(
                        `INSERT INTO hifz_waqaf_periods (tenant_id, student_id, waqaf_type, started_date, status)
                         VALUES (?, ?, ?, CURDATE(), 'active')`,
                        [tenantId, studentId, `waqaf_${newPara}`]
                    );
                    await db.execute(
                        `UPDATE hifz_enrollment SET current_phase = ? WHERE tenant_id = ? AND student_id = ?`,
                        [`waqaf_${newPara}`, tenantId, studentId]
                    );
                }
            }
        }

        // Calculate and update Khatam Date dynamically
        await updateStudentKhatamPrediction(tenantId, studentId);

        res.redirect(`/hifz/student/${studentId}?success=1`);
    } catch (err) {
        console.error('Save Hifz Diary Error:', err);
        res.status(500).send('Error saving Hifz diary entry.');
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
                    d.sabaq_status, d.sabaq_from_para, d.sabaq_to_para, d.sabaq_from_page, d.sabaq_to_page, d.sabaq_from_line, d.sabaq_to_line, d.sabaq_quality, d.sabaq_tajweed,
                    d.sabqi_status, d.sabqi_para, d.sabqi_para_2, d.sabqi_quality,
                    d.manzil_status, d.manzil_para_1, d.manzil_para_2, d.manzil_para_3, d.manzil_quality,
                    d.teacher_remarks,
                    (SELECT COUNT(*) FROM hifz_waqaf_periods w WHERE w.student_id = e.student_id AND w.tenant_id = e.tenant_id AND w.status = 'active') as is_in_waqaf
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date = ?
             WHERE e.tenant_id = ? AND e.status = 'active'
             ORDER BY c.name, s.name`,
            [today, tenantId]
        );

        // Prefills mapping
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
                    sabaq_from_para: last.sabaq_from_para || s.current_para,
                    sabaq_to_para: last.sabaq_to_para || s.current_para,
                    sabaq_from_page: last.sabaq_from_page || 1,
                    sabaq_to_page: last.sabaq_to_page || 1,
                    sabaq_from_line: last.sabaq_from_line || 1,
                    sabaq_to_line: last.sabaq_to_line || 16,
                    sabqi_para: last.sabqi_para || Math.max(1, s.current_para - 1),
                    sabqi_para_2: last.sabqi_para_2 || '',
                    manzil_para_1: last.manzil_para_1 || 1,
                    manzil_para_2: last.manzil_para_2 || Math.max(1, s.current_para - 2),
                    manzil_para_3: last.manzil_para_3 || Math.max(1, s.current_para - 1),
                } : {
                    sabaq_from_para: s.current_para,
                    sabaq_to_para: s.current_para,
                    sabaq_from_page: 1,
                    sabaq_to_page: 1,
                    sabaq_from_line: 1,
                    sabaq_to_line: 16,
                    sabqi_para: Math.max(1, s.current_para - 1),
                    sabqi_para_2: '',
                    manzil_para_1: 1,
                    manzil_para_2: Math.max(1, s.current_para - 2),
                    manzil_para_3: Math.max(1, s.current_para - 1),
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
        const { date, entries } = req.body;

        const entryDate = date || new Date().toISOString().split('T')[0];
        const studentIds = Object.keys(entries || {});

        for (const studentId of studentIds) {
            const e = entries[studentId];
            const isAbsent = e.is_absent === 'on' ? 1 : 0;

            await db.execute(
                `INSERT INTO hifz_diary_entries
                 (tenant_id, student_id, entry_date, is_absent,
                  sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_quality, sabaq_tajweed,
                  sabqi_status, sabqi_para, sabqi_para_2, sabqi_quality,
                  manzil_status, manzil_para_1, manzil_para_2, manzil_para_3, manzil_quality,
                  teacher_remarks, marked_by)
                 VALUES (?,?,?,?, ?,?,?,?,?,?,?,?,?, ?,?,?,?, ?,?,?,?,?, ?,?)
                 ON DUPLICATE KEY UPDATE
                  is_absent=VALUES(is_absent),
                  sabaq_status=VALUES(sabaq_status), 
                  sabaq_from_para=VALUES(sabaq_from_para), sabaq_to_para=VALUES(sabaq_to_para),
                  sabaq_from_page=VALUES(sabaq_from_page), sabaq_to_page=VALUES(sabaq_to_page),
                  sabaq_from_line=VALUES(sabaq_from_line), sabaq_to_line=VALUES(sabaq_to_line),
                  sabaq_quality=VALUES(sabaq_quality), sabaq_tajweed=VALUES(sabaq_tajweed),
                  sabqi_status=VALUES(sabqi_status), sabqi_para=VALUES(sabqi_para), sabqi_para_2=VALUES(sabqi_para_2), sabqi_quality=VALUES(sabqi_quality),
                  manzil_status=VALUES(manzil_status), manzil_para_1=VALUES(manzil_para_1), manzil_para_2=VALUES(manzil_para_2), manzil_para_3=VALUES(manzil_para_3),
                  manzil_quality=VALUES(manzil_quality), teacher_remarks=VALUES(teacher_remarks), marked_by=VALUES(marked_by)`,
                [
                    tenantId, studentId, entryDate, isAbsent,
                    isAbsent ? 'recited' : (e.sabaq_status || 'not_recited'),
                    isAbsent ? null : (e.sabaq_from_para || null),
                    isAbsent ? null : (e.sabaq_to_para || null),
                    isAbsent ? null : (e.sabaq_from_page || null),
                    isAbsent ? null : (e.sabaq_to_page || null),
                    isAbsent ? null : (e.sabaq_from_line || null),
                    isAbsent ? null : (e.sabaq_to_line || null),
                    isAbsent ? null : (e.sabaq_quality || null),
                    isAbsent ? null : (e.sabaq_tajweed || null),
                    isAbsent ? 'recited' : (e.sabqi_status || 'not_recited'),
                    isAbsent ? null : (e.sabqi_para || null),
                    isAbsent ? null : (e.sabqi_para_2 || null),
                    isAbsent ? null : (e.sabqi_quality || null),
                    isAbsent ? 'recited' : (e.manzil_status || 'not_recited'),
                    isAbsent ? null : (e.manzil_para_1 || null),
                    isAbsent ? null : (e.manzil_para_2 || null),
                    isAbsent ? null : (e.manzil_para_3 || null),
                    isAbsent ? null : (e.manzil_quality || null),
                    e.teacher_remarks || null,
                    markedBy
                ]
            );

            // Update enrollment current_para and trigger Waqaf if sabaq recited
            if (!isAbsent && e.sabaq_status === 'recited' && e.sabaq_to_para) {
                const newPara = parseInt(e.sabaq_to_para);
                await db.execute(
                    `UPDATE hifz_enrollment SET current_para = ?, updated_at = NOW() WHERE tenant_id = ? AND student_id = ?`,
                    [newPara, tenantId, studentId]
                );

                if ([5, 15, 25].includes(newPara)) {
                    // Check if already in active waqaf
                    const [waqafCheck] = await db.execute(
                        `SELECT id FROM hifz_waqaf_periods WHERE tenant_id = ? AND student_id = ? AND status = 'active' LIMIT 1`,
                        [tenantId, studentId]
                    );
                    if (waqafCheck.length === 0) {
                        await db.execute(
                            `INSERT INTO hifz_waqaf_periods (tenant_id, student_id, waqaf_type, started_date, status)
                             VALUES (?, ?, ?, CURDATE(), 'active')`,
                            [tenantId, studentId, `waqaf_${newPara}`]
                        );
                        await db.execute(
                            `UPDATE hifz_enrollment SET current_phase = ? WHERE tenant_id = ? AND student_id = ?`,
                            [`waqaf_${newPara}`, tenantId, studentId]
                        );
                    }
                }
            }

            // Update Khatam prediction dynamically
            await updateStudentKhatamPrediction(tenantId, studentId);
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

        const weekAgo = new Date();
        weekAgo.setDate(weekAgo.getDate() - 7);
        const weekAgoStr = weekAgo.toISOString().split('T')[0];

        const weeklyEntries = data.entries.filter(e => {
            const entryDateStr = new Date(e.entry_date).toISOString().split('T')[0];
            return entryDateStr >= weekAgoStr;
        });

        const weeklyDaysLogged = weeklyEntries.length;
        const weeklyDaysAbsent = weeklyEntries.filter(e => e.is_absent === 1).length;

        let totalWeeklyLines = 0;
        let weeklyRecitedCount = 0;
        weeklyEntries.forEach(e => {
            if (!e.is_absent && e.sabaq_status === 'recited' && e.sabaq_to_line !== null && e.sabaq_from_line !== null) {
                const fromL = parseInt(e.sabaq_from_line) || 1;
                const toL = parseInt(e.sabaq_to_line) || 16;
                totalWeeklyLines += Math.max(0, toL - fromL + 1);
                weeklyRecitedCount++;
            }
        });
        const weeklyAvgLines = weeklyRecitedCount > 0 ? (totalWeeklyLines / weeklyRecitedCount) : 0;

        res.render('hifz_student', { 
            ...data, 
            studentId,
            weeklyStats: {
                daysLogged: weeklyDaysLogged,
                daysAbsent: weeklyDaysAbsent,
                avgLines: weeklyAvgLines,
                startDate: weekAgoStr
            }
        });
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
        const paraNum = parseInt(para_no);

        let dbTestResult = test_result;
        if (test_result === 'passed') dbTestResult = 'pass';
        if (test_result === 'failed') dbTestResult = 'fail';

        await db.execute(
            `INSERT INTO hifz_para_completions
             (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
             VALUES (?, ?, ?, CURDATE(), ?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE
              test_date=VALUES(test_date), test_result=VALUES(test_result),
              test_evaluator_name=VALUES(test_evaluator_name), evaluated_by_self=VALUES(evaluated_by_self),
              test_notes=VALUES(test_notes)`,
            [tenantId, studentId, paraNum, test_date || null, dbTestResult,
             evaluator_name || null, evaluated_by_self === 'on' ? 1 : 0, test_notes || null]
        );

        // If the test result is 'pass', complete active Waqaf revision break
        if (dbTestResult === 'pass') {
            if ([5, 15, 25].includes(paraNum)) {
                await db.execute(
                    `UPDATE hifz_waqaf_periods 
                     SET status = 'completed', completed_date = CURDATE() 
                     WHERE tenant_id = ? AND student_id = ? AND waqaf_type = ? AND status = 'active'`,
                    [tenantId, studentId, `waqaf_${paraNum}`]
                );

                // Re-detect and restore next phase back to standard early/mid/advanced
                const [enroll] = await db.execute(
                    `SELECT enrolled_date FROM hifz_enrollment WHERE tenant_id = ? AND student_id = ?`,
                    [tenantId, studentId]
                );
                let nextPhase = 'early';
                if (enroll.length > 0) {
                    const detected = detectPhase(enroll[0].enrolled_date);
                    nextPhase = detected.key;
                }

                // Increment current_para to next one to start new Sabaq memorization
                await db.execute(
                    `UPDATE hifz_enrollment 
                     SET current_phase = ?, current_para = ?, updated_at = NOW() 
                     WHERE tenant_id = ? AND student_id = ?`,
                    [nextPhase, paraNum + 1, tenantId, studentId]
                );
            }
        }

        // Update Khatam prediction dynamically
        await updateStudentKhatamPrediction(tenantId, studentId);

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
                    AVG(CASE WHEN d.sabaq_status = 'recited' THEN d.sabaq_to_line - d.sabaq_from_line + 1 ELSE NULL END) as avg_lines
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
