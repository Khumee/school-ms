-- Migration Script for Tenant 16 (Good Luck School - GLS)
-- Source: August 2026 Fee Record (Aug-26 Sheet)
-- Fees: PG to Class 4 = 2000, Class 5 to 7 = 2500
-- Registration Numbers: Auto-generated sequential GLS-001, GLS-002, ...
START TRANSACTION;

SET @tenant_id = 16;

-- Clear previous entries for this tenant to avoid duplicate key errors on re-runs
INSERT INTO tenants (id, name, school_name, subdomain, status) VALUES (16, 'Good Luck School', 'Good Luck School', 'goodluck', 'active') ON DUPLICATE KEY UPDATE name=VALUES(name), school_name=VALUES(school_name);
DELETE FROM fee_payments WHERE tenant_id = @tenant_id;
DELETE FROM students WHERE tenant_id = @tenant_id;
DELETE FROM classes WHERE tenant_id = @tenant_id;


-- =====================================
-- Class: Play Group (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Play Group', 2000, @tenant_id);
SET @class_play_group = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-001', 'Hassan Raza Khan', @class_play_group, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_001 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_001, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-002', 'Zara Noor', @class_play_group, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_002 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-003', 'Anabiya Nazir', @class_play_group, 500.00, 1, NULL, @tenant_id);
SET @student_gls_003 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_003, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-004', 'Um e Haniya', @class_play_group, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_004 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-005', 'yahkhya sister', @class_play_group, 700.00, 1, NULL, @tenant_id);
SET @student_gls_005 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-006', 'Zoya Khan', @class_play_group, 500.00, 1, NULL, @tenant_id);
SET @student_gls_006 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-007', 'Dua Zara', @class_play_group, 500.00, 1, 'Previous Outstanding: Rs. 4,500', @tenant_id);
SET @student_gls_007 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-008', 'Sadia', @class_play_group, 500.00, 1, NULL, @tenant_id);
SET @student_gls_008 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_008, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-009', 'Daniyal', @class_play_group, 500.00, 1, 'Previous Outstanding: Rs. 1,500', @tenant_id);
SET @student_gls_009 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_009, 8, 2026, 3000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-010', 'Areesh nabeel', @class_play_group, 0.00, 0, NULL, @tenant_id);
SET @student_gls_010 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_010, 8, 2026, 6000.00, '2026-08-01');

-- =====================================
-- Class: Nursery (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Nursery', 2000, @tenant_id);
SET @class_nursery = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-011', 'HAMMAD', @class_nursery, 500.00, 1, 'Advance Paid: Rs. 1,500', @tenant_id);
SET @student_gls_011 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-012', 'A.Rehman', @class_nursery, 500.00, 1, NULL, @tenant_id);
SET @student_gls_012 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_012, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-013', 'M. Shahban', @class_nursery, 500.00, 1, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_013 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-014', 'Hassan Amjad', @class_nursery, 0.00, 0, 'Previous Outstanding: Rs. 3,400', @tenant_id);
SET @student_gls_014 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_014, 8, 2026, 1000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-015', 'M. Awais', @class_nursery, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_015 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-016', 'Rohan Wasem', @class_nursery, 0.00, 0, NULL, @tenant_id);
SET @student_gls_016 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_016, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-017', 'Abbas Khan', @class_nursery, 1000.00, 1, 'Previous Outstanding: Rs. 1,000', @tenant_id);
SET @student_gls_017 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-018', 'Anas Nazir Rizvi', @class_nursery, 0.00, 0, NULL, @tenant_id);
SET @student_gls_018 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_018, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-019', 'Hurrain Fatima', @class_nursery, 0.00, 0, NULL, @tenant_id);
SET @student_gls_019 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_019, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-020', 'Muhammad Abdullah', @class_nursery, 500.00, 1, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_020 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_020, 8, 2026, 4000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-021', 'Muhammad Qasim Ali', @class_nursery, 500.00, 1, NULL, @tenant_id);
SET @student_gls_021 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_021, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-022', 'Naqib Ullah', @class_nursery, 500.00, 1, 'Previous Outstanding: Rs. 1,500', @tenant_id);
SET @student_gls_022 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_022, 8, 2026, 3000.00, '2026-08-01');

-- =====================================
-- Class: Prep (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Prep', 2000, @tenant_id);
SET @class_prep = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-023', 'M YAKHYA', @class_prep, 1000.00, 1, 'Advance Paid: Rs. 1,000', @tenant_id);
SET @student_gls_023 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-024', 'YASHFA NOOR', @class_prep, 700.00, 1, 'Previous Outstanding: Rs. 1,300', @tenant_id);
SET @student_gls_024 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_024, 8, 2026, 2600.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-025', 'RUQIYA SAAD', @class_prep, 700.00, 1, 'Previous Outstanding: Rs. 1,300', @tenant_id);
SET @student_gls_025 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_025, 8, 2026, 2600.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-026', 'M FARHAN', @class_prep, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_026 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-027', 'Horish', @class_prep, 500.00, 1, 'Previous Outstanding: Rs. 3,500', @tenant_id);
SET @student_gls_027 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-028', 'ABDUL WAHAB', @class_prep, 0.00, 0, 'Previous Outstanding: Rs. 12,500', @tenant_id);
SET @student_gls_028 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-029', 'Saif Ullah', @class_prep, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_029 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_029, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-030', 'Shahrukh Khan', @class_prep, 500.00, 1, 'Previous Outstanding: Rs. 1,500', @tenant_id);
SET @student_gls_030 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_030, 8, 2026, 3000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-031', 'Muhammad Mustafa', @class_prep, 500.00, 1, 'Previous Outstanding: Rs. 1,500', @tenant_id);
SET @student_gls_031 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_031, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-032', 'Mohaviya', @class_prep, 0.00, 0, NULL, @tenant_id);
SET @student_gls_032 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_032, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-033', 'Arisha Noor', @class_prep, 0.00, 0, NULL, @tenant_id);
SET @student_gls_033 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_033, 8, 2026, 2000.00, '2026-08-01');

-- =====================================
-- Class: One (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('One', 2000, @tenant_id);
SET @class_one = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-034', 'AYAN YASIR', @class_one, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_034 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-035', 'SADIA', @class_one, 0.00, 0, 'Advance Paid: Rs. 2,000', @tenant_id);
SET @student_gls_035 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-036', 'SAAD ADNAN', @class_one, 0.00, 0, 'Previous Outstanding: Rs. 4,000', @tenant_id);
SET @student_gls_036 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_036, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-037', 'Ahmad Raza', @class_one, 1000.00, 1, NULL, @tenant_id);
SET @student_gls_037 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_037, 8, 2026, 1000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-038', 'MUKHAIR REHMAN', @class_one, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_038 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-039', 'Muhammad Asif', @class_one, 0.00, 0, 'Previous Outstanding: Rs. 4,000', @tenant_id);
SET @student_gls_039 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_039, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-040', 'Nisar', @class_one, 1000.00, 1, 'Previous Outstanding: Rs. 1,000', @tenant_id);
SET @student_gls_040 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_040, 8, 2026, 2000.00, '2026-08-01');

-- =====================================
-- Class: Two (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Two', 2000, @tenant_id);
SET @class_two = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-041', 'M WALI', @class_two, 500.00, 1, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_041 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-042', 'HAMZA Amjad', @class_two, 1000.00, 1, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_042 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_042, 8, 2026, 1000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-043', 'NAJEEB', @class_two, 1000.00, 1, NULL, @tenant_id);
SET @student_gls_043 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-044', 'Husnain Yousaf', @class_two, 0.00, 0, 'Previous Outstanding: Rs. 2,800', @tenant_id);
SET @student_gls_044 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_044, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-045', 'M Adnan Khan', @class_two, 0.00, 0, 'Previous Outstanding: Rs. 11,000', @tenant_id);
SET @student_gls_045 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-046', 'M. Rehan Shahzad', @class_two, 0.00, 0, NULL, @tenant_id);
SET @student_gls_046 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_046, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-047', 'Hunaiza', @class_two, 300.00, 1, 'Previous Outstanding: Rs. 100', @tenant_id);
SET @student_gls_047 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-048', 'SHANZEY NOOR', @class_two, 500.00, 1, NULL, @tenant_id);
SET @student_gls_048 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_048, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-049', 'Anam', @class_two, 0.00, 0, 'Previous Outstanding: Rs. 14,000', @tenant_id);
SET @student_gls_049 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-050', 'Hassan Naveed', @class_two, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_050 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-051', 'Maria Gul', @class_two, 0.00, 0, 'Previous Outstanding: Rs. 6,500', @tenant_id);
SET @student_gls_051 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_051, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-052', 'Dua Fatima', @class_two, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_052 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_052, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-053', 'Muzamal Hussain', @class_two, 0.00, 0, NULL, @tenant_id);
SET @student_gls_053 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_053, 8, 2026, 2000.00, '2026-08-01');

-- =====================================
-- Class: Three (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Three', 2000, @tenant_id);
SET @class_three = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-054', 'HUSAIN MUSTAFA', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 6,500', @tenant_id);
SET @student_gls_054 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_054, 8, 2026, 7000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-055', 'Isha Nadeem', @class_three, 200.00, 1, 'Previous Outstanding: Rs. 3,900', @tenant_id);
SET @student_gls_055 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_055, 8, 2026, 3600.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-056', 'MURTAGIS', @class_three, 500.00, 1, NULL, @tenant_id);
SET @student_gls_056 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_056, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-057', 'JAWARIA Noor', @class_three, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_057 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-058', 'AYESHA NOOR', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 3,300', @tenant_id);
SET @student_gls_058 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_058, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-059', 'TAHA SAQIB', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 3,320', @tenant_id);
SET @student_gls_059 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-060', 'LAIZA EMAN', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 7,000', @tenant_id);
SET @student_gls_060 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-061', 'ABDUL HADI ZAMIR', @class_three, 2000.00, 1, NULL, @tenant_id);
SET @student_gls_061 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-062', 'AHSAN Bin Usman', @class_three, 300.00, 1, 'Previous Outstanding: Rs. 1,700', @tenant_id);
SET @student_gls_062 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_062, 8, 2026, 3400.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-063', 'M. Zaryab', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_063 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_063, 8, 2026, 4000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-064', 'Anesha Shahzad', @class_three, 0.00, 0, NULL, @tenant_id);
SET @student_gls_064 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_064, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-065', 'Zubariya Tabraiz', @class_three, 0.00, 0, NULL, @tenant_id);
SET @student_gls_065 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_065, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-066', 'Muhammad (gul Badsha)', @class_three, 500.00, 1, NULL, @tenant_id);
SET @student_gls_066 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_066, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-067', 'Zunaira', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 6,000', @tenant_id);
SET @student_gls_067 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_067, 8, 2026, 3000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-068', 'Muhammad Ismail', @class_three, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_068 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_068, 8, 2026, 4000.00, '2026-08-01');

-- =====================================
-- Class: Four (Monthly Fee: 2000)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Four', 2000, @tenant_id);
SET @class_four = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-069', 'URWA SHAHZADI', @class_four, 0.00, 0, NULL, @tenant_id);
SET @student_gls_069 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_069, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-070', 'M MAHAD AMJAD', @class_four, 0.00, 0, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_070 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-071', 'M Sufyan', @class_four, 2000.00, 1, 'Previous Outstanding: Rs. 2,800', @tenant_id);
SET @student_gls_071 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-072', 'ZARIYA Arbab', @class_four, 0.00, 0, NULL, @tenant_id);
SET @student_gls_072 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_072, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-073', 'HAMAEL FATIMA', @class_four, 0.00, 0, 'Previous Outstanding: Rs. 1,000', @tenant_id);
SET @student_gls_073 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_073, 8, 2026, 5000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-074', 'Anshra Nouman', @class_four, 0.00, 0, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_074 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_074, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-075', 'Ansar', @class_four, 0.00, 0, NULL, @tenant_id);
SET @student_gls_075 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_075, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-076', 'HASNAIN ALI Majid', @class_four, -300.00, 0, NULL, @tenant_id);
SET @student_gls_076 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_076, 8, 2026, 2300.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-077', 'Um e Humaira', @class_four, 0.00, 0, 'Previous Outstanding: Rs. 5,000', @tenant_id);
SET @student_gls_077 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-078', 'Muhammad Ammar', @class_four, 0.00, 0, NULL, @tenant_id);
SET @student_gls_078 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_078, 8, 2026, 10000.00, '2026-08-01');

-- =====================================
-- Class: Five (Monthly Fee: 2500)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Five', 2500, @tenant_id);
SET @class_five = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-079', 'ISHA KHURAM', @class_five, 500.00, 1, NULL, @tenant_id);
SET @student_gls_079 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_079, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-080', 'ARYAN AHMED', @class_five, 500.00, 1, 'Previous Outstanding: Rs. 4,000', @tenant_id);
SET @student_gls_080 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-081', 'ABDUL WAHID', @class_five, 500.00, 1, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_081 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_081, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-082', 'M SHAFEH', @class_five, 2500.00, 1, NULL, @tenant_id);
SET @student_gls_082 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-083', 'HIFZA AWAIS', @class_five, 800.00, 1, 'Previous Outstanding: Rs. 1,700', @tenant_id);
SET @student_gls_083 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_083, 8, 2026, 3400.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-084', 'KINZA Rehman', @class_five, 500.00, 1, NULL, @tenant_id);
SET @student_gls_084 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_084, 8, 2026, 5000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-085', 'AHMED SALEH', @class_five, 0.00, 0, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_085 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_085, 8, 2026, 5000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-086', 'UMAIR WAJID', @class_five, 500.00, 1, NULL, @tenant_id);
SET @student_gls_086 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_086, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-087', 'REHMAT ULLAH', @class_five, 2500.00, 1, NULL, @tenant_id);
SET @student_gls_087 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-088', 'Uzair Zafar', @class_five, 500.00, 1, 'Previous Outstanding: Rs. 11,500', @tenant_id);
SET @student_gls_088 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-089', 'Muhammad Waqid', @class_five, 1500.00, 1, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_089 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_089, 8, 2026, 1000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-090', 'Ahmed Maqsood', @class_five, 500.00, 1, NULL, @tenant_id);
SET @student_gls_090 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_090, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-091', 'Muhammad Mahad', @class_five, 1000.00, 1, NULL, @tenant_id);
SET @student_gls_091 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_091, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-092', 'Sania Ibrahim', @class_five, 700.00, 1, 'Previous Outstanding: Rs. 1,800', @tenant_id);
SET @student_gls_092 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_092, 8, 2026, 1800.00, '2026-08-01');

-- =====================================
-- Class: Seven (Monthly Fee: 2500)
-- =====================================
INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES ('Seven', 2500, @tenant_id);
SET @class_seven = LAST_INSERT_ID();

INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-093', 'HASSAN ALI Majid', @class_seven, 0.00, 0, NULL, @tenant_id);
SET @student_gls_093 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_093, 8, 2026, 2500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-094', 'Zunaira Zameer', @class_seven, 2500.00, 1, NULL, @tenant_id);
SET @student_gls_094 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-095', 'Karishma Talha', @class_seven, 500.00, 1, NULL, @tenant_id);
SET @student_gls_095 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_095, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-096', 'Maliya Fatima', @class_seven, 1000.00, 1, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_096 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_096, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-097', 'Asma Qadeer', @class_seven, 1500.00, 1, 'Previous Outstanding: Rs. 3,800', @tenant_id);
SET @student_gls_097 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-098', 'AYESHA KHURRAM', @class_seven, 500.00, 1, 'Previous Outstanding: Rs. 12,500', @tenant_id);
SET @student_gls_098 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_098, 8, 2026, 5000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-099', 'Muhammad Ali', @class_seven, 0.00, 0, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_099 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_099, 8, 2026, 2500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-100', 'Abdul Rehman', @class_seven, 0.00, 0, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_100 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_100, 8, 2026, 2500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-101', 'NOOR UL AIN', @class_seven, 500.00, 1, 'Previous Outstanding: Rs. 2,000', @tenant_id);
SET @student_gls_101 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-102', 'Fatima Gull', @class_seven, 500.00, 1, 'Previous Outstanding: Rs. 3,600', @tenant_id);
SET @student_gls_102 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_102, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-103', 'Muhammad Faizan', @class_seven, 500.00, 1, 'Previous Outstanding: Rs. 5,400', @tenant_id);
SET @student_gls_103 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-104', 'Ayman Tabraiz', @class_seven, 500.00, 1, NULL, @tenant_id);
SET @student_gls_104 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_104, 8, 2026, 2000.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-105', 'Isma Noor', @class_seven, 0.00, 0, 'Previous Outstanding: Rs. 3,000', @tenant_id);
SET @student_gls_105 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-106', 'Eman Fatima', @class_seven, 0.00, 0, 'Previous Outstanding: Rs. 2,500', @tenant_id);
SET @student_gls_106 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_106, 8, 2026, 2500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-107', 'Tayyab Jamil', @class_seven, 1000.00, 1, 'Previous Outstanding: Rs. 8,500', @tenant_id);
SET @student_gls_107 = LAST_INSERT_ID();
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_gls_107, 8, 2026, 1500.00, '2026-08-01');
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-108', 'Sherbano', @class_seven, 0.00, 0, 'Previous Outstanding: Rs. 11,500', @tenant_id);
SET @student_gls_108 = LAST_INSERT_ID();
INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, tenant_id) VALUES ('GLS-109', 'New Shoaib Stamp', @class_seven, 500.00, 1, NULL, @tenant_id);
SET @student_gls_109 = LAST_INSERT_ID();

COMMIT;
