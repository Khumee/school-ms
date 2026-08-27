-- =====================================================================
-- EXHAUSTIVE SAMPLE DATA: TIMETABLE & EXAMS FOR TENANT 4
-- =====================================================================

SET @tenant = 4;
-- Grab the first available class and teacher to attach data to
SET @class = (SELECT id FROM classes WHERE tenant_id = @tenant LIMIT 1);
SET @teacher = (SELECT id FROM employees WHERE role = 'teacher' AND tenant_id = @tenant LIMIT 1);

-- 1. Enable Modules for the Tenant
UPDATE tenants SET enable_timetable_module = 1, enable_exams_module = 1 WHERE id = @tenant;

-- 2. Clean up previous sample data for this class (Idempotent)
DELETE FROM periods WHERE class_id = @class AND tenant_id = @tenant;
DELETE FROM exam_question_marks WHERE tenant_id = @tenant AND exam_paper_id IN (SELECT id FROM exam_papers WHERE class_id = @class);
DELETE FROM exam_marks WHERE tenant_id = @tenant AND exam_paper_id IN (SELECT id FROM exam_papers WHERE class_id = @class);
DELETE FROM exam_questions WHERE tenant_id = @tenant AND exam_paper_id IN (SELECT id FROM exam_papers WHERE class_id = @class);
DELETE FROM exam_papers WHERE class_id = @class AND tenant_id = @tenant;
DELETE FROM exams WHERE tenant_id = @tenant AND name = 'First Term Examination 2026';
DELETE FROM subjects WHERE class_id = @class AND tenant_id = @tenant;

-- 3. Insert 8 Standard Pakistani Subjects
INSERT INTO subjects (class_id, name, tenant_id) VALUES 
(@class, 'English', @tenant),
(@class, 'Urdu', @tenant),
(@class, 'Mathematics', @tenant),
(@class, 'General Science', @tenant),
(@class, 'Islamiyat', @tenant),
(@class, 'Pakistan Studies', @tenant),
(@class, 'Computer Science', @tenant),
(@class, 'Arabic', @tenant);

-- Grab subject IDs into variables for easy reference
SET @sub_eng = (SELECT id FROM subjects WHERE name = 'English' AND class_id = @class LIMIT 1);
SET @sub_urd = (SELECT id FROM subjects WHERE name = 'Urdu' AND class_id = @class LIMIT 1);
SET @sub_mat = (SELECT id FROM subjects WHERE name = 'Mathematics' AND class_id = @class LIMIT 1);
SET @sub_sci = (SELECT id FROM subjects WHERE name = 'General Science' AND class_id = @class LIMIT 1);
SET @sub_isl = (SELECT id FROM subjects WHERE name = 'Islamiyat' AND class_id = @class LIMIT 1);
SET @sub_pak = (SELECT id FROM subjects WHERE name = 'Pakistan Studies' AND class_id = @class LIMIT 1);
SET @sub_csc = (SELECT id FROM subjects WHERE name = 'Computer Science' AND class_id = @class LIMIT 1);
SET @sub_ara = (SELECT id FROM subjects WHERE name = 'Arabic' AND class_id = @class LIMIT 1);

-- 4. Generate a Full Week Timetable (Monday to Friday, 8 periods a day)
-- MONDAY
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id) VALUES
(@class, 'Monday', '08:00', '08:40', @sub_eng, @teacher, 1, @tenant),
(@class, 'Monday', '08:40', '09:20', @sub_urd, @teacher, 2, @tenant),
(@class, 'Monday', '09:20', '10:00', @sub_mat, @teacher, 3, @tenant),
(@class, 'Monday', '10:00', '10:40', @sub_sci, @teacher, 4, @tenant),
(@class, 'Monday', '11:10', '11:50', @sub_isl, @teacher, 5, @tenant),
(@class, 'Monday', '11:50', '12:30', @sub_pak, @teacher, 6, @tenant),
(@class, 'Monday', '12:30', '13:10', @sub_csc, @teacher, 7, @tenant),
(@class, 'Monday', '13:10', '13:50', @sub_ara, @teacher, 8, @tenant);

-- TUESDAY
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id) VALUES
(@class, 'Tuesday', '08:00', '08:40', @sub_mat, @teacher, 1, @tenant),
(@class, 'Tuesday', '08:40', '09:20', @sub_eng, @teacher, 2, @tenant),
(@class, 'Tuesday', '09:20', '10:00', @sub_sci, @teacher, 3, @tenant),
(@class, 'Tuesday', '10:00', '10:40', @sub_urd, @teacher, 4, @tenant),
(@class, 'Tuesday', '11:10', '11:50', @sub_csc, @teacher, 5, @tenant),
(@class, 'Tuesday', '11:50', '12:30', @sub_isl, @teacher, 6, @tenant),
(@class, 'Tuesday', '12:30', '13:10', @sub_ara, @teacher, 7, @tenant),
(@class, 'Tuesday', '13:10', '13:50', @sub_pak, @teacher, 8, @tenant);

-- WEDNESDAY
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id) VALUES
(@class, 'Wednesday', '08:00', '08:40', @sub_sci, @teacher, 1, @tenant),
(@class, 'Wednesday', '08:40', '09:20', @sub_mat, @teacher, 2, @tenant),
(@class, 'Wednesday', '09:20', '10:00', @sub_urd, @teacher, 3, @tenant),
(@class, 'Wednesday', '10:00', '10:40', @sub_eng, @teacher, 4, @tenant),
(@class, 'Wednesday', '11:10', '11:50', @sub_pak, @teacher, 5, @tenant),
(@class, 'Wednesday', '11:50', '12:30', @sub_csc, @teacher, 6, @tenant),
(@class, 'Wednesday', '12:30', '13:10', @sub_isl, @teacher, 7, @tenant),
(@class, 'Wednesday', '13:10', '13:50', @sub_ara, @teacher, 8, @tenant);

-- THURSDAY
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id) VALUES
(@class, 'Thursday', '08:00', '08:40', @sub_urd, @teacher, 1, @tenant),
(@class, 'Thursday', '08:40', '09:20', @sub_sci, @teacher, 2, @tenant),
(@class, 'Thursday', '09:20', '10:00', @sub_eng, @teacher, 3, @tenant),
(@class, 'Thursday', '10:00', '10:40', @sub_mat, @teacher, 4, @tenant),
(@class, 'Thursday', '11:10', '11:50', @sub_ara, @teacher, 5, @tenant),
(@class, 'Thursday', '11:50', '12:30', @sub_pak, @teacher, 6, @tenant),
(@class, 'Thursday', '12:30', '13:10', @sub_csc, @teacher, 7, @tenant),
(@class, 'Thursday', '13:10', '13:50', @sub_isl, @teacher, 8, @tenant);

-- FRIDAY (Half Day - 5 Periods)
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id) VALUES
(@class, 'Friday', '08:00', '08:40', @sub_eng, @teacher, 1, @tenant),
(@class, 'Friday', '08:40', '09:20', @sub_isl, @teacher, 2, @tenant),
(@class, 'Friday', '09:20', '10:00', @sub_mat, @teacher, 3, @tenant),
(@class, 'Friday', '10:00', '10:40', @sub_sci, @teacher, 4, @tenant),
(@class, 'Friday', '10:40', '11:20', @sub_urd, @teacher, 5, @tenant);


-- 5. Create Exam Term
INSERT INTO exams (name, start_date, end_date, tenant_id)
VALUES ('First Term Examination 2026', '2026-10-01', '2026-10-15', @tenant);
SET @exam = LAST_INSERT_ID();

-- 6. Generate Exam Papers
INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id) VALUES 
(@exam, @class, @sub_eng, @teacher, 100, @tenant),
(@exam, @class, @sub_urd, @teacher, 100, @tenant),
(@exam, @class, @sub_mat, @teacher, 100, @tenant),
(@exam, @class, @sub_sci, @teacher, 100, @tenant),
(@exam, @class, @sub_isl, @teacher, 50, @tenant),
(@exam, @class, @sub_pak, @teacher, 50, @tenant),
(@exam, @class, @sub_csc, @teacher, 75, @tenant),
(@exam, @class, @sub_ara, @teacher, 50, @tenant);

-- Grab paper IDs
SET @p_eng = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_eng);
SET @p_urd = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_urd);
SET @p_mat = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_mat);
SET @p_sci = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_sci);
SET @p_isl = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_isl);
SET @p_pak = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_pak);
SET @p_csc = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_csc);
SET @p_ara = (SELECT id FROM exam_papers WHERE exam_id = @exam AND subject_id = @sub_ara);

-- 7. Add Exam Questions for each paper
-- English (100)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_eng, 'Q1: Reading Comprehension', 30, @tenant), (@p_eng, 'Q2: Grammar', 30, @tenant), (@p_eng, 'Q3: Essay Writing', 40, @tenant);

-- Urdu (100)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_urd, 'Q1: Tafheem', 30, @tenant), (@p_urd, 'Q2: Qawaid', 30, @tenant), (@p_urd, 'Q3: Mazmoon', 40, @tenant);

-- Mathematics (100)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_mat, 'Q1: Algebra', 35, @tenant), (@p_mat, 'Q2: Geometry', 35, @tenant), (@p_mat, 'Q3: Trigonometry', 30, @tenant);

-- Science (100)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_sci, 'Q1: Physics Section', 33, @tenant), (@p_sci, 'Q2: Chemistry Section', 33, @tenant), (@p_sci, 'Q3: Biology Section', 34, @tenant);

-- Islamiyat (50)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_isl, 'Q1: Quranic Verses', 20, @tenant), (@p_isl, 'Q2: Hadith', 15, @tenant), (@p_isl, 'Q3: General Knowledge', 15, @tenant);

-- Pak Studies (50)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_pak, 'Q1: History', 25, @tenant), (@p_pak, 'Q2: Geography', 25, @tenant);

-- Computer Science (75)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_csc, 'Q1: Hardware', 25, @tenant), (@p_csc, 'Q2: Software & Logic', 25, @tenant), (@p_csc, 'Q3: Programming', 25, @tenant);

-- Arabic (50)
INSERT INTO exam_questions (exam_paper_id, question_text, marks, tenant_id) VALUES 
(@p_ara, 'Q1: Vocabulary', 25, @tenant), (@p_ara, 'Q2: Translation', 25, @tenant);

-- 8. Add Student Marks (Simulate Total Marks)
-- To keep the script from being 10,000 lines long, we will insert the total obtained marks directly.
-- In a real scenario, teachers would enter `exam_question_marks`, but for the sample we just set the total for demo purposes.
INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_eng, id, FLOOR(40 + (RAND() * 60)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_urd, id, FLOOR(40 + (RAND() * 60)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_mat, id, FLOOR(30 + (RAND() * 70)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_sci, id, FLOOR(45 + (RAND() * 55)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_isl, id, FLOOR(25 + (RAND() * 25)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_pak, id, FLOOR(25 + (RAND() * 25)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_csc, id, FLOOR(35 + (RAND() * 40)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT @p_ara, id, FLOOR(20 + (RAND() * 30)), @tenant FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

-- Add some question-level marks for English to demonstrate the Grid
INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id)
SELECT @p_eng, (SELECT id FROM exam_questions WHERE exam_paper_id = @p_eng AND question_text = 'Q1: Reading Comprehension'), id, FLOOR(15 + (RAND() * 15)), @tenant 
FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id)
SELECT @p_eng, (SELECT id FROM exam_questions WHERE exam_paper_id = @p_eng AND question_text = 'Q2: Grammar'), id, FLOOR(15 + (RAND() * 15)), @tenant 
FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

INSERT INTO exam_question_marks (exam_paper_id, question_id, student_id, obtained_marks, tenant_id)
SELECT @p_eng, (SELECT id FROM exam_questions WHERE exam_paper_id = @p_eng AND question_text = 'Q3: Essay Writing'), id, FLOOR(20 + (RAND() * 20)), @tenant 
FROM students WHERE class_id = @class AND tenant_id = @tenant AND status = 'active';

-- Re-sync the total marks for English based on the random question marks
UPDATE exam_marks em 
SET obtained_marks = (
    SELECT SUM(obtained_marks) FROM exam_question_marks eqm 
    WHERE eqm.exam_paper_id = em.exam_paper_id AND eqm.student_id = em.student_id
)
WHERE exam_paper_id = @p_eng;
