const mysql = require('mysql2/promise');
require('dotenv').config();

(async () => {
    try {
        const db = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'admin',
            database: process.env.DB_NAME || 'sms'
        });

        // STRICTLY LIMIT TO TENANT 4
        const tenantId = 4;
        
        console.log(`[PROD] Connecting to database ${process.env.DB_NAME} at ${process.env.DB_HOST}`);
        console.log(`[PROD] Cleaning up existing hifz data ONLY for tenant ${tenantId}...`);
        
        await db.execute('DELETE FROM hifz_diary_entries WHERE tenant_id = ?', [tenantId]);
        await db.execute('DELETE FROM hifz_para_completions WHERE tenant_id = ?', [tenantId]);
        await db.execute('DELETE FROM hifz_waqaf_periods WHERE tenant_id = ?', [tenantId]);
        
        // Find students currently enrolled in hifz for tenant 4
        const [enrollments] = await db.execute('SELECT * FROM hifz_enrollment WHERE tenant_id = ? AND status = "active" ORDER BY id ASC', [tenantId]);
        
        if (enrollments.length < 8) {
            console.log("Not enough active hifz students in tenant 4. Need at least 8. Found " + enrollments.length);
            process.exit(1);
        }
        
        // We will select 8 students and assign them target paras:
        const targets = [
            { para: 26, days: 600 },
            { para: 20, days: 500 },
            { para: 15, days: 350 },
            { para: 14, days: 330 },
            { para: 9,  days: 200 },
            { para: 8,  days: 180 },
            { para: 3,  days: 60 },
            { para: 2,  days: 45 }
        ];
        
        const demoStudents = enrollments.slice(0, 8);
        
        // Deactivate the rest of the students
        const restIds = enrollments.slice(8).map(e => e.id);
        if (restIds.length > 0) {
            await db.query('UPDATE hifz_enrollment SET status = "inactive" WHERE id IN (?) AND tenant_id = ?', [restIds, tenantId]);
            console.log(`Deactivated ${restIds.length} extra students to keep focus on 8 demo students.`);
        }

        const rInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
        
        const today = new Date();
        today.setHours(0,0,0,0);

        for (let i = 0; i < 8; i++) {
            const studentId = demoStudents[i].student_id;
            const target = targets[i];
            
            console.log(`Generating data for student ${studentId} up to Para ${target.para}...`);
            
            let totalLinesMemorized = 0;
            let currentPara = 1;
            let currentParaLines = 0;
            let currentStreak = 0;
            let longestStreak = 0;
            let avgLines30d = 0;
            let last30DaysLines = [];
            
            for (let d = target.days; d >= 0; d--) {
                const entryDate = new Date(today);
                entryDate.setDate(today.getDate() - d);
                
                // Skip Sundays
                if (entryDate.getDay() === 0) continue;
                
                const dateString = entryDate.toISOString().split('T')[0];
                
                // 10% chance of being absent
                const isAbsent = Math.random() < 0.10;
                
                if (isAbsent) {
                    currentStreak = 0;
                    await db.execute(`
                        INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (?, ?, ?, 1, 'not_recited', 'not_recited', 'not_recited')
                    `, [tenantId, studentId, dateString]);
                    if (d < 30) last30DaysLines.push(0);
                    continue;
                }
                
                currentStreak++;
                if (currentStreak > longestStreak) longestStreak = currentStreak;
                
                const linesToday = rInt(10, 18);
                if (d < 30) last30DaysLines.push(linesToday);
                
                let sabaqTajweed = ['perfect', 'minor_errors', 'minor_errors', 'needs_work'][rInt(0, 3)];
                let sabaqQuality = ['excellent', 'good', 'good', 'average'][rInt(0, 3)];
                
                await db.execute(`
                    INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (?, ?, ?, 0, 'recited', ?, ?, ?, ?, 'recited', ?, 'recited', ?, ?)
                `, [
                    tenantId, studentId, dateString, 
                    currentPara, linesToday, sabaqTajweed, sabaqQuality,
                    Math.max(1, currentPara - 1), 
                    Math.max(1, currentPara - 3), Math.max(1, currentPara - 1)
                ]);
                
                currentParaLines += linesToday;
                totalLinesMemorized += linesToday;
                
                if (currentParaLines >= 288 && currentPara < 30) {
                    const testZabat = rInt(40, 50); // out of 50
                    const testTajweed = rInt(15, 20); // out of 20
                    const testLehja = rInt(7, 10); // out of 10
                    const testAttendance = rInt(8, 10); // out of 10
                    const testTarbiyah = rInt(8, 10); // out of 10
                    const totalScore = testZabat + testTajweed + testLehja + testAttendance + testTarbiyah;
                    
                    const testResult = totalScore >= 80 ? 'pass' : 'conditional_pass';
                    
                    const testNotes = `Zabat: ${testZabat}/50\nTajweed: ${testTajweed}/20\nLehja: ${testLehja}/10\nAttendance: ${testAttendance}/10\nTarbiyah: ${testTarbiyah}/10\nTotal: ${totalScore}/100`;
                    
                    await db.execute(`
                        INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
                    `, [
                        tenantId, studentId, currentPara, dateString, dateString, testResult, 
                        (Math.random() > 0.5 ? 'Qari Ahmed' : 'Qari Uthman'),
                        (Math.random() > 0.5 ? 1 : 0),
                        testNotes
                    ]);
                    
                    currentPara++;
                    currentParaLines = 0;
                    
                    if (currentPara > target.para) {
                        break;
                    }
                }
            }
            
            avgLines30d = last30DaysLines.length > 0 ? (last30DaysLines.reduce((a,b)=>a+b,0) / last30DaysLines.length).toFixed(2) : 0;
            
            let currentPhase = 'early';
            if (currentPara > 10) currentPhase = 'mid';
            if (currentPara >= 20) currentPhase = 'advanced';
            
            const remainingLines = Math.max(0, 6236 - totalLinesMemorized);
            let predictedDate = null;
            if (avgLines30d > 0) {
                const daysNeeded = Math.ceil(remainingLines / avgLines30d);
                const pd = new Date();
                pd.setDate(pd.getDate() + daysNeeded);
                predictedDate = pd.toISOString().split('T')[0];
            }
            
            await db.execute(`
                UPDATE hifz_enrollment 
                SET current_para = ?, 
                    current_para_lines_done = ?,
                    total_lines_memorized = ?,
                    current_streak_days = ?,
                    longest_streak_days = ?,
                    avg_lines_30d = ?,
                    current_phase = ?,
                    predicted_khatam_date = ?
                WHERE tenant_id = ? AND student_id = ?
            `, [
                currentPara, currentParaLines, totalLinesMemorized,
                currentStreak, longestStreak, avgLines30d, currentPhase, predictedDate,
                tenantId, studentId
            ]);
        }

        console.log("[PROD] Demo data generation complete for Tenant 4!");
        process.exit(0);

    } catch (e) {
        console.error(e);
        process.exit(1);
    }
})();
