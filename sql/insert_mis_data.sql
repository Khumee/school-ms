
-- ==========================================
-- SQL Data Migration Script for MIS Tenant
-- ==========================================

START TRANSACTION;

-- 1. Get Tenant ID for 'mis'
SET @tenant_id = (SELECT id FROM tenants WHERE subdomain = 'mis');

-- 2. Add or Update Classes and Set standard fee = 2100

-- Class: Play Group
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Play Group', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Play Group' AND tenant_id = @tenant_id;

-- Class: Nursery class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Nursery class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Nursery class' AND tenant_id = @tenant_id;

-- Class: Prep Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Prep Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Prep Class' AND tenant_id = @tenant_id;

-- Class: One Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'One Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'One Class' AND tenant_id = @tenant_id;

-- Class: Two Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Two Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Two Class' AND tenant_id = @tenant_id;

-- Class: Three Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Three Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Three Class' AND tenant_id = @tenant_id;

-- Class: Fourth Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Fourth Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Fourth Class' AND tenant_id = @tenant_id;

-- Class: Fifth Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Fifth Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Fifth Class' AND tenant_id = @tenant_id;

-- Class: Sixth Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Sixth Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Sixth Class' AND tenant_id = @tenant_id;

-- Class: Hifz Class
INSERT INTO classes (name, default_monthly_fee, tenant_id)
SELECT 'Hifz Class', 2100.00, @tenant_id
WHERE NOT EXISTS (
    SELECT 1 FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id
);

UPDATE classes SET default_monthly_fee = 2100.00 WHERE name = 'Hifz Class' AND tenant_id = @tenant_id;

-- 3. Delete existing students and fee payments for the MIS tenant to avoid duplicates
DELETE FROM fee_payments WHERE tenant_id = @tenant_id;
DELETE FROM students WHERE tenant_id = @tenant_id;

-- 4. Insert Students and Fee Payments

-- Student: Anaya Arshad (MIS-188) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-188', 'Anaya Arshad', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zara Abbasi (MIS-260) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-260', 'Zara Abbasi', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zain Abbasi (MIS-259) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-259', 'Zain Abbasi', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadir Mohaudin (MIS-258) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-258', 'Hadir Mohaudin', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sahrash Alam (MIS-253) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-253', 'Sahrash Alam', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: M.Zohan (MIS-251) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-251', 'M.Zohan', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Asim Bashir (MIS-247) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-247', 'M.Asim Bashir', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 600.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Ismail Hassan (MIS-246) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-246', 'M.Ismail Hassan', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Adil (MIS-244) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-244', 'M.Adil', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fatima Allah Ditta (MIS-239) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-239', 'Fatima Allah Ditta', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Abubakar (MIs-218) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-218', 'M.Abubakar', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ramzan Awan (MIs-222) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-222', 'Ramzan Awan', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zunaira awan (MIS-223) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-223', 'Zunaira awan', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M-Rohan (MIS-232) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-232', 'M-Rohan', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sajjad Ali (MIS-262) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-262', 'Sajjad Ali', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Saif ullah (Mis-268) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('Mis-268', 'Saif ullah', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Arshamaan (Mis-267) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('Mis-267', 'M.Arshamaan', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Amina Qamar (Mis-265) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('Mis-265', 'Amina Qamar', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ansaar Ahmed (MIs-264) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-264', 'Ansaar Ahmed', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fatima Shahid (MIS-269) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-269', 'Fatima Shahid', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Arman (MIS-257) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-257', 'M.Arman', @class_id, 1350.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 750.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 750.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 750.00, '2026-07-01', 1, 0.00, 0);

-- Student: Irtaza Ali (MIS-277) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-277', 'Irtaza Ali', @class_id, 1500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zarish Abbasi (MIs-279) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-279', 'Zarish Abbasi', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muskan Sanawar (MIS-281) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-281', 'Muskan Sanawar', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sumiya Noor (MIS-282) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-282', 'Sumiya Noor', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Urwa kamran (MIS-272) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-272', 'Urwa kamran', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zunaira (MIS-283) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-283', 'Zunaira', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Abdul wahab (MIs-275) in Play Group
SET @class_id = (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-275', 'Abdul wahab', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Areez Irfan (MIS-201) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-201', 'M.Areez Irfan', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad Ahmad (MIS-211) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-211', 'Muhammad Ahmad', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Usman Sabeel (MIS-209) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-209', 'M.Usman Sabeel', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2200.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Mustafa (MIS-195) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-195', 'M.Mustafa', @class_id, 1300.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2400.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Rafy Sheraz (MIS-202) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-202', 'Abdul Rafy Sheraz', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hamad (MIS-245) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-245', 'Hamad', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Eshal Malik (MIS-221) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-221', 'Eshal Malik', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 5000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hassan naveed (MIS-215) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-215', 'Hassan naveed', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Taha (MIS-263) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-263', 'M.Taha', @class_id, 900.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1200.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ismail (MIS-127) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-127', 'Ismail', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Shahzaib Abbasi (MIS-280) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-280', 'Shahzaib Abbasi', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Abbas Khan (MIS-270) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-270', 'Abbas Khan', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 6200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hurain Kamran (MIS-273) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-273', 'Hurain Kamran', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Horia Qadir (MIS-274) in Nursery class
SET @class_id = (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-274', 'Horia Qadir', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadia nadeem balouch (MIS-234) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-234', 'Hadia nadeem balouch', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 6000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad Ahmad Ali (MIS-190) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-190', 'Muhammad Ahmad Ali', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1200.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hafsa Rafaqat (MIS-180) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-180', 'Hafsa Rafaqat', @class_id, 500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Umme Salmah (MIS-181) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-181', 'Umme Salmah', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Ahad (MIS-182) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-182', 'Abdul Ahad', @class_id, 800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ibraheem Abid (MIS-173) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-173', 'Ibraheem Abid', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aimal Sahar (MIS-169) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-169', 'Aimal Sahar', @class_id, 300.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 3700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Qasim (MIS-172) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-172', 'M.Qasim', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Insha Javed (MIS-165) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-165', 'Insha Javed', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Jalal Nazakat (MIS-142) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-142', 'Jalal Nazakat', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Rameen Fatima (MIS-204) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-204', 'Rameen Fatima', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 4800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: khansa (MIS-255) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-255', 'khansa', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul wahab Nadeem (MIS-162) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-162', 'Abdul wahab Nadeem', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 11400.00, '2026-07-01', 1, 0.00, 0);

-- Student: Anaya Zubair (MIS-233) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-233', 'Anaya Zubair', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ali Hassan (MIS-227) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-227', 'Ali Hassan', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Murtaza (MIS-225) in Prep Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-225', 'M.Murtaza', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 6000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 6000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fariya Qadir (MIS-TEMP-59) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-TEMP-59', 'Fariya Qadir', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad Ammar (MIS-191) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-191', 'Muhammad Ammar', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Arham (MIS-186) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-186', 'M.Arham', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 3200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Bisma Javed (MIS-166) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-166', 'Bisma Javed', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Arahm zeeshan (MIS-177) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-177', 'Arahm zeeshan', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Meesam Abbas (MIS-098) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-098', 'Meesam Abbas', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ubaid Ullah (MIS-161) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-161', 'Ubaid Ullah', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Reham Gull (MIS-119) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-119', 'Reham Gull', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Tayyab (MIS-081) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-081', 'Tayyab', @class_id, 1500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sumaya Gull (MIS-094) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-094', 'Sumaya Gull', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Tayyaba Naveed (MIS-082) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-082', 'Tayyaba Naveed', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hareem Fatima (MIS-203) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-203', 'Hareem Fatima', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 4800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Khulood (MIs-254) in One Class
SET @class_id = (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-254', 'Khulood', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zara amin (MIS-196) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-196', 'Zara amin', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad Yahya (MIS-200) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-200', 'Muhammad Yahya', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Azan (MIS-185) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-185', 'M.Azan', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 3200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fahad Nadeem (MIS-156) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-156', 'Fahad Nadeem', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 4200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 9000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Noor Zahra (MIS-155) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-155', 'Noor Zahra', @class_id, 500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Samiullah (MIS-159) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-159', 'Samiullah', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aiman Nazakat (MIS-115) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-115', 'Aiman Nazakat', @class_id, 1600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Azab Shahzad (MIS-105) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-105', 'Azab Shahzad', @class_id, 1000.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadir Ali (MIS-112) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-112', 'Hadir Ali', @class_id, 700.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1400.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1400.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Farhan (MIS-134) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-134', 'M.Farhan', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2400.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Nayab Fatima (MIS-100) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-100', 'Nayab Fatima', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sila (MIS-096) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-096', 'Sila', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Muqadas (MIS-124) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-124', 'Muqadas', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Rabia (MIS-125) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-125', 'Rabia', @class_id, 1900.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 200.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fabiha Fatima (MIS-124-2) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-124-2', 'Fabiha Fatima', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ayat Zahra (MIS-126) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-126', 'Ayat Zahra', @class_id, 300.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 3700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);

-- Student: Alishba (MIS-256) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-256', 'Alishba', @class_id, 1350.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1050.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 750.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 750.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadir Ali (MIS-216) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-216', 'Hadir Ali', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fariha Gull (MIs-261) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-261', 'Fariha Gull', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Shahzain (MIS-248) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-248', 'Shahzain', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Hadi Mir (MIS-224) in Two Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-224', 'Abdul Hadi Mir', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 14000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aysha Abbas (MIS-217) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-217', 'Aysha Abbas', @class_id, 600.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);

-- Student: Sulman Arshad (MIS-189) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-189', 'Sulman Arshad', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Hussain (MIS-104) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-104', 'M.Hussain', @class_id, 500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Arham Abbasi (MIS-091) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-091', 'Arham Abbasi', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Minahil Naveed (MIS-082-2) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-082-2', 'Minahil Naveed', @class_id, 700.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1400.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1400.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ayat Noor (MIS-067) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-067', 'Ayat Noor', @class_id, 400.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4900.00, '2026-07-01', 1, 0.00, 0);

-- Student: Tehzeeb Shakir (MIS-102) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-102', 'Tehzeeb Shakir', @class_id, 1000.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Haya Shakir (MIS-103) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-103', 'Haya Shakir', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Rafay (MIS-084) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-084', 'Abdul Rafay', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Huzefa Nawaz (MIS-078) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-078', 'Huzefa Nawaz', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Mohsin Ali (MIS-075) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-075', 'Mohsin Ali', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: wahib Ali (MIS-079) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-079', 'wahib Ali', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aysha Gull (MIS-041) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-041', 'Aysha Gull', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Mubashir (MIS-117) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-117', 'Mubashir', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Saima (MIs-278) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-278', 'Saima', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdullah (MIS-130) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-130', 'Abdullah', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Hanan (MIS-065) in Three Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-065', 'Abdul Hanan', @class_id, 800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Sufiyan (MIS-230) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-230', 'M.Sufiyan', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 3000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Afia (MIS-192) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-192', 'Afia', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Zainab Noor (MIS-080) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-080', 'Zainab Noor', @class_id, 1000.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 3300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 5000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 2200.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Arooj Fatima (MIS-099) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-099', 'Arooj Fatima', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2700.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2400.00, '2026-07-01', 1, 0.00, 0);

-- Student: Alisbah (MIS-093) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-093', 'Alisbah', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hassam (MIS-131) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-131', 'Hassam', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Isra (MIS-054) in Fourth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-054', 'Isra', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadiya bibi (MIS-023) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-023', 'Hadiya bibi', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hadia Nadeem (MIS-158) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-158', 'Hadia Nadeem', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 10800.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 3600.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Anwar (MIS-068) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-068', 'M.Anwar', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 3450.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 4, 2026, 1700.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ariba Nazakat (MIS-030) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-030', 'Ariba Nazakat', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Fizza Saleem (MIS-074) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-074', 'Fizza Saleem', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aliza Arshad (MIS-271) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-271', 'Aliza Arshad', @class_id, 500.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1600.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ali Raza (MIS-130-2) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-130-2', 'Ali Raza', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Ahmed Raz (MIS-113) in Fifth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-113', 'M.Ahmed Raz', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Aafia Bibi (MIS-116) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-116', 'Aafia Bibi', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Maira Afzal (MIS-022) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-022', 'Maira Afzal', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Tayyaba Faial (MIS-020) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-020', 'Tayyaba Faial', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hijab Zahra (MIS-97) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-97', 'Hijab Zahra', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Tayyaba Fatima (MIS-129) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-129', 'Tayyaba Fatima', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Amna Nazakat (MIS-029) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-029', 'Amna Nazakat', @class_id, 1800.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);

-- Student: Nayab Ali (MIs-146) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-146', 'Nayab Ali', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Ayesha Qadar (MIS-050) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-050', 'Ayesha Qadar', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Hoorum Batool (MIS-028) in Sixth Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-028', 'Hoorum Batool', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-07-01', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 2, 2026, 2100.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad Sadique (MIS-012) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-012', 'Muhammad Sadique', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Muhammad Umer (MIS-021) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-021', 'Muhammad Umer', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Abdullah Saleem (MIS-026) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-026', 'Abdullah Saleem', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Muhammad Rayan Atif (MIs-028-2) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-028-2', 'Muhammad Rayan Atif', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Abad Khan (MIS-035) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-035', 'Abad Khan', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Hasnain Ali (MIS-037) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-037', 'Hasnain Ali', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Adil (MIs-039) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-039', 'Adil', @class_id, 0.00, 0, NULL, 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();

-- Student: Mukaram (Mis-041-2) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('Mis-041-2', 'Mukaram', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Rahmat ali (MIs-042) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-042', 'Rahmat ali', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Manan (MIs-043) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-043', 'Abdul Manan', @class_id, 1100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Ahmed Nisar (MIS-044) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-044', 'M.Ahmed Nisar', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Azaan Nisar (MIS-045) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-045', 'M.Azaan Nisar', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Ali (MIS-046) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-046', 'M.Ali', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Shahzain (MIS-047) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-047', 'M.Shahzain', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Roman Ahmed (MIS-048) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-048', 'Roman Ahmed', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Wahaj Ahmed (MIs-049) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-049', 'Wahaj Ahmed', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Mujtaba (MIS-050-2) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-050-2', 'M.Mujtaba', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Ahsan Rizwan (MIS-051) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-051', 'Ahsan Rizwan', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: M.Azan (MIs-052) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-052', 'M.Azan', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul Ghani (MIs-053) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIs-053', 'Abdul Ghani', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Muhammad (MIS-054-2) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-054-2', 'Muhammad', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Abdul hadi (MIS-055) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-055', 'Abdul hadi', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

-- Student: Saalar (MIS-056) in Hifz Class
SET @class_id = (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id);
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission)
VALUES ('MIS-056', 'Saalar', @class_id, 100.00, 1, 'Scholarship/Concession support', 'active', @tenant_id, '2026-01-01');

SET @student_id = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived)
VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-07-01', 1, 0.00, 0);

COMMIT;
