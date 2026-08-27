-- =====================================================================
-- EXHAUSTIVE, COLLISION-FREE MULTI-CLASS & MULTI-TEACHER TIMETABLE & EXAMS
-- =====================================================================

SET @tenant = 4;

-- 1. Clean up old test data for tenant 4
DELETE FROM exam_question_marks WHERE tenant_id = @tenant;
DELETE FROM exam_marks WHERE tenant_id = @tenant;
DELETE FROM exam_questions WHERE tenant_id = @tenant;
DELETE FROM exam_papers WHERE tenant_id = @tenant;
DELETE FROM exams WHERE tenant_id = @tenant AND name = "First Term Examination 2026";
DELETE FROM periods WHERE tenant_id = @tenant;
DELETE FROM subjects WHERE tenant_id = @tenant;

-- 2. Insert Subjects for all classes
INSERT INTO subjects (class_id, name, tenant_id) VALUES
(190, "English", @tenant),
(190, "Urdu", @tenant),
(190, "Mathematics", @tenant),
(190, "General Science", @tenant),
(190, "Islamiyat", @tenant),
(190, "Pakistan Studies", @tenant),
(190, "Computer Science", @tenant),
(190, "Arabic", @tenant),
(192, "English", @tenant),
(192, "Urdu", @tenant),
(192, "Mathematics", @tenant),
(192, "General Science", @tenant),
(192, "Islamiyat", @tenant),
(192, "Pakistan Studies", @tenant),
(192, "Computer Science", @tenant),
(192, "Arabic", @tenant),
(194, "English", @tenant),
(194, "Urdu", @tenant),
(194, "Mathematics", @tenant),
(194, "General Science", @tenant),
(194, "Islamiyat", @tenant),
(194, "Pakistan Studies", @tenant),
(194, "Computer Science", @tenant),
(194, "Arabic", @tenant),
(196, "English", @tenant),
(196, "Urdu", @tenant),
(196, "Mathematics", @tenant),
(196, "General Science", @tenant),
(196, "Islamiyat", @tenant),
(196, "Pakistan Studies", @tenant),
(196, "Computer Science", @tenant),
(196, "Arabic", @tenant),
(198, "English", @tenant),
(198, "Urdu", @tenant),
(198, "Mathematics", @tenant),
(198, "General Science", @tenant),
(198, "Islamiyat", @tenant),
(198, "Pakistan Studies", @tenant),
(198, "Computer Science", @tenant),
(198, "Arabic", @tenant),
(200, "English", @tenant),
(200, "Urdu", @tenant),
(200, "Mathematics", @tenant),
(200, "General Science", @tenant),
(200, "Islamiyat", @tenant),
(200, "Pakistan Studies", @tenant),
(200, "Computer Science", @tenant),
(200, "Arabic", @tenant),
(202, "English", @tenant),
(202, "Urdu", @tenant),
(202, "Mathematics", @tenant),
(202, "General Science", @tenant),
(202, "Islamiyat", @tenant),
(202, "Pakistan Studies", @tenant),
(202, "Computer Science", @tenant),
(202, "Arabic", @tenant),
(204, "English", @tenant),
(204, "Urdu", @tenant),
(204, "Mathematics", @tenant),
(204, "General Science", @tenant),
(204, "Islamiyat", @tenant),
(204, "Pakistan Studies", @tenant),
(204, "Computer Science", @tenant),
(204, "Arabic", @tenant),
(206, "English", @tenant),
(206, "Urdu", @tenant),
(206, "Mathematics", @tenant),
(206, "General Science", @tenant),
(206, "Islamiyat", @tenant),
(206, "Pakistan Studies", @tenant),
(206, "Computer Science", @tenant),
(206, "Arabic", @tenant),
(208, "English", @tenant),
(208, "Urdu", @tenant),
(208, "Mathematics", @tenant),
(208, "General Science", @tenant),
(208, "Islamiyat", @tenant),
(208, "Pakistan Studies", @tenant),
(208, "Computer Science", @tenant),
(208, "Arabic", @tenant),
(210, "English", @tenant),
(210, "Urdu", @tenant),
(210, "Mathematics", @tenant),
(210, "General Science", @tenant),
(210, "Islamiyat", @tenant),
(210, "Pakistan Studies", @tenant),
(210, "Computer Science", @tenant),
(210, "Arabic", @tenant);

-- 3. Create Exam Term
INSERT INTO exams (name, start_date, end_date, tenant_id) VALUES ("First Term Examination 2026", "2026-10-01", "2026-10-15", @tenant);
SET @exam = LAST_INSERT_ID();

-- 4. Insert Periods (Distributed realistic timetable without teacher collisions)
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT 190, "Monday", "08:00", "08:40", s.id, 258, 1, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "08:00", "08:40", s.id, 276, 1, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "08:00", "08:40", s.id, 282, 1, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "08:00", "08:40", s.id, 266, 1, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "08:00", "08:40", s.id, 278, 1, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "08:00", "08:40", s.id, 260, 1, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "08:00", "08:40", s.id, 268, 1, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "08:00", "08:40", s.id, 292, 1, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "08:00", "08:40", s.id, 274, 1, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "08:00", "08:40", s.id, 272, 1, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "08:00", "08:40", s.id, 256, 1, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "08:40", "09:20", s.id, 266, 2, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "08:40", "09:20", s.id, 278, 2, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "08:40", "09:20", s.id, 260, 2, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "08:40", "09:20", s.id, 268, 2, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "08:40", "09:20", s.id, 292, 2, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "08:40", "09:20", s.id, 274, 2, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "08:40", "09:20", s.id, 272, 2, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "08:40", "09:20", s.id, 256, 2, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "08:40", "09:20", s.id, 280, 2, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "08:40", "09:20", s.id, 270, 2, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "08:40", "09:20", s.id, 290, 2, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "09:20", "10:00", s.id, 268, 3, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "09:20", "10:00", s.id, 292, 3, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "09:20", "10:00", s.id, 274, 3, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "09:20", "10:00", s.id, 272, 3, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "09:20", "10:00", s.id, 256, 3, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "09:20", "10:00", s.id, 280, 3, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "09:20", "10:00", s.id, 270, 3, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "09:20", "10:00", s.id, 290, 3, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "09:20", "10:00", s.id, 264, 3, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "09:20", "10:00", s.id, 258, 3, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "09:20", "10:00", s.id, 276, 3, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "10:00", "10:40", s.id, 272, 4, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "10:00", "10:40", s.id, 256, 4, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "10:00", "10:40", s.id, 280, 4, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "10:00", "10:40", s.id, 270, 4, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "10:00", "10:40", s.id, 290, 4, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "10:00", "10:40", s.id, 264, 4, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "10:00", "10:40", s.id, 258, 4, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "10:00", "10:40", s.id, 276, 4, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "10:00", "10:40", s.id, 282, 4, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "10:00", "10:40", s.id, 266, 4, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "10:00", "10:40", s.id, 278, 4, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "11:10", "11:50", s.id, 270, 5, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "11:10", "11:50", s.id, 290, 5, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "11:10", "11:50", s.id, 264, 5, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "11:10", "11:50", s.id, 258, 5, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "11:10", "11:50", s.id, 276, 5, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "11:10", "11:50", s.id, 282, 5, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "11:10", "11:50", s.id, 266, 5, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "11:10", "11:50", s.id, 278, 5, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "11:10", "11:50", s.id, 260, 5, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "11:10", "11:50", s.id, 268, 5, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "11:10", "11:50", s.id, 292, 5, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "11:50", "12:30", s.id, 258, 6, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "11:50", "12:30", s.id, 276, 6, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "11:50", "12:30", s.id, 282, 6, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "11:50", "12:30", s.id, 266, 6, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "11:50", "12:30", s.id, 278, 6, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "11:50", "12:30", s.id, 260, 6, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "11:50", "12:30", s.id, 268, 6, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "11:50", "12:30", s.id, 292, 6, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "11:50", "12:30", s.id, 274, 6, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "11:50", "12:30", s.id, 272, 6, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "11:50", "12:30", s.id, 256, 6, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "12:30", "13:10", s.id, 266, 7, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "12:30", "13:10", s.id, 278, 7, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "12:30", "13:10", s.id, 260, 7, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "12:30", "13:10", s.id, 268, 7, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "12:30", "13:10", s.id, 292, 7, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "12:30", "13:10", s.id, 274, 7, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "12:30", "13:10", s.id, 272, 7, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "12:30", "13:10", s.id, 256, 7, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "12:30", "13:10", s.id, 280, 7, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "12:30", "13:10", s.id, 270, 7, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "12:30", "13:10", s.id, 290, 7, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Monday", "13:10", "13:50", s.id, 268, 8, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Monday", "13:10", "13:50", s.id, 292, 8, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Monday", "13:10", "13:50", s.id, 274, 8, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Monday", "13:10", "13:50", s.id, 272, 8, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Monday", "13:10", "13:50", s.id, 256, 8, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Monday", "13:10", "13:50", s.id, 280, 8, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Monday", "13:10", "13:50", s.id, 270, 8, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Monday", "13:10", "13:50", s.id, 290, 8, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Monday", "13:10", "13:50", s.id, 264, 8, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Monday", "13:10", "13:50", s.id, 258, 8, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Monday", "13:10", "13:50", s.id, 276, 8, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "08:00", "08:40", s.id, 282, 1, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "08:00", "08:40", s.id, 266, 1, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "08:00", "08:40", s.id, 278, 1, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "08:00", "08:40", s.id, 260, 1, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "08:00", "08:40", s.id, 268, 1, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "08:00", "08:40", s.id, 292, 1, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "08:00", "08:40", s.id, 274, 1, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "08:00", "08:40", s.id, 272, 1, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "08:00", "08:40", s.id, 256, 1, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "08:00", "08:40", s.id, 280, 1, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "08:00", "08:40", s.id, 270, 1, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "08:40", "09:20", s.id, 260, 2, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "08:40", "09:20", s.id, 268, 2, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "08:40", "09:20", s.id, 292, 2, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "08:40", "09:20", s.id, 274, 2, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "08:40", "09:20", s.id, 272, 2, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "08:40", "09:20", s.id, 256, 2, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "08:40", "09:20", s.id, 280, 2, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "08:40", "09:20", s.id, 270, 2, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "08:40", "09:20", s.id, 290, 2, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "08:40", "09:20", s.id, 264, 2, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "08:40", "09:20", s.id, 258, 2, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "09:20", "10:00", s.id, 274, 3, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "09:20", "10:00", s.id, 272, 3, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "09:20", "10:00", s.id, 256, 3, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "09:20", "10:00", s.id, 280, 3, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "09:20", "10:00", s.id, 270, 3, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "09:20", "10:00", s.id, 290, 3, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "09:20", "10:00", s.id, 264, 3, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "09:20", "10:00", s.id, 258, 3, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "09:20", "10:00", s.id, 276, 3, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "09:20", "10:00", s.id, 282, 3, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "09:20", "10:00", s.id, 266, 3, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "10:00", "10:40", s.id, 280, 4, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "10:00", "10:40", s.id, 270, 4, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "10:00", "10:40", s.id, 290, 4, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "10:00", "10:40", s.id, 264, 4, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "10:00", "10:40", s.id, 258, 4, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "10:00", "10:40", s.id, 276, 4, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "10:00", "10:40", s.id, 282, 4, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "10:00", "10:40", s.id, 266, 4, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "10:00", "10:40", s.id, 278, 4, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "10:00", "10:40", s.id, 260, 4, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "10:00", "10:40", s.id, 268, 4, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "11:10", "11:50", s.id, 264, 5, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "11:10", "11:50", s.id, 258, 5, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "11:10", "11:50", s.id, 276, 5, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "11:10", "11:50", s.id, 282, 5, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "11:10", "11:50", s.id, 266, 5, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "11:10", "11:50", s.id, 278, 5, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "11:10", "11:50", s.id, 260, 5, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "11:10", "11:50", s.id, 268, 5, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "11:10", "11:50", s.id, 292, 5, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "11:10", "11:50", s.id, 274, 5, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "11:10", "11:50", s.id, 272, 5, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "11:50", "12:30", s.id, 282, 6, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "11:50", "12:30", s.id, 266, 6, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "11:50", "12:30", s.id, 278, 6, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "11:50", "12:30", s.id, 260, 6, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "11:50", "12:30", s.id, 268, 6, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "11:50", "12:30", s.id, 292, 6, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "11:50", "12:30", s.id, 274, 6, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "11:50", "12:30", s.id, 272, 6, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "11:50", "12:30", s.id, 256, 6, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "11:50", "12:30", s.id, 280, 6, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "11:50", "12:30", s.id, 270, 6, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "12:30", "13:10", s.id, 260, 7, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "12:30", "13:10", s.id, 268, 7, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "12:30", "13:10", s.id, 292, 7, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "12:30", "13:10", s.id, 274, 7, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "12:30", "13:10", s.id, 272, 7, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "12:30", "13:10", s.id, 256, 7, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "12:30", "13:10", s.id, 280, 7, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "12:30", "13:10", s.id, 270, 7, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "12:30", "13:10", s.id, 290, 7, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "12:30", "13:10", s.id, 264, 7, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "12:30", "13:10", s.id, 258, 7, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Tuesday", "13:10", "13:50", s.id, 274, 8, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Tuesday", "13:10", "13:50", s.id, 272, 8, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Tuesday", "13:10", "13:50", s.id, 256, 8, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Tuesday", "13:10", "13:50", s.id, 280, 8, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Tuesday", "13:10", "13:50", s.id, 270, 8, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Tuesday", "13:10", "13:50", s.id, 290, 8, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Tuesday", "13:10", "13:50", s.id, 264, 8, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Tuesday", "13:10", "13:50", s.id, 258, 8, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Tuesday", "13:10", "13:50", s.id, 276, 8, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Tuesday", "13:10", "13:50", s.id, 282, 8, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Tuesday", "13:10", "13:50", s.id, 266, 8, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "08:00", "08:40", s.id, 278, 1, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "08:00", "08:40", s.id, 260, 1, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "08:00", "08:40", s.id, 268, 1, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "08:00", "08:40", s.id, 292, 1, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "08:00", "08:40", s.id, 274, 1, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "08:00", "08:40", s.id, 272, 1, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "08:00", "08:40", s.id, 256, 1, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "08:00", "08:40", s.id, 280, 1, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "08:00", "08:40", s.id, 270, 1, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "08:00", "08:40", s.id, 290, 1, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "08:00", "08:40", s.id, 264, 1, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "08:40", "09:20", s.id, 292, 2, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "08:40", "09:20", s.id, 274, 2, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "08:40", "09:20", s.id, 272, 2, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "08:40", "09:20", s.id, 256, 2, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "08:40", "09:20", s.id, 280, 2, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "08:40", "09:20", s.id, 270, 2, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "08:40", "09:20", s.id, 290, 2, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "08:40", "09:20", s.id, 264, 2, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "08:40", "09:20", s.id, 258, 2, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "08:40", "09:20", s.id, 276, 2, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "08:40", "09:20", s.id, 282, 2, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "09:20", "10:00", s.id, 256, 3, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "09:20", "10:00", s.id, 280, 3, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "09:20", "10:00", s.id, 270, 3, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "09:20", "10:00", s.id, 290, 3, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "09:20", "10:00", s.id, 264, 3, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "09:20", "10:00", s.id, 258, 3, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "09:20", "10:00", s.id, 276, 3, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "09:20", "10:00", s.id, 282, 3, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "09:20", "10:00", s.id, 266, 3, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "09:20", "10:00", s.id, 278, 3, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "09:20", "10:00", s.id, 260, 3, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "10:00", "10:40", s.id, 290, 4, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "10:00", "10:40", s.id, 264, 4, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "10:00", "10:40", s.id, 258, 4, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "10:00", "10:40", s.id, 276, 4, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "10:00", "10:40", s.id, 282, 4, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "10:00", "10:40", s.id, 266, 4, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "10:00", "10:40", s.id, 278, 4, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "10:00", "10:40", s.id, 260, 4, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "10:00", "10:40", s.id, 268, 4, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "10:00", "10:40", s.id, 292, 4, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "10:00", "10:40", s.id, 274, 4, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "11:10", "11:50", s.id, 276, 5, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "11:10", "11:50", s.id, 282, 5, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "11:10", "11:50", s.id, 266, 5, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "11:10", "11:50", s.id, 278, 5, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "11:10", "11:50", s.id, 260, 5, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "11:10", "11:50", s.id, 268, 5, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "11:10", "11:50", s.id, 292, 5, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "11:10", "11:50", s.id, 274, 5, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "11:10", "11:50", s.id, 272, 5, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "11:10", "11:50", s.id, 256, 5, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "11:10", "11:50", s.id, 280, 5, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "11:50", "12:30", s.id, 278, 6, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "11:50", "12:30", s.id, 260, 6, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "11:50", "12:30", s.id, 268, 6, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "11:50", "12:30", s.id, 292, 6, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "11:50", "12:30", s.id, 274, 6, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "11:50", "12:30", s.id, 272, 6, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "11:50", "12:30", s.id, 256, 6, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "11:50", "12:30", s.id, 280, 6, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "11:50", "12:30", s.id, 270, 6, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "11:50", "12:30", s.id, 290, 6, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "11:50", "12:30", s.id, 264, 6, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "12:30", "13:10", s.id, 292, 7, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "12:30", "13:10", s.id, 274, 7, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "12:30", "13:10", s.id, 272, 7, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "12:30", "13:10", s.id, 256, 7, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "12:30", "13:10", s.id, 280, 7, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "12:30", "13:10", s.id, 270, 7, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "12:30", "13:10", s.id, 290, 7, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "12:30", "13:10", s.id, 264, 7, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "12:30", "13:10", s.id, 258, 7, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "12:30", "13:10", s.id, 276, 7, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "12:30", "13:10", s.id, 282, 7, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Wednesday", "13:10", "13:50", s.id, 256, 8, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Wednesday", "13:10", "13:50", s.id, 280, 8, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Wednesday", "13:10", "13:50", s.id, 270, 8, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Wednesday", "13:10", "13:50", s.id, 290, 8, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Wednesday", "13:10", "13:50", s.id, 264, 8, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Wednesday", "13:10", "13:50", s.id, 258, 8, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Wednesday", "13:10", "13:50", s.id, 276, 8, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Wednesday", "13:10", "13:50", s.id, 282, 8, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Wednesday", "13:10", "13:50", s.id, 266, 8, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Wednesday", "13:10", "13:50", s.id, 278, 8, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Wednesday", "13:10", "13:50", s.id, 260, 8, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "08:00", "08:40", s.id, 268, 1, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "08:00", "08:40", s.id, 292, 1, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "08:00", "08:40", s.id, 274, 1, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "08:00", "08:40", s.id, 272, 1, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "08:00", "08:40", s.id, 256, 1, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "08:00", "08:40", s.id, 280, 1, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "08:00", "08:40", s.id, 270, 1, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "08:00", "08:40", s.id, 290, 1, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "08:00", "08:40", s.id, 264, 1, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "08:00", "08:40", s.id, 258, 1, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "08:00", "08:40", s.id, 276, 1, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "08:40", "09:20", s.id, 272, 2, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "08:40", "09:20", s.id, 256, 2, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "08:40", "09:20", s.id, 280, 2, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "08:40", "09:20", s.id, 270, 2, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "08:40", "09:20", s.id, 290, 2, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "08:40", "09:20", s.id, 264, 2, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "08:40", "09:20", s.id, 258, 2, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "08:40", "09:20", s.id, 276, 2, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "08:40", "09:20", s.id, 282, 2, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "08:40", "09:20", s.id, 266, 2, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "08:40", "09:20", s.id, 278, 2, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "09:20", "10:00", s.id, 270, 3, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "09:20", "10:00", s.id, 290, 3, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "09:20", "10:00", s.id, 264, 3, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "09:20", "10:00", s.id, 258, 3, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "09:20", "10:00", s.id, 276, 3, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "09:20", "10:00", s.id, 282, 3, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "09:20", "10:00", s.id, 266, 3, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "09:20", "10:00", s.id, 278, 3, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "09:20", "10:00", s.id, 260, 3, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "09:20", "10:00", s.id, 268, 3, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "09:20", "10:00", s.id, 292, 3, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "10:00", "10:40", s.id, 258, 4, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "10:00", "10:40", s.id, 276, 4, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "10:00", "10:40", s.id, 282, 4, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "10:00", "10:40", s.id, 266, 4, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "10:00", "10:40", s.id, 278, 4, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "10:00", "10:40", s.id, 260, 4, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "10:00", "10:40", s.id, 268, 4, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "10:00", "10:40", s.id, 292, 4, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "10:00", "10:40", s.id, 274, 4, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "10:00", "10:40", s.id, 272, 4, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "10:00", "10:40", s.id, 256, 4, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "11:10", "11:50", s.id, 266, 5, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "11:10", "11:50", s.id, 278, 5, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "11:10", "11:50", s.id, 260, 5, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "11:10", "11:50", s.id, 268, 5, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "11:10", "11:50", s.id, 292, 5, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "11:10", "11:50", s.id, 274, 5, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "11:10", "11:50", s.id, 272, 5, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "11:10", "11:50", s.id, 256, 5, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "11:10", "11:50", s.id, 280, 5, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "11:10", "11:50", s.id, 270, 5, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "11:10", "11:50", s.id, 290, 5, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "11:50", "12:30", s.id, 268, 6, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "11:50", "12:30", s.id, 292, 6, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "11:50", "12:30", s.id, 274, 6, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "11:50", "12:30", s.id, 272, 6, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "11:50", "12:30", s.id, 256, 6, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "11:50", "12:30", s.id, 280, 6, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "11:50", "12:30", s.id, 270, 6, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "11:50", "12:30", s.id, 290, 6, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "11:50", "12:30", s.id, 264, 6, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "11:50", "12:30", s.id, 258, 6, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "11:50", "12:30", s.id, 276, 6, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "12:30", "13:10", s.id, 272, 7, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "12:30", "13:10", s.id, 256, 7, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "12:30", "13:10", s.id, 280, 7, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "12:30", "13:10", s.id, 270, 7, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "12:30", "13:10", s.id, 290, 7, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "12:30", "13:10", s.id, 264, 7, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "12:30", "13:10", s.id, 258, 7, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "12:30", "13:10", s.id, 276, 7, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "12:30", "13:10", s.id, 282, 7, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "12:30", "13:10", s.id, 266, 7, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "12:30", "13:10", s.id, 278, 7, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Thursday", "13:10", "13:50", s.id, 270, 8, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Thursday", "13:10", "13:50", s.id, 290, 8, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Thursday", "13:10", "13:50", s.id, 264, 8, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Thursday", "13:10", "13:50", s.id, 258, 8, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Thursday", "13:10", "13:50", s.id, 276, 8, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Thursday", "13:10", "13:50", s.id, 282, 8, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Thursday", "13:10", "13:50", s.id, 266, 8, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Thursday", "13:10", "13:50", s.id, 278, 8, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Thursday", "13:10", "13:50", s.id, 260, 8, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Thursday", "13:10", "13:50", s.id, 268, 8, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Thursday", "13:10", "13:50", s.id, 292, 8, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Friday", "08:00", "08:40", s.id, 274, 1, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Friday", "08:00", "08:40", s.id, 272, 1, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Friday", "08:00", "08:40", s.id, 256, 1, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Friday", "08:00", "08:40", s.id, 280, 1, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Friday", "08:00", "08:40", s.id, 270, 1, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Friday", "08:00", "08:40", s.id, 290, 1, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Friday", "08:00", "08:40", s.id, 264, 1, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Friday", "08:00", "08:40", s.id, 258, 1, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Friday", "08:00", "08:40", s.id, 276, 1, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Friday", "08:00", "08:40", s.id, 282, 1, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Friday", "08:00", "08:40", s.id, 266, 1, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Friday", "08:40", "09:20", s.id, 280, 2, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Friday", "08:40", "09:20", s.id, 270, 2, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Friday", "08:40", "09:20", s.id, 290, 2, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Friday", "08:40", "09:20", s.id, 264, 2, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Friday", "08:40", "09:20", s.id, 258, 2, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Friday", "08:40", "09:20", s.id, 276, 2, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Friday", "08:40", "09:20", s.id, 282, 2, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Friday", "08:40", "09:20", s.id, 266, 2, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Friday", "08:40", "09:20", s.id, 278, 2, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Friday", "08:40", "09:20", s.id, 260, 2, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Friday", "08:40", "09:20", s.id, 268, 2, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Friday", "09:20", "10:00", s.id, 264, 3, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Friday", "09:20", "10:00", s.id, 258, 3, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Friday", "09:20", "10:00", s.id, 276, 3, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Friday", "09:20", "10:00", s.id, 282, 3, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Friday", "09:20", "10:00", s.id, 266, 3, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Friday", "09:20", "10:00", s.id, 278, 3, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Friday", "09:20", "10:00", s.id, 260, 3, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Friday", "09:20", "10:00", s.id, 268, 3, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Friday", "09:20", "10:00", s.id, 292, 3, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Friday", "09:20", "10:00", s.id, 274, 3, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Friday", "09:20", "10:00", s.id, 272, 3, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Friday", "10:00", "10:40", s.id, 282, 4, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Friday", "10:00", "10:40", s.id, 266, 4, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Friday", "10:00", "10:40", s.id, 278, 4, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Friday", "10:00", "10:40", s.id, 260, 4, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Friday", "10:00", "10:40", s.id, 268, 4, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Friday", "10:00", "10:40", s.id, 292, 4, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Friday", "10:00", "10:40", s.id, 274, 4, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Friday", "10:00", "10:40", s.id, 272, 4, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Friday", "10:00", "10:40", s.id, 256, 4, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Friday", "10:00", "10:40", s.id, 280, 4, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Friday", "10:00", "10:40", s.id, 270, 4, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 190, "Friday", "11:10", "11:50", s.id, 260, 5, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 192, "Friday", "11:10", "11:50", s.id, 268, 5, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 194, "Friday", "11:10", "11:50", s.id, 292, 5, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 196, "Friday", "11:10", "11:50", s.id, 274, 5, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 198, "Friday", "11:10", "11:50", s.id, 272, 5, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 200, "Friday", "11:10", "11:50", s.id, 256, 5, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 202, "Friday", "11:10", "11:50", s.id, 280, 5, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT 204, "Friday", "11:10", "11:50", s.id, 270, 5, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT 206, "Friday", "11:10", "11:50", s.id, 290, 5, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT 208, "Friday", "11:10", "11:50", s.id, 264, 5, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT 210, "Friday", "11:10", "11:50", s.id, 258, 5, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant;

-- 5. Create Exam Papers mapped to assigned subject teachers
INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
SELECT @exam, 190, s.id, 258, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 276, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 282, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 266, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 278, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 190, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 190 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 276, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 282, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 266, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 278, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 192, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 192 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 282, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 266, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 278, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 194, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 194 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 266, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 278, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 196, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 196 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 278, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 198, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 198 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 260, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 200, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 200 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 268, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 202, s.id, 290, 100, @tenant FROM subjects s WHERE s.class_id = 202 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 292, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 290, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 204, s.id, 264, 100, @tenant FROM subjects s WHERE s.class_id = 204 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 274, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 290, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 264, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 206, s.id, 258, 100, @tenant FROM subjects s WHERE s.class_id = 206 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 272, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 290, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 264, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 258, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 208, s.id, 276, 100, @tenant FROM subjects s WHERE s.class_id = 208 AND s.name = "Arabic" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 256, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "English" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 280, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Urdu" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 270, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Mathematics" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 290, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "General Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 264, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Islamiyat" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 258, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Pakistan Studies" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 276, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Computer Science" AND s.tenant_id = @tenant
UNION ALL
SELECT @exam, 210, s.id, 282, 100, @tenant FROM subjects s WHERE s.class_id = 210 AND s.name = "Arabic" AND s.tenant_id = @tenant;

-- 6. Add Questions for ALL subjects across all papers
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, "Q1: Reading Comprehension / Theory", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("English", "Urdu", "Arabic", "Islamiyat") AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q2: Grammar & Vocabulary", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("English", "Urdu", "Arabic", "Islamiyat") AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q3: Writing / Subjective", 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("English", "Urdu", "Arabic", "Islamiyat") AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q1: Arithmetic & Algebra", 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = "Mathematics" AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q2: Geometry & Concepts", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = "Mathematics" AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q3: Problem Solving", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = "Mathematics" AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q1: Objective & MCQs", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("General Science", "Pakistan Studies", "Computer Science") AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q2: Short Questions", 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("General Science", "Pakistan Studies", "Computer Science") AND ep.tenant_id = @tenant
UNION ALL
SELECT ep.id, "Q3: Long Answers / Practical", 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name IN ("General Science", "Pakistan Studies", "Computer Science") AND ep.tenant_id = @tenant;

-- 7. Add Question-level marks for all active students
INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id)
SELECT eq.exam_paper_id, eq.id, st.id, FLOOR(15 + (RAND() * (eq.marks - 15))), @tenant
FROM exam_questions eq
JOIN exam_papers ep ON eq.exam_paper_id = ep.id
JOIN students st ON ep.class_id = st.class_id
WHERE eq.tenant_id = @tenant AND st.status = "active";

-- 8. Calculate Total Marks
INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT eqm.exam_paper_id, eqm.student_id, SUM(eqm.obtained_marks), @tenant
FROM exam_question_marks eqm
WHERE eqm.tenant_id = @tenant
GROUP BY eqm.exam_paper_id, eqm.student_id;
