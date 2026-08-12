const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();

(async () => {
    try {
        const db = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || 'admin',
            database: process.env.DB_NAME || 'sms'
        });

        const tenantId = 4;
        let sql = `-- Hifz Khatam Override Script (Tenant 4)\n`;
        sql += `SET NAMES utf8mb4;\n`;
        sql += `SET FOREIGN_KEY_CHECKS = 0;\n\n`;
        
        sql += `DELETE FROM hifz_diary_entries WHERE tenant_id = 4;\n\n`;

        const [enrollments] = await db.execute(
            `SELECT * FROM hifz_enrollment WHERE tenant_id = ? AND status = 'active'`,
            [tenantId]
        );

        const rInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

        for (const en of enrollments) {
            const studentId = en.student_id;
            const currentPara = en.current_para || 1;
            
            const totalLinesMemorized = (currentPara > 1 ? (currentPara - 1) * 300 : 0) + rInt(0, 200);
            const remainingLines = Math.max(0, 6236 - totalLinesMemorized);
            const targetDays = rInt(365, 730);
            
            const targetAvgLines30d = remainingLines / targetDays;
            let safeAvgLines = targetAvgLines30d;
            if (safeAvgLines < 3) safeAvgLines = 3; 
            
            const totalLinesToRecite = safeAvgLines * 30;
            const daysPresent = rInt(24, 28);
            const linesPerPresentDay = Math.max(1, Math.round(totalLinesToRecite / daysPresent));

            const today = new Date();
            
            for (let dIndex = 30; dIndex >= 1; dIndex--) {
                const entryDate = new Date();
                entryDate.setDate(today.getDate() - dIndex);
                if (entryDate.getDay() === 0) continue; 
                
                const dateString = entryDate.toISOString().split('T')[0];
                const isAbsent = Math.random() > (daysPresent / 26) ? 1 : 0;
                let sabaqStatus = isAbsent ? 'not_recited' : 'recited';
                
                let fromP = isAbsent ? 'NULL' : 1;
                let toP = isAbsent ? 'NULL' : (linesPerPresentDay > 15 ? 2 : 1);
                let fromL = isAbsent ? 'NULL' : 1;
                let toL = isAbsent ? 'NULL' : (linesPerPresentDay > 15 ? linesPerPresentDay - 15 : linesPerPresentDay);
                let sLines = isAbsent ? 'NULL' : linesPerPresentDay;
                
                let tajweed = 'perfect';
                let quality = 'good';
                
                let sabqi_para = isAbsent ? 'NULL' : Math.max(1, currentPara - 1);
                let manzil_para_1 = isAbsent ? 'NULL' : Math.max(1, currentPara - 2);

                sql += `INSERT INTO hifz_diary_entries 
(tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, sabqi_para_2, manzil_status, manzil_para_1, manzil_para_2, manzil_para_3) 
VALUES (${tenantId}, ${studentId}, '${dateString}', ${isAbsent}, '${sabaqStatus}', ${isAbsent ? 'NULL' : currentPara}, ${isAbsent ? 'NULL' : currentPara}, ${fromP}, ${toP}, ${fromL}, ${toL}, ${sLines}, '${tajweed}', '${quality}', '${sabaqStatus}', ${sabqi_para}, NULL, '${sabaqStatus}', ${manzil_para_1}, NULL, NULL);\n`;
            }

            const predictedDate = new Date();
            predictedDate.setDate(predictedDate.getDate() + Math.ceil(remainingLines / safeAvgLines));
            const predictedDateStr = predictedDate.toISOString().split('T')[0];

            sql += `UPDATE hifz_enrollment SET total_lines_memorized = ${totalLinesMemorized}, avg_lines_30d = ${safeAvgLines}, predicted_khatam_date = '${predictedDateStr}', current_streak_days = 15, updated_at = NOW() WHERE id = ${en.id};\n\n`;
        }
        
        sql += `SET FOREIGN_KEY_CHECKS = 1;\n`;
        fs.writeFileSync('fix_hifz_khatam_override.sql', sql);
        console.log('SQL generated: fix_hifz_khatam_override.sql');
        process.exit(0);
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
})();
