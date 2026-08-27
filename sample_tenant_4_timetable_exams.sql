-- Enable both modules for Tenant 4
UPDATE tenants SET enable_timetable_module = 1, enable_exams_module = 1 WHERE id = 4;

-- Insert Sample Subjects (finding the first available class for tenant 4)
INSERT INTO subjects (class_id, name, tenant_id)
SELECT id, 'Mathematics', 4 FROM classes WHERE tenant_id = 4 LIMIT 1;

INSERT INTO subjects (class_id, name, tenant_id)
SELECT id, 'Science', 4 FROM classes WHERE tenant_id = 4 LIMIT 1;

INSERT INTO subjects (class_id, name, tenant_id)
SELECT id, 'English', 4 FROM classes WHERE tenant_id = 4 LIMIT 1;

-- Add a Sample Exam Term
INSERT INTO exams (name, start_date, end_date, tenant_id)
VALUES ('Midterm Examination 2026', '2026-10-01', '2026-10-15', 4);

-- Create Exam Papers for the subjects and assign a teacher
INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
SELECT 
    (SELECT id FROM exams WHERE tenant_id = 4 LIMIT 1),
    (SELECT id FROM classes WHERE tenant_id = 4 LIMIT 1),
    (SELECT id FROM subjects WHERE name = 'Mathematics' AND tenant_id = 4 LIMIT 1),
    (SELECT id FROM employees WHERE role = 'teacher' AND tenant_id = 4 LIMIT 1),
    100, 
    4;

INSERT INTO exam_papers (exam_id, class_id, subject_id, teacher_id, total_marks, tenant_id)
SELECT 
    (SELECT id FROM exams WHERE tenant_id = 4 LIMIT 1),
    (SELECT id FROM classes WHERE tenant_id = 4 LIMIT 1),
    (SELECT id FROM subjects WHERE name = 'Science' AND tenant_id = 4 LIMIT 1),
    (SELECT id FROM employees WHERE role = 'teacher' AND tenant_id = 4 LIMIT 1),
    50, 
    4;

-- Generate random marks (between 50 and 100) for all students in that class for Mathematics
INSERT INTO exam_marks (exam_paper_id, student_id, obtained_marks, tenant_id)
SELECT 
    (SELECT id FROM exam_papers WHERE tenant_id = 4 AND total_marks = 100 LIMIT 1),
    id,
    FLOOR(50 + (RAND() * 50)), 
    4
FROM students 
WHERE class_id = (SELECT id FROM classes WHERE tenant_id = 4 LIMIT 1) AND tenant_id = 4;

-- Assign timetable slots (Periods) for the class
INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT
    (SELECT id FROM classes WHERE tenant_id = 4 LIMIT 1),
    'Monday',
    '08:00:00',
    '08:45:00',
    (SELECT id FROM subjects WHERE name = 'Mathematics' AND tenant_id = 4 LIMIT 1),
    (SELECT id FROM employees WHERE role = 'teacher' AND tenant_id = 4 LIMIT 1),
    1,
    4;

INSERT INTO periods (class_id, day_of_week, start_time, end_time, subject_id, employee_id, period_number, tenant_id)
SELECT
    (SELECT id FROM classes WHERE tenant_id = 4 LIMIT 1),
    'Monday',
    '08:45:00',
    '09:30:00',
    (SELECT id FROM subjects WHERE name = 'Science' AND tenant_id = 4 LIMIT 1),
    (SELECT id FROM employees WHERE role = 'teacher' AND tenant_id = 4 LIMIT 1),
    2,
    4;
