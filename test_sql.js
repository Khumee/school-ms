require('dotenv').config();
const db = require('./db');
const weekAgoStr = new Date().toISOString().split('T')[0];
db.execute(`
    SELECT e.*, s.name as student_name, s.reg_no, c.name as class_name,
            COUNT(d.id) as days_logged,
            SUM(CASE WHEN d.is_absent = 1 THEN 1 ELSE 0 END) as days_absent,
            AVG(CASE WHEN d.sabaq_status = 'recited' THEN d.sabaq_to_line - d.sabaq_from_line + 1 ELSE NULL END) as avg_lines
    FROM hifz_enrollment e
    JOIN students s ON e.student_id = s.id
    JOIN classes c ON e.class_id = c.id
    LEFT JOIN hifz_diary_entries d ON d.student_id = e.student_id AND d.tenant_id = e.tenant_id AND d.entry_date >= ?
    WHERE e.tenant_id = 1 AND e.status = 'active'
    GROUP BY e.id, s.name, s.reg_no, c.name
    ORDER BY c.name, s.name
`, [weekAgoStr])
.then(r => console.log('SUCCESS'))
.catch(e => console.error(e.message))
.finally(() => process.exit());
