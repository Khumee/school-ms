-- =====================================================================
-- COMPREHENSIVE SAMPLE DATA FOR ALL CLASSES OF TENANT 4
-- =====================================================================

SET @tenant = 4;

-- 1. Grab a fallback teacher
SET @teacher = (SELECT id FROM employees WHERE tenant_id = @tenant LIMIT 1);

-- 2. Clean up previous exam & timetable data for tenant 4 to avoid duplicates
DELETE FROM exam_question_marks WHERE tenant_id = @tenant;
DELETE FROM exam_marks WHERE tenant_id = @tenant;
DELETE FROM exam_questions WHERE tenant_id = @tenant;
DELETE FROM exam_papers WHERE tenant_id = @tenant;
DELETE FROM exams WHERE tenant_id = @tenant AND name = 'First Term Examination 2026';
DELETE FROM periods WHERE tenant_id = @tenant;
DELETE FROM subjects WHERE tenant_id = @tenant;

-- 3. Populate Standard 8 Subjects for EVERY Class of Tenant 4
INSERT INTO subjects (class_id, name, tenant_id)
SELECT c.id, 'English', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Urdu', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Mathematics', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'General Science', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Islamiyat', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Pakistan Studies', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Computer Science', @tenant FROM classes c WHERE c.tenant_id = @tenant
UNION ALL
SELECT c.id, 'Arabic', @tenant FROM classes c WHERE c.tenant_id = @tenant;

-- 4. Create Exam Term
INSERT INTO exams (name, start_date, end_date, tenant_id)
VALUES ('First Term Examination 2026', '2026-10-01', '2026-10-15', @tenant);
SET @exam = LAST_INSERT_ID();

-- 5. Auto-Generate Timetable Slots for Every Class (Monday to Friday)
-- Monday
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT s.class_id, 'Monday', '08:00', '08:40', s.id, @teacher, 1, @tenant FROM subjects s WHERE s.name = 'English' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '08:40', '09:20', s.id, @teacher, 2, @tenant FROM subjects s WHERE s.name = 'Urdu' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '09:20', '10:00', s.id, @teacher, 3, @tenant FROM subjects s WHERE s.name = 'Mathematics' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '10:00', '10:40', s.id, @teacher, 4, @tenant FROM subjects s WHERE s.name = 'General Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '11:10', '11:50', s.id, @teacher, 5, @tenant FROM subjects s WHERE s.name = 'Islamiyat' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '11:50', '12:30', s.id, @teacher, 6, @tenant FROM subjects s WHERE s.name = 'Pakistan Studies' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '12:30', '13:10', s.id, @teacher, 7, @tenant FROM subjects s WHERE s.name = 'Computer Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Monday', '13:10', '13:50', s.id, @teacher, 8, @tenant FROM subjects s WHERE s.name = 'Arabic' AND s.tenant_id = @tenant;

-- Tuesday
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT s.class_id, 'Tuesday', '08:00', '08:40', s.id, @teacher, 1, @tenant FROM subjects s WHERE s.name = 'Mathematics' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Tuesday', '08:40', '09:20', s.id, @teacher, 2, @tenant FROM subjects s WHERE s.name = 'English' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Tuesday', '09:20', '10:00', s.id, @teacher, 3, @tenant FROM subjects s WHERE s.name = 'General Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Tuesday', '10:00', '10:40', s.id, @teacher, 4, @tenant FROM subjects s WHERE s.name = 'Urdu' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Tuesday', '11:10', '11:50', s.id, @teacher, 5, @tenant FROM subjects s WHERE s.name = 'Computer Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Tuesday', '11:50', '12:30', s.id, @teacher, 6, @tenant FROM subjects s WHERE s.name = 'Islamiyat' AND s.tenant_id = @tenant;

-- Wednesday
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT s.class_id, 'Wednesday', '08:00', '08:40', s.id, @teacher, 1, @tenant FROM subjects s WHERE s.name = 'General Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Wednesday', '08:40', '09:20', s.id, @teacher, 2, @tenant FROM subjects s WHERE s.name = 'Mathematics' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Wednesday', '09:20', '10:00', s.id, @teacher, 3, @tenant FROM subjects s WHERE s.name = 'Urdu' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Wednesday', '10:00', '10:40', s.id, @teacher, 4, @tenant FROM subjects s WHERE s.name = 'English' AND s.tenant_id = @tenant;

-- Thursday
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT s.class_id, 'Thursday', '08:00', '08:40', s.id, @teacher, 1, @tenant FROM subjects s WHERE s.name = 'Urdu' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Thursday', '08:40', '09:20', s.id, @teacher, 2, @tenant FROM subjects s WHERE s.name = 'General Science' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Thursday', '09:20', '10:00', s.id, @teacher, 3, @tenant FROM subjects s WHERE s.name = 'English' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Thursday', '10:00', '10:40', s.id, @teacher, 4, @tenant FROM subjects s WHERE s.name = 'Mathematics' AND s.tenant_id = @tenant;

-- Friday
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT s.class_id, 'Friday', '08:00', '08:40', s.id, @teacher, 1, @tenant FROM subjects s WHERE s.name = 'English' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Friday', '08:40', '09:20', s.id, @teacher, 2, @tenant FROM subjects s WHERE s.name = 'Islamiyat' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Friday', '09:20', '10:00', s.id, @teacher, 3, @tenant FROM subjects s WHERE s.name = 'Mathematics' AND s.tenant_id = @tenant
UNION ALL
SELECT s.class_id, 'Friday', '10:00', '10:40', s.id, @teacher, 4, @tenant FROM subjects s WHERE s.name = 'General Science' AND s.tenant_id = @tenant;

-- 6. Generate Exam Papers for ALL Subjects Across ALL Classes
INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
SELECT @exam, s.class_id, s.id, @teacher, 100, @tenant FROM subjects s WHERE s.tenant_id = @tenant;

-- 7. Add Standard Questions for every English, Math, and Urdu paper created
-- English Questions
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q1: Reading Comprehension', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'English' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q2: Grammar & Vocabulary', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'English' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q3: Essay Writing', 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'English' AND ep.tenant_id = @tenant;

-- Mathematics Questions
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q1: Arithmetic & Algebra', 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Mathematics' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q2: Geometry & Shapes', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Mathematics' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q3: Word Problems', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Mathematics' AND ep.tenant_id = @tenant;

-- Urdu Questions
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q1: Tafheem (Comprehension)', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Urdu' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q2: Qawaid (Grammar)', 30, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Urdu' AND ep.tenant_id = @tenant;

INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id)
SELECT ep.id, 'Q3: Mazmoon (Essay)', 40, @tenant FROM exam_papers ep JOIN subjects s ON ep.subject_id = s.id WHERE s.name = 'Urdu' AND ep.tenant_id = @tenant;

-- 8. Add Question-level Marks for Active Students
INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id)
SELECT eq.exam_paper_id, eq.id, st.id, FLOOR(15 + (RAND() * (eq.marks - 15))), @tenant
FROM exam_questions eq
JOIN exam_papers ep ON eq.exam_paper_id = ep.id
JOIN students st ON ep.class_id = st.class_id
WHERE eq.tenant_id = @tenant AND st.status = 'active';

-- 9. Calculate and Insert Total Exam Marks for each Student Paper
INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT eqm.exam_paper_id, eqm.student_id, SUM(eqm.obtained_marks), @tenant
FROM exam_question_marks eqm
WHERE eqm.tenant_id = @tenant
GROUP BY eqm.exam_paper_id, eqm.student_id;
