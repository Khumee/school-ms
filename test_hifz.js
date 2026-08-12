const db = require('./db');
const hifz = require('./routes/hifz'); // wait, this might crash if it starts the router
// let's just write a script that connects and renders the view.
// Actually, let's copy the getStudentHifzData and the view rendering manually to catch the error.

const express = require('express');
const app = express();
app.set('view engine', 'ejs');
app.set('views', './views');

(async () => {
    try {
        const tenantId = 4;
        const [enrolls] = await db.execute(`SELECT student_id FROM hifz_enrollment WHERE tenant_id = ? LIMIT 1`, [tenantId]);
        if (enrolls.length === 0) {
            console.log('No students found');
            process.exit(1);
        }
        const studentId = enrolls[0].student_id;
        console.log('Testing with student_id:', studentId);

        // Instead of testing EJS, let's fetch the data directly
        const [enrollments] = await db.execute(
            `SELECT e.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM hifz_enrollment e
             JOIN students s ON e.student_id = s.id
             JOIN classes c ON e.class_id = c.id
             WHERE e.tenant_id = ? AND e.student_id = ? AND e.status = 'active' LIMIT 1`,
            [tenantId, studentId]
        );
        console.log('enrollment:', enrollments[0]);

        const { detectPhase, getPhaseByKey, computeKhatamPrediction, suggestManzilRange } = require('./utils/hifzEngine');
        
        const [entries] = await db.execute(
            `SELECT * FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ? ORDER BY entry_date DESC LIMIT 30`,
            [tenantId, studentId]
        );
        const [completions] = await db.execute(
            `SELECT * FROM hifz_para_completions WHERE tenant_id = ? AND student_id = ? ORDER BY para_no`,
            [tenantId, studentId]
        );
        console.log('Got entries, completions');

        // Test hifzEngine alarms
        const hifzEngine = require('./utils/hifzEngine');
        const alarms = hifzEngine.computeAlarms ? hifzEngine.computeAlarms(entries, enrollments[0], []) : [];
        console.log('alarms:', alarms);

        // Try rendering via ejs directly
        const ejs = require('ejs');
        const fs = require('fs');
        const template = fs.readFileSync('./views/hifz_student.ejs', 'utf-8');
        const html = ejs.render(template, {
            enrollment: enrollments[0],
            entries,
            completions,
            activeWaqaf: null,
            alarms,
            streak: 0,
            paraMap: [],
            phase: { label: 'Early' },
            studentId,
            weeklyStats: { daysLogged: 5, daysAbsent: 0, avgLines: 15.0 },
            user: { role: 'admin' },
            tenant: { id: tenantId, settings: { currency: 'PKR' } },
            session: { userId: 1 }
        }, { filename: './views/hifz_student.ejs' });
        console.log('Render successful!');
    } catch (e) {
        console.error('Error caught:', e);
    }
    process.exit(0);
})();
