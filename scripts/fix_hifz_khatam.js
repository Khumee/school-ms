const mysql = require('mysql2/promise');
require('dotenv').config();

(async () => {
    try {
        const db = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'admin',
            database: process.env.DB_NAME || 'sms' // using sms based on previous context
        });

        const tenantId = 4;
        console.log(`Fixing Hifz data for tenant ${tenantId} to ensure 1-2 year Khatam predictions...`);

        // Get all currently enrolled Hifz students
        const [enrollments] = await db.execute(
            `SELECT * FROM hifz_enrollment WHERE tenant_id = ? AND status = 'active'`,
            [tenantId]
        );

        if (enrollments.length === 0) {
            console.log('No active Hifz students found for tenant 4.');
            process.exit(0);
        }

        const rInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

        // For each student, we will rewrite their last 30 days of diary entries to perfectly match a 1-2 year pace
        for (const en of enrollments) {
            const studentId = en.student_id;
            const currentPara = en.current_para || 1;
            
            // Recompute their total lines memorized realistically
            const totalLinesMemorized = (currentPara > 1 ? (currentPara - 1) * 300 : 0) + rInt(0, 200);
            const remainingLines = Math.max(0, 6236 - totalLinesMemorized);

            // Target completion between 365 (1 year) and 730 (2 years) days from today
            const targetDays = rInt(365, 730);
            
            // Required pace (average lines per day over 30 days)
            const targetAvgLines30d = remainingLines / targetDays;
            
            // If they are very close to finishing, the pace might be extremely low. Clamp to reasonable minimum.
            let safeAvgLines = targetAvgLines30d;
            if (safeAvgLines < 3) safeAvgLines = 3; 
            
            // To achieve 'safeAvgLines' on average, considering they might be absent 2-4 days a month:
            // Total lines to recite in 30 days = safeAvgLines * 30
            const totalLinesToRecite = safeAvgLines * 30;
            const daysPresent = rInt(24, 28);
            const linesPerPresentDay = Math.max(1, Math.round(totalLinesToRecite / daysPresent));

            console.log(`Student ${studentId}: Para ${currentPara}, Mem: ${totalLinesMemorized}. Target days: ${targetDays}. Pace: ${safeAvgLines.toFixed(1)}. Lines/day present: ${linesPerPresentDay}`);

            // Clear their old diary entries
            await db.execute(
                `DELETE FROM hifz_diary_entries WHERE tenant_id = ? AND student_id = ?`,
                [tenantId, studentId]
            );

            const today = new Date();
            
            // Generate EXACTLY 30 days of diary entries
            for (let dIndex = 30; dIndex >= 1; dIndex--) {
                const entryDate = new Date();
                entryDate.setDate(today.getDate() - dIndex);
                if (entryDate.getDay() === 0) continue; // Skip Sundays
                
                const dateString = entryDate.toISOString().split('T')[0];
                
                // Random absence (ensuring we roughly hit daysPresent)
                const isAbsent = Math.random() > (daysPresent / 26) ? 1 : 0;
                
                let sabaqStatus = isAbsent ? 'not_recited' : 'recited';
                
                // If present, recite exactly 'linesPerPresentDay' lines.
                // We'll simulate this by setting sabaq_from_page=1, sabaq_to_page=1, 
                // sabaq_from_line=1, sabaq_to_line=linesPerPresentDay.
                // (If linesPerPresentDay > 15, we'll wrap it to page 2).
                
                let fromP = isAbsent ? null : 1;
                let toP = isAbsent ? null : (linesPerPresentDay > 15 ? 2 : 1);
                let fromL = isAbsent ? null : 1;
                let toL = isAbsent ? null : (linesPerPresentDay > 15 ? linesPerPresentDay - 15 : linesPerPresentDay);
                let sLines = isAbsent ? null : linesPerPresentDay;
                
                let tajweed = 'perfect';
                let quality = 'good';
                
                await db.execute(
                    `INSERT INTO hifz_diary_entries 
                     (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, 
                      sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_lines, sabaq_tajweed, sabaq_quality, 
                      sabqi_status, sabqi_para, sabqi_para_2, manzil_status, manzil_para_1, manzil_para_2, manzil_para_3) 
                     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?, ?, NULL, NULL)`,
                    [
                        tenantId, studentId, dateString, isAbsent, sabaqStatus, 
                        isAbsent ? null : currentPara, isAbsent ? null : currentPara,
                        fromP, toP, fromL, toL, sLines, tajweed, quality,
                        sabaqStatus, isAbsent ? null : Math.max(1, currentPara - 1), 
                        sabaqStatus, isAbsent ? null : Math.max(1, currentPara - 2)
                    ]
                );
            }

            // Finally, explicitly update the enrollment record to match exactly
            // the computed target values.
            const predictedDate = new Date();
            predictedDate.setDate(predictedDate.getDate() + Math.ceil(remainingLines / safeAvgLines));
            const predictedDateStr = predictedDate.toISOString().split('T')[0];

            await db.execute(
                `UPDATE hifz_enrollment 
                 SET total_lines_memorized = ?, avg_lines_30d = ?, predicted_khatam_date = ?, updated_at = NOW() 
                 WHERE id = ?`,
                [totalLinesMemorized, safeAvgLines, predictedDateStr, en.id]
            );
        }

        console.log('Successfully rewrote Hifz diary entries and Khatam predictions!');
        process.exit(0);
    } catch (e) {
        console.error('Error:', e);
        process.exit(1);
    }
})();
