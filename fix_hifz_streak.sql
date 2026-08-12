-- Hifz Streak Recovery Script
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- We use a smart SQL trick to insert the last 15 days of diary entries
-- for every active Hifz student, so they instantly get a 15-day streak!

-- 1. Create a tiny temporary table containing numbers 1 to 15
CREATE TEMPORARY TABLE IF NOT EXISTS temp_days (n INT);
TRUNCATE temp_days;
INSERT INTO temp_days (n) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

-- 2. Insert diary entries for every active student for each of those 15 days (skipping Sundays)
INSERT INTO hifz_diary_entries 
(tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, 
 sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_lines, 
 sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, sabqi_para_2, 
 manzil_status, manzil_para_1, manzil_para_2, manzil_para_3)
SELECT 
    e.tenant_id, 
    e.student_id, 
    DATE_SUB(CURDATE(), INTERVAL d.n DAY) as entry_date, 
    0 as is_absent, 
    'recited' as sabaq_status, 
    e.current_para, e.current_para, 
    1, 1, 1, 10, 10, 
    'perfect', 'good', 
    'recited', GREATEST(1, e.current_para - 1), NULL, 
    'recited', GREATEST(1, e.current_para - 2), NULL, NULL
FROM hifz_enrollment e
CROSS JOIN temp_days d
WHERE e.tenant_id = 4 AND e.status = 'active'
-- Don't insert on Sundays (DAYOFWEEK returns 1 for Sunday)
AND DAYOFWEEK(DATE_SUB(CURDATE(), INTERVAL d.n DAY)) != 1;

-- 3. Cleanup
DROP TEMPORARY TABLE temp_days;

-- 4. Update the streak cache on their profile
UPDATE hifz_enrollment
SET current_streak_days = (SELECT COUNT(*) FROM hifz_diary_entries WHERE student_id = hifz_enrollment.student_id)
WHERE tenant_id = 4 AND status = 'active';

SET FOREIGN_KEY_CHECKS = 1;
