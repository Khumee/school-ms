START TRANSACTION;

SET @tenant_id = (SELECT id FROM tenants WHERE subdomain = 'mis');

DELETE FROM fee_payments WHERE tenant_id = @tenant_id;


-- Student: Anaya Arshad (MIS-188) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-188' OR reg_no = 'MIS-188-2') AND name = 'Anaya Arshad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-188' OR reg_no = 'MIS-188-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-188', 'Anaya Arshad', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Zara Abbasi (MIS-260) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-260' OR reg_no = 'MIS-260-2') AND name = 'Zara Abbasi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-260' OR reg_no = 'MIS-260-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-260', 'Zara Abbasi', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Zain Abbasi (MIS-259) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-259' OR reg_no = 'MIS-259-2') AND name = 'Zain Abbasi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-259' OR reg_no = 'MIS-259-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-259', 'Zain Abbasi', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Hadir Mohaudin (MIS-258) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-258' OR reg_no = 'MIS-258-2') AND name = 'Hadir Mohaudin' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-258' OR reg_no = 'MIS-258-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-258', 'Hadir Mohaudin', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Sahrash Alam (MIS-253) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-253' OR reg_no = 'MIS-253-2') AND name = 'Sahrash Alam' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-253' OR reg_no = 'MIS-253-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-253', 'Sahrash Alam', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: M.Zohan (MIS-251) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-251' OR reg_no = 'MIS-251-2') AND name = 'M.Zohan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-251' OR reg_no = 'MIS-251-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-251', 'M.Zohan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Asim Bashir (MIS-247) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-247' OR reg_no = 'MIS-247-2') AND name = 'M.Asim Bashir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-247' OR reg_no = 'MIS-247-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-247', 'M.Asim Bashir', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Ismail Hassan (MIS-246) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-246' OR reg_no = 'MIS-246-2') AND name = 'M.Ismail Hassan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-246' OR reg_no = 'MIS-246-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-246', 'M.Ismail Hassan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: M.Adil (MIS-244) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-244' OR reg_no = 'MIS-244-2') AND name = 'M.Adil' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-244' OR reg_no = 'MIS-244-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-244', 'M.Adil', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1500.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1500.00, '2026-07-10', 1, 0.00, 0);

-- Student: Fatima Allah Ditta (MIS-239) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-239' OR reg_no = 'MIS-239-2') AND name = 'Fatima Allah Ditta' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-239' OR reg_no = 'MIS-239-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-239', 'Fatima Allah Ditta', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);

-- Student: M.Abubakar (MIS-218) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-218' OR reg_no = 'MIS-218-2') AND name = 'M.Abubakar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-218' OR reg_no = 'MIS-218-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-218', 'M.Abubakar', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Ramzan Awan (MIS-222) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-222' OR reg_no = 'MIS-222-2') AND name = 'Ramzan Awan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-222' OR reg_no = 'MIS-222-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-222', 'Ramzan Awan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 3000.00, '2026-03-10', 1, 0.00, 0);

-- Student: Zunaira awan (MIS-223) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-223' OR reg_no = 'MIS-223-2') AND name = 'Zunaira awan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-223' OR reg_no = 'MIS-223-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-223', 'Zunaira awan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 4000.00, '2026-03-10', 1, 0.00, 0);

-- Student: M-Rohan (MIS-232) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-232' OR reg_no = 'MIS-232-2') AND name = 'M-Rohan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-232' OR reg_no = 'MIS-232-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-232', 'M-Rohan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 3000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 3000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Sajjad Ali (MIS-262) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-262' OR reg_no = 'MIS-262-2') AND name = 'Sajjad Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-262' OR reg_no = 'MIS-262-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-262', 'Sajjad Ali', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 4000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Saif ullah (MIS-268) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-268' OR reg_no = 'MIS-268-2') AND name = 'Saif ullah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-268' OR reg_no = 'MIS-268-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-268', 'Saif ullah', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: M.Arshamaan (MIS-267) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-267' OR reg_no = 'MIS-267-2') AND name = 'M.Arshamaan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-267' OR reg_no = 'MIS-267-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-267', 'M.Arshamaan', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Amina Qamar (MIS-265) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-265' OR reg_no = 'MIS-265-2') AND name = 'Amina Qamar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-265' OR reg_no = 'MIS-265-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-265', 'Amina Qamar', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Ansaar Ahmed (MIS-264) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-264' OR reg_no = 'MIS-264-2') AND name = 'Ansaar Ahmed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-264' OR reg_no = 'MIS-264-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-264', 'Ansaar Ahmed', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2000.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Fatima Shahid (MIS-269) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-269' OR reg_no = 'MIS-269-2') AND name = 'Fatima Shahid' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-269' OR reg_no = 'MIS-269-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-269', 'Fatima Shahid', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Arman (MIS-257) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-257' OR reg_no = 'MIS-257-2') AND name = 'M.Arman' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-257' OR reg_no = 'MIS-257-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-257', 'M.Arman', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 750.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 750.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 750.00, '2026-05-10', 1, 0.00, 0);

-- Student: Irtaza Ali (MIS-277) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-277' OR reg_no = 'MIS-277-2') AND name = 'Irtaza Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-277' OR reg_no = 'MIS-277-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-277', 'Irtaza Ali', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-05-10', 1, 0.00, 0);

-- Student: Zarish Abbasi (MIS-279) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-279' OR reg_no = 'MIS-279-2') AND name = 'Zarish Abbasi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-279' OR reg_no = 'MIS-279-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-279', 'Zarish Abbasi', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 500.00, '2026-04-10', 1, 0.00, 0);

-- Student: Muskan Sanawar (MIS-281) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-281' OR reg_no = 'MIS-281-2') AND name = 'Muskan Sanawar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-281' OR reg_no = 'MIS-281-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-281', 'Muskan Sanawar', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Sumiya Noor (MIS-282) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-282' OR reg_no = 'MIS-282-2') AND name = 'Sumiya Noor' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-282' OR reg_no = 'MIS-282-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-282', 'Sumiya Noor', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Urwa kamran (MIS-272) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-272' OR reg_no = 'MIS-272-2') AND name = 'Urwa kamran' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-272' OR reg_no = 'MIS-272-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-272', 'Urwa kamran', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Zunaira (MIS-283) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-283' OR reg_no = 'MIS-283-2') AND name = 'Zunaira' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-283' OR reg_no = 'MIS-283-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-283', 'Zunaira', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Abdul wahab (MIS-275) in Play Group
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-275' OR reg_no = 'MIS-275-2') AND name = 'Abdul wahab' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-275' OR reg_no = 'MIS-275-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-275', 'Abdul wahab', (SELECT id FROM classes WHERE name = 'Play Group' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2000.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Areez Irfan (MIS-201) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-201' OR reg_no = 'MIS-201-2') AND name = 'M.Areez Irfan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-201' OR reg_no = 'MIS-201-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-201', 'M.Areez Irfan', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-05-10', 1, 0.00, 0);

-- Student: Muhammad Ahmad (MIS-211) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-211' OR reg_no = 'MIS-211-2') AND name = 'Muhammad Ahmad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-211' OR reg_no = 'MIS-211-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-211', 'Muhammad Ahmad', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2000.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Usman Sabeel (MIS-209) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-209' OR reg_no = 'MIS-209-2') AND name = 'M.Usman Sabeel' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-209' OR reg_no = 'MIS-209-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-209', 'M.Usman Sabeel', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2200.00, '2026-06-10', 1, 0.00, 0);

-- Student: M.Mustafa (MIS-195) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-195' OR reg_no = 'MIS-195-2') AND name = 'M.Mustafa' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-195' OR reg_no = 'MIS-195-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-195', 'M.Mustafa', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2400.00, '2026-05-10', 1, 0.00, 0);

-- Student: Abdul Rafy Sheraz (MIS-202) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-202' OR reg_no = 'MIS-202-2') AND name = 'Abdul Rafy Sheraz' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-202' OR reg_no = 'MIS-202-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-202', 'Abdul Rafy Sheraz', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Hamad (MIS-245) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-245' OR reg_no = 'MIS-245-2') AND name = 'Hamad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-245' OR reg_no = 'MIS-245-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-245', 'Hamad', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Eshal Malik (MIS-221) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-221' OR reg_no = 'MIS-221-2') AND name = 'Eshal Malik' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-221' OR reg_no = 'MIS-221-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-221', 'Eshal Malik', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 5000.00, '2026-03-10', 1, 0.00, 0);

-- Student: Hassan naveed (MIS-215) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-215' OR reg_no = 'MIS-215-2') AND name = 'Hassan naveed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-215' OR reg_no = 'MIS-215-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-215', 'Hassan naveed', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Taha (MIS-263) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-263' OR reg_no = 'MIS-263-2') AND name = 'M.Taha' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-263' OR reg_no = 'MIS-263-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-263', 'M.Taha', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1200.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1200.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1200.00, '2026-07-10', 1, 0.00, 0);

-- Student: Ismail (MIS-127) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-127' OR reg_no = 'MIS-127-2') AND name = 'Ismail' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-127' OR reg_no = 'MIS-127-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-127', 'Ismail', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Shahzaib Abbasi (MIS-280) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-280' OR reg_no = 'MIS-280-2') AND name = 'Shahzaib Abbasi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-280' OR reg_no = 'MIS-280-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-280', 'Shahzaib Abbasi', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Abbas Khan (MIS-270) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-270' OR reg_no = 'MIS-270-2') AND name = 'Abbas Khan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-270' OR reg_no = 'MIS-270-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-270', 'Abbas Khan', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 6200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Hurain Kamran (MIS-273) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-273' OR reg_no = 'MIS-273-2') AND name = 'Hurain Kamran' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-273' OR reg_no = 'MIS-273-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-273', 'Hurain Kamran', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Horia Qadir (MIS-274) in Nursery class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-274' OR reg_no = 'MIS-274-2') AND name = 'Horia Qadir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-274' OR reg_no = 'MIS-274-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-274', 'Horia Qadir', (SELECT id FROM classes WHERE name = 'Nursery class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Hadia nadeem balouch (MIS-234) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-234' OR reg_no = 'MIS-234-2') AND name = 'Hadia nadeem balouch' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-234' OR reg_no = 'MIS-234-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-234', 'Hadia nadeem balouch', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 6000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 4000.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Muhammad Ahmad Ali (MIS-190) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-190' OR reg_no = 'MIS-190-2') AND name = 'Muhammad Ahmad Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-190' OR reg_no = 'MIS-190-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-190', 'Muhammad Ahmad Ali', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1200.00, '2026-05-10', 1, 0.00, 0);

-- Student: Hafsa Rafaqat (MIS-180) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-180' OR reg_no = 'MIS-180-2') AND name = 'Hafsa Rafaqat' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-180' OR reg_no = 'MIS-180-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-180', 'Hafsa Rafaqat', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1600.00, '2026-07-10', 1, 0.00, 0);

-- Student: Umme Salmah (MIS-181) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-181' OR reg_no = 'MIS-181-2') AND name = 'Umme Salmah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-181' OR reg_no = 'MIS-181-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-181', 'Umme Salmah', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 4500.00, '2026-05-10', 1, 0.00, 0);

-- Student: Abdul Ahad (MIS-182) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-182' OR reg_no = 'MIS-182-2') AND name = 'Abdul Ahad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-182' OR reg_no = 'MIS-182-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-182', 'Abdul Ahad', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1200.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1300.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1300.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1300.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1300.00, '2026-06-10', 1, 0.00, 0);

-- Student: Ibraheem Abid (MIS-173) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-173' OR reg_no = 'MIS-173-2') AND name = 'Ibraheem Abid' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-173' OR reg_no = 'MIS-173-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-173', 'Ibraheem Abid', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2000.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Aimal Sahar (MIS-169) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-169' OR reg_no = 'MIS-169-2') AND name = 'Aimal Sahar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-169' OR reg_no = 'MIS-169-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-169', 'Aimal Sahar', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 3400.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1700.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1800.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1800.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1800.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Qasim (MIS-172) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-172' OR reg_no = 'MIS-172-2') AND name = 'M.Qasim' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-172' OR reg_no = 'MIS-172-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-172', 'M.Qasim', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Insha Javed (MIS-165) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-165' OR reg_no = 'MIS-165-2') AND name = 'Insha Javed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-165' OR reg_no = 'MIS-165-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-165', 'Insha Javed', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 600.00, '2026-06-10', 1, 0.00, 0);

-- Student: Jalal Nazakat (MIS-142) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-142' OR reg_no = 'MIS-142-2') AND name = 'Jalal Nazakat' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-142' OR reg_no = 'MIS-142-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-142', 'Jalal Nazakat', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Rameen Fatima (MIS-204) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-204' OR reg_no = 'MIS-204-2') AND name = 'Rameen Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-204' OR reg_no = 'MIS-204-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-204', 'Rameen Fatima', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 4500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: khansa (MIS-255) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-255' OR reg_no = 'MIS-255-2') AND name = 'khansa' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-255' OR reg_no = 'MIS-255-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-255', 'khansa', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Abdul wahab Nadeem (MIS-162) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-162' OR reg_no = 'MIS-162-2') AND name = 'Abdul wahab Nadeem' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-162' OR reg_no = 'MIS-162-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-162', 'Abdul wahab Nadeem', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 11400.00, '2026-05-10', 1, 0.00, 0);

-- Student: Anaya Zubair (MIS-233) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-233' OR reg_no = 'MIS-233-2') AND name = 'Anaya Zubair' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-233' OR reg_no = 'MIS-233-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-233', 'Anaya Zubair', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 3000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Ali Hassan (MIS-227) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-227' OR reg_no = 'MIS-227-2') AND name = 'Ali Hassan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-227' OR reg_no = 'MIS-227-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-227', 'Ali Hassan', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: M.Murtaza (MIS-225) in Prep Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-225' OR reg_no = 'MIS-225-2') AND name = 'M.Murtaza' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-225' OR reg_no = 'MIS-225-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-225', 'M.Murtaza', (SELECT id FROM classes WHERE name = 'Prep Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 6000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 6000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Fariya Qadir (No Reg) in One Class
SET @student_id = (SELECT id FROM students WHERE name = 'Fariya Qadir' AND tenant_id = @tenant_id LIMIT 1);
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT NULL, 'Fariya Qadir', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Muhammad Ammar (MIS-191) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-191' OR reg_no = 'MIS-191-2') AND name = 'Muhammad Ammar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-191' OR reg_no = 'MIS-191-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-191', 'Muhammad Ammar', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: M.Arham (MIS-186) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-186' OR reg_no = 'MIS-186-2') AND name = 'M.Arham' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-186' OR reg_no = 'MIS-186-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-186', 'M.Arham', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 3200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1600.00, '2026-07-10', 1, 0.00, 0);

-- Student: Bisma Javed (MIS-166) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-166' OR reg_no = 'MIS-166-2') AND name = 'Bisma Javed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-166' OR reg_no = 'MIS-166-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-166', 'Bisma Javed', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 600.00, '2026-06-10', 1, 0.00, 0);

-- Student: Arahm zeeshan (MIS-177) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-177' OR reg_no = 'MIS-177-2') AND name = 'Arahm zeeshan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-177' OR reg_no = 'MIS-177-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-177', 'Arahm zeeshan', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Meesam Abbas (MIS-098) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-098' OR reg_no = 'MIS-098-2') AND name = 'Meesam Abbas' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-098' OR reg_no = 'MIS-098-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-098', 'Meesam Abbas', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Ubaid Ullah (MIS-161) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-161' OR reg_no = 'MIS-161-2') AND name = 'Ubaid Ullah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-161' OR reg_no = 'MIS-161-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-161', 'Ubaid Ullah', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Reham Gull (MIS-119) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-119' OR reg_no = 'MIS-119-2') AND name = 'Reham Gull' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-119' OR reg_no = 'MIS-119-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-119', 'Reham Gull', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Tayyab (MIS-081) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-081' OR reg_no = 'MIS-081-2') AND name = 'Tayyab' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-081' OR reg_no = 'MIS-081-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-081', 'Tayyab', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 600.00, '2026-06-10', 1, 0.00, 0);

-- Student: Sumaya Gull (MIS-094) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-094' OR reg_no = 'MIS-094-2') AND name = 'Sumaya Gull' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-094' OR reg_no = 'MIS-094-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-094', 'Sumaya Gull', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Tayyaba Naveed (MIS-082) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-082' OR reg_no = 'MIS-082-2') AND name = 'Tayyaba Naveed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-082' OR reg_no = 'MIS-082-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-082', 'Tayyaba Naveed', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 500.00, '2026-04-10', 1, 0.00, 0);

-- Student: Hareem Fatima (MIS-203) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-203' OR reg_no = 'MIS-203-2') AND name = 'Hareem Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-203' OR reg_no = 'MIS-203-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-203', 'Hareem Fatima', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 4500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Khulood (MIS-254) in One Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-254' OR reg_no = 'MIS-254-2') AND name = 'Khulood' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-254' OR reg_no = 'MIS-254-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-254', 'Khulood', (SELECT id FROM classes WHERE name = 'One Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Zara amin (MIS-196) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-196' OR reg_no = 'MIS-196-2') AND name = 'Zara amin' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-196' OR reg_no = 'MIS-196-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-196', 'Zara amin', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 4000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 3000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Muhammad Yahya (MIS-200) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-200' OR reg_no = 'MIS-200-2') AND name = 'Muhammad Yahya' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-200' OR reg_no = 'MIS-200-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-200', 'Muhammad Yahya', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: M.Azan (MIS-185) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-185' OR reg_no = 'MIS-185-2') AND name = 'M.Azan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-185' OR reg_no = 'MIS-185-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-185', 'M.Azan', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 3200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1600.00, '2026-07-10', 1, 0.00, 0);

-- Student: Fahad Nadeem (MIS-156) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-156' OR reg_no = 'MIS-156-2') AND name = 'Fahad Nadeem' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-156' OR reg_no = 'MIS-156-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-156', 'Fahad Nadeem', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 4200.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 9000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Noor Zahra (MIS-155) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-155' OR reg_no = 'MIS-155-2') AND name = 'Noor Zahra' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-155' OR reg_no = 'MIS-155-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-155', 'Noor Zahra', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1600.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-06-10', 1, 0.00, 0);

-- Student: Samiullah (MIS-159) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-159' OR reg_no = 'MIS-159-2') AND name = 'Samiullah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-159' OR reg_no = 'MIS-159-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-159', 'Samiullah', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1500.00, '2026-06-10', 1, 0.00, 0);

-- Student: Aiman Nazakat (MIS-115) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-115' OR reg_no = 'MIS-115-2') AND name = 'Aiman Nazakat' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-115' OR reg_no = 'MIS-115-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-115', 'Aiman Nazakat', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);

-- Student: Azab Shahzad (MIS-105) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-105' OR reg_no = 'MIS-105-2') AND name = 'Azab Shahzad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-105' OR reg_no = 'MIS-105-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-105', 'Azab Shahzad', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Hadir Ali (MIS-112) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-112' OR reg_no = 'MIS-112-2') AND name = 'Hadir Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-112' OR reg_no = 'MIS-112-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-112', 'Hadir Ali', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1400.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1400.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1400.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Farhan (MIS-134) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-134' OR reg_no = 'MIS-134-2') AND name = 'M.Farhan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-134' OR reg_no = 'MIS-134-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-134', 'M.Farhan', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1200.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2400.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1500.00, '2026-06-10', 1, 0.00, 0);

-- Student: Nayab Fatima (MIS-100) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-100' OR reg_no = 'MIS-100-2') AND name = 'Nayab Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-100' OR reg_no = 'MIS-100-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-100', 'Nayab Fatima', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2400.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 3600.00, '2026-03-10', 1, 0.00, 0);

-- Student: Sila (MIS-096) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-096' OR reg_no = 'MIS-096-2') AND name = 'Sila' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-096' OR reg_no = 'MIS-096-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-096', 'Sila', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Muqadas (MIS-124) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-124' OR reg_no = 'MIS-124-2') AND name = 'Muqadas' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-124' OR reg_no = 'MIS-124-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-124', 'Muqadas', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Rabia (MIS-125) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-125' OR reg_no = 'MIS-125-2') AND name = 'Rabia' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-125' OR reg_no = 'MIS-125-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-125', 'Rabia', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 200.00, '2026-02-10', 1, 0.00, 0);

-- Student: Fabiha Fatima (MIS-124) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-124' OR reg_no = 'MIS-124-2') AND name = 'Fabiha Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-124' OR reg_no = 'MIS-124-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-124', 'Fabiha Fatima', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2100.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);

-- Student: Ayat Zahra (MIS-126) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-126' OR reg_no = 'MIS-126-2') AND name = 'Ayat Zahra' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-126' OR reg_no = 'MIS-126-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-126', 'Ayat Zahra', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 3400.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1700.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1800.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1800.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1800.00, '2026-05-10', 1, 0.00, 0);

-- Student: Alishba (MIS-256) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-256' OR reg_no = 'MIS-256-2') AND name = 'Alishba' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-256' OR reg_no = 'MIS-256-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-256', 'Alishba', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 750.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 750.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 750.00, '2026-05-10', 1, 0.00, 0);

-- Student: Hadir Ali (MIS-216) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-216' OR reg_no = 'MIS-216-2') AND name = 'Hadir Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-216' OR reg_no = 'MIS-216-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-216', 'Hadir Ali', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 2, 2026, 0.00, '2026-02-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Fariha Gull (MIS-261) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-261' OR reg_no = 'MIS-261-2') AND name = 'Fariha Gull' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-261' OR reg_no = 'MIS-261-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-261', 'Fariha Gull', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Shahzain (MIS-248) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-248' OR reg_no = 'MIS-248-2') AND name = 'Shahzain' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-248' OR reg_no = 'MIS-248-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-248', 'Shahzain', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 2, 2026, 0.00, '2026-02-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);

-- Student: Abdul Hadi Mir (MIS-224) in Two Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-224' OR reg_no = 'MIS-224-2') AND name = 'Abdul Hadi Mir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-224' OR reg_no = 'MIS-224-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-224', 'Abdul Hadi Mir', (SELECT id FROM classes WHERE name = 'Two Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 14000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 4000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Aysha Abbas (MIS-217) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-217' OR reg_no = 'MIS-217-2') AND name = 'Aysha Abbas' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-217' OR reg_no = 'MIS-217-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-217', 'Aysha Abbas', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1500.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1500.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1500.00, '2026-05-10', 1, 0.00, 0);

-- Student: Sulman Arshad (MIS-189) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-189' OR reg_no = 'MIS-189-2') AND name = 'Sulman Arshad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-189' OR reg_no = 'MIS-189-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-189', 'Sulman Arshad', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: M.Hussain (MIS-104) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-104' OR reg_no = 'MIS-104-2') AND name = 'M.Hussain' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-104' OR reg_no = 'MIS-104-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-104', 'M.Hussain', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1500.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1600.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1600.00, '2026-06-10', 1, 0.00, 0);

-- Student: Arham Abbasi (MIS-091) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-091' OR reg_no = 'MIS-091-2') AND name = 'Arham Abbasi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-091' OR reg_no = 'MIS-091-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-091', 'Arham Abbasi', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 4000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 4000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Minahil Naveed (MIS-082) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-082' OR reg_no = 'MIS-082-2') AND name = 'Minahil Naveed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-082' OR reg_no = 'MIS-082-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-082', 'Minahil Naveed', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1400.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1400.00, '2026-04-10', 1, 0.00, 0);

-- Student: Ayat Noor (MIS-067) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-067' OR reg_no = 'MIS-067-2') AND name = 'Ayat Noor' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-067' OR reg_no = 'MIS-067-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-067', 'Ayat Noor', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1700.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2100.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 4900.00, '2026-06-10', 1, 0.00, 0);

-- Student: Tehzeeb Shakir (MIS-102) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-102' OR reg_no = 'MIS-102-2') AND name = 'Tehzeeb Shakir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-102' OR reg_no = 'MIS-102-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-102', 'Tehzeeb Shakir', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 1100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Haya Shakir (MIS-103) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-103' OR reg_no = 'MIS-103-2') AND name = 'Haya Shakir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-103' OR reg_no = 'MIS-103-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-103', 'Haya Shakir', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 4200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2100.00, '2026-06-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 2100.00, '2026-07-10', 1, 0.00, 0);

-- Student: Abdul Rafay (MIS-084) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-084' OR reg_no = 'MIS-084-2') AND name = 'Abdul Rafay' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-084' OR reg_no = 'MIS-084-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-084', 'Abdul Rafay', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 4000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Huzefa Nawaz (MIS-078) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-078' OR reg_no = 'MIS-078-2') AND name = 'Huzefa Nawaz' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-078' OR reg_no = 'MIS-078-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-078', 'Huzefa Nawaz', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 3000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Mohsin Ali (MIS-075) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-075' OR reg_no = 'MIS-075-2') AND name = 'Mohsin Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-075' OR reg_no = 'MIS-075-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-075', 'Mohsin Ali', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: wahib Ali (MIS-079) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-079' OR reg_no = 'MIS-079-2') AND name = 'wahib Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-079' OR reg_no = 'MIS-079-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-079', 'wahib Ali', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);

-- Student: Aysha Gull (MIS-041) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-041' OR reg_no = 'MIS-041-2') AND name = 'Aysha Gull' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-041' OR reg_no = 'MIS-041-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-041', 'Aysha Gull', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Mubashir (MIS-117) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-117' OR reg_no = 'MIS-117-2') AND name = 'Mubashir' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-117' OR reg_no = 'MIS-117-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-117', 'Mubashir', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Saima (MIS-278) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-278' OR reg_no = 'MIS-278-2') AND name = 'Saima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-278' OR reg_no = 'MIS-278-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-278', 'Saima', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Abdullah (MIS-130) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-130' OR reg_no = 'MIS-130-2') AND name = 'Abdullah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-130' OR reg_no = 'MIS-130-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-130', 'Abdullah', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Abdul Hanan (MIS-065) in Three Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-065' OR reg_no = 'MIS-065-2') AND name = 'Abdul Hanan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-065' OR reg_no = 'MIS-065-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-065', 'Abdul Hanan', (SELECT id FROM classes WHERE name = 'Three Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: M.Sufiyan (MIS-230) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-230' OR reg_no = 'MIS-230-2') AND name = 'M.Sufiyan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-230' OR reg_no = 'MIS-230-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-230', 'M.Sufiyan', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 3000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Afia (MIS-192) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-192' OR reg_no = 'MIS-192-2') AND name = 'Afia' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-192' OR reg_no = 'MIS-192-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-192', 'Afia', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Zainab Noor (MIS-080) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-080' OR reg_no = 'MIS-080-2') AND name = 'Zainab Noor' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-080' OR reg_no = 'MIS-080-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-080', 'Zainab Noor', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 3000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 5000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2200.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1100.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 1100.00, '2026-06-10', 1, 0.00, 0);

-- Student: Arooj Fatima (MIS-099) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-099' OR reg_no = 'MIS-099-2') AND name = 'Arooj Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-099' OR reg_no = 'MIS-099-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-099', 'Arooj Fatima', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2400.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2400.00, '2026-03-10', 1, 0.00, 0);

-- Student: Alisbah (MIS-093) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-093' OR reg_no = 'MIS-093-2') AND name = 'Alisbah' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-093' OR reg_no = 'MIS-093-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-093', 'Alisbah', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Hassam (MIS-131) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-131' OR reg_no = 'MIS-131-2') AND name = 'Hassam' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-131' OR reg_no = 'MIS-131-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-131', 'Hassam', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Isra (MIS-054) in Fourth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-054' OR reg_no = 'MIS-054-2') AND name = 'Isra' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-054' OR reg_no = 'MIS-054-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-054', 'Isra', (SELECT id FROM classes WHERE name = 'Fourth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Hadiya bibi (MIS-023) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-023' OR reg_no = 'MIS-023-2') AND name = 'Hadiya bibi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-023' OR reg_no = 'MIS-023-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-023', 'Hadiya bibi', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Hadia Nadeem (MIS-158) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-158' OR reg_no = 'MIS-158-2') AND name = 'Hadia Nadeem' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-158' OR reg_no = 'MIS-158-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-158', 'Hadia Nadeem', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 10800.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 3600.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Anwar (MIS-068) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-068' OR reg_no = 'MIS-068-2') AND name = 'M.Anwar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-068' OR reg_no = 'MIS-068-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-068', 'M.Anwar', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1700.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 3450.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1700.00, '2026-05-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 7, 2026, 3500.00, '2026-07-10', 1, 0.00, 0);

-- Student: Ariba Nazakat (MIS-030) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-030' OR reg_no = 'MIS-030-2') AND name = 'Ariba Nazakat' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-030' OR reg_no = 'MIS-030-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-030', 'Ariba Nazakat', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Fizza Saleem (MIS-074) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-074' OR reg_no = 'MIS-074-2') AND name = 'Fizza Saleem' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-074' OR reg_no = 'MIS-074-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-074', 'Fizza Saleem', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Aliza Arshad (MIS-271) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-271' OR reg_no = 'MIS-271-2') AND name = 'Aliza Arshad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-271' OR reg_no = 'MIS-271-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-271', 'Aliza Arshad', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1600.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1600.00, '2026-05-10', 1, 0.00, 0);

-- Student: Ali Raza (MIS-130) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-130' OR reg_no = 'MIS-130-2') AND name = 'Ali Raza' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-130' OR reg_no = 'MIS-130-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-130', 'Ali Raza', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: M.Ahmed Raz (MIS-113) in Fifth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-113' OR reg_no = 'MIS-113-2') AND name = 'M.Ahmed Raz' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-113' OR reg_no = 'MIS-113-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-113', 'M.Ahmed Raz', (SELECT id FROM classes WHERE name = 'Fifth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Aafia Bibi (MIS-116) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-116' OR reg_no = 'MIS-116-2') AND name = 'Aafia Bibi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-116' OR reg_no = 'MIS-116-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-116', 'Aafia Bibi', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Maira Afzal (MIS-022) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-022' OR reg_no = 'MIS-022-2') AND name = 'Maira Afzal' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-022' OR reg_no = 'MIS-022-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-022', 'Maira Afzal', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 2, 2026, 0.00, '2026-02-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Tayyaba Faial (MIS-020) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-020' OR reg_no = 'MIS-020-2') AND name = 'Tayyaba Faial' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-020' OR reg_no = 'MIS-020-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-020', 'Tayyaba Faial', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 300.00, '2026-02-10', 1, 0.00, 0);

-- Student: Tayyaba Fatima (MIS-129) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-129' OR reg_no = 'MIS-129-2') AND name = 'Tayyaba Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-129' OR reg_no = 'MIS-129-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-129', 'Tayyaba Fatima', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 1000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Amna Nazakat (MIS-029) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-029' OR reg_no = 'MIS-029-2') AND name = 'Amna Nazakat' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-029' OR reg_no = 'MIS-029-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-029', 'Amna Nazakat', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');

-- Student: Nayab Ali (MIS-146) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-146' OR reg_no = 'MIS-146-2') AND name = 'Nayab Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-146' OR reg_no = 'MIS-146-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-146', 'Nayab Ali', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-01-10', 1, 0.00, 0);

-- Student: Ayesha Qadar (MIS-050) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-050' OR reg_no = 'MIS-050-2') AND name = 'Ayesha Qadar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-050' OR reg_no = 'MIS-050-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-050', 'Ayesha Qadar', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 0.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 1000.00, '2026-04-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 1000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Hoorum Batool (MIS-028) in Sixth Class
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-028' OR reg_no = 'MIS-028-2') AND name = 'Hoorum Batool' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-028' OR reg_no = 'MIS-028-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-028', 'Hoorum Batool', (SELECT id FROM classes WHERE name = 'Sixth Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2100.00, '2026-05-10', 1, 0.00, 0);

-- Student: Muhammad Sadique (MIS-012) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-012' OR reg_no = 'MIS-012-2') AND name = 'Muhammad Sadique' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-012' OR reg_no = 'MIS-012-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-012', 'Muhammad Sadique', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Muhammad Umer (MIS-021) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-021' OR reg_no = 'MIS-021-2') AND name = 'Muhammad Umer' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-021' OR reg_no = 'MIS-021-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-021', 'Muhammad Umer', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Abdullah Saleem (MIS-026) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-026' OR reg_no = 'MIS-026-2') AND name = 'Abdullah Saleem' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-026' OR reg_no = 'MIS-026-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-026', 'Abdullah Saleem', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Muhammad Rayan Atif (MIS-028) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-028' OR reg_no = 'MIS-028-2') AND name = 'Muhammad Rayan Atif' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-028' OR reg_no = 'MIS-028-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-028', 'Muhammad Rayan Atif', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Abad Khan (MIS-035) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-035' OR reg_no = 'MIS-035-2') AND name = 'Abad Khan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-035' OR reg_no = 'MIS-035-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-035', 'Abad Khan', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Adil (MIS-039) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-039' OR reg_no = 'MIS-039-2') AND name = 'Adil' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-039' OR reg_no = 'MIS-039-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-039', 'Adil', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());

-- Student: Mukaram (MIS-041) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-041' OR reg_no = 'MIS-041-2') AND name = 'Mukaram' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-041' OR reg_no = 'MIS-041-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-041', 'Mukaram', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);

-- Student: Rahmat ali (MIS-042) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-042' OR reg_no = 'MIS-042-2') AND name = 'Rahmat ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-042' OR reg_no = 'MIS-042-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-042', 'Rahmat ali', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);

-- Student: Abdul Manan (MIS-043) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-043' OR reg_no = 'MIS-043-2') AND name = 'Abdul Manan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-043' OR reg_no = 'MIS-043-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-043', 'Abdul Manan', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 1000.00, '2026-03-10', 1, 0.00, 0);

-- Student: M.Ahmed Nisar (MIS-044) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-044' OR reg_no = 'MIS-044-2') AND name = 'M.Ahmed Nisar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-044' OR reg_no = 'MIS-044-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-044', 'M.Ahmed Nisar', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);

-- Student: M.Azaan Nisar (MIS-045) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-045' OR reg_no = 'MIS-045-2') AND name = 'M.Azaan Nisar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-045' OR reg_no = 'MIS-045-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-045', 'M.Azaan Nisar', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 3, 2026, 2000.00, '2026-03-10', 1, 0.00, 0);

-- Student: M.Ali (MIS-046) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-046' OR reg_no = 'MIS-046-2') AND name = 'M.Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-046' OR reg_no = 'MIS-046-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-046', 'M.Ali', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Shahzain (MIS-047) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-047' OR reg_no = 'MIS-047-2') AND name = 'M.Shahzain' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-047' OR reg_no = 'MIS-047-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-047', 'M.Shahzain', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Roman Ahmed (MIS-048) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-048' OR reg_no = 'MIS-048-2') AND name = 'Roman Ahmed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-048' OR reg_no = 'MIS-048-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-048', 'Roman Ahmed', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Wahaj Ahmed (MIS-049) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-049' OR reg_no = 'MIS-049-2') AND name = 'Wahaj Ahmed' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-049' OR reg_no = 'MIS-049-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-049', 'Wahaj Ahmed', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Mujtaba (MIS-050) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-050' OR reg_no = 'MIS-050-2') AND name = 'M.Mujtaba' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-050' OR reg_no = 'MIS-050-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-050', 'M.Mujtaba', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Ahsan Rizwan (MIS-051) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-051' OR reg_no = 'MIS-051-2') AND name = 'Ahsan Rizwan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-051' OR reg_no = 'MIS-051-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-051', 'Ahsan Rizwan', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: M.Azan (MIS-052) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-052' OR reg_no = 'MIS-052-2') AND name = 'M.Azan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-052' OR reg_no = 'MIS-052-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-052', 'M.Azan', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Abdul Ghani (MIS-053) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-053' OR reg_no = 'MIS-053-2') AND name = 'Abdul Ghani' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-053' OR reg_no = 'MIS-053-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-053', 'Abdul Ghani', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 4, 2026, 2000.00, '2026-04-10', 1, 0.00, 0);

-- Student: Muhammad (MIS-054) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-054' OR reg_no = 'MIS-054-2') AND name = 'Muhammad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-054' OR reg_no = 'MIS-054-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-054', 'Muhammad', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 5, 2026, 2000.00, '2026-05-10', 1, 0.00, 0);

-- Student: Abdul hadi (MIS-055) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-055' OR reg_no = 'MIS-055-2') AND name = 'Abdul hadi' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-055' OR reg_no = 'MIS-055-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-055', 'Abdul hadi', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Saalar (MIS-056) in Hifz Department
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-056' OR reg_no = 'MIS-056-2') AND name = 'Saalar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-056' OR reg_no = 'MIS-056-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-056', 'Saalar', (SELECT id FROM classes WHERE name = 'Hifz Class' AND tenant_id = @tenant_id LIMIT 1), 'active', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 6, 2026, 2000.00, '2026-06-10', 1, 0.00, 0);

-- Student: Ibraheem Hasan (MIS-171) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-171' OR reg_no = 'MIS-171-2') AND name = 'Ibraheem Hasan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-171' OR reg_no = 'MIS-171-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-171', 'Ibraheem Hasan', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Safa Sabeel (MIS-132) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-132' OR reg_no = 'MIS-132-2') AND name = 'Safa Sabeel' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-132' OR reg_no = 'MIS-132-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-132', 'Safa Sabeel', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Umair Ch. (MIS-122) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-122' OR reg_no = 'MIS-122-2') AND name = 'Umair Ch.' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-122' OR reg_no = 'MIS-122-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-122', 'Umair Ch.', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Rahmat Ali (MIS-235) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-235' OR reg_no = 'MIS-235-2') AND name = 'Rahmat Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-235' OR reg_no = 'MIS-235-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-235', 'Rahmat Ali', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Muhammad Saad (MIS-193) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-193' OR reg_no = 'MIS-193-2') AND name = 'Muhammad Saad' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-193' OR reg_no = 'MIS-193-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-193', 'Muhammad Saad', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-01-10', 1, 0.00, 0);

-- Student: M.Ali (MIS-047) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-047' OR reg_no = 'MIS-047-2') AND name = 'M.Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-047' OR reg_no = 'MIS-047-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-047', 'M.Ali', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2300.00, '2026-02-10', 1, 0.00, 0);

-- Student: Ahmad Hassan (MIS-121) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-121' OR reg_no = 'MIS-121-2') AND name = 'Ahmad Hassan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-121' OR reg_no = 'MIS-121-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-121', 'Ahmad Hassan', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Mukarram Khan (MIS-062) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-062' OR reg_no = 'MIS-062-2') AND name = 'Mukarram Khan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-062' OR reg_no = 'MIS-062-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-062', 'Mukarram Khan', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 4000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Abdul Mannan (MIS-066) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-066' OR reg_no = 'MIS-066-2') AND name = 'Abdul Mannan' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-066' OR reg_no = 'MIS-066-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-066', 'Abdul Mannan', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-01-10', 1, 0.00, 0);

-- Student: Shifa Zahra (MIS-213) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-213' OR reg_no = 'MIS-213-2') AND name = 'Shifa Zahra' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-213' OR reg_no = 'MIS-213-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-213', 'Shifa Zahra', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 5300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);

-- Student: M.Abubaker tanveer (MIS-226) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-226' OR reg_no = 'MIS-226-2') AND name = 'M.Abubaker tanveer' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-226' OR reg_no = 'MIS-226-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-226', 'M.Abubaker tanveer', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Usman Ghani (MIS-005) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-005' OR reg_no = 'MIS-005-2') AND name = 'Usman Ghani' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-005' OR reg_no = 'MIS-005-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-005', 'Usman Ghani', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 1800.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Eshal Mustafa (MIS-184) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-184' OR reg_no = 'MIS-184-2') AND name = 'Eshal Mustafa' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-184' OR reg_no = 'MIS-184-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-184', 'Eshal Mustafa', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 3300.00, '2026-01-10', 1, 0.00, 0);

-- Student: Urwah Ali (MIS-128) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-128' OR reg_no = 'MIS-128-2') AND name = 'Urwah Ali' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-128' OR reg_no = 'MIS-128-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-128', 'Urwah Ali', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 2000.00, '2026-02-10', 1, 0.00, 0);

-- Student: Hareem Zahra (MIS-059) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-059' OR reg_no = 'MIS-059-2') AND name = 'Hareem Zahra' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-059' OR reg_no = 'MIS-059-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-059', 'Hareem Zahra', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 4300.00, '2026-02-10', 1, 0.00, 0);

-- Student: Eshal Fatima (MIS-249) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-249' OR reg_no = 'MIS-249-2') AND name = 'Eshal Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-249' OR reg_no = 'MIS-249-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-249', 'Eshal Fatima', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 6300.00, '2026-01-10', 1, 0.00, 0);

-- Student: Eshal Fatima (MIS-228) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-228' OR reg_no = 'MIS-228-2') AND name = 'Eshal Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-228' OR reg_no = 'MIS-228-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-228', 'Eshal Fatima', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 300.00, '2026-02-10', 1, 0.00, 0);

-- Student: Mahnoor Fatima (MIS-229) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-229' OR reg_no = 'MIS-229-2') AND name = 'Mahnoor Fatima' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-229' OR reg_no = 'MIS-229-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-229', 'Mahnoor Fatima', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2000.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 300.00, '2026-02-10', 1, 0.00, 0);

-- Student: Arham Mustafa (MIS-183) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-183' OR reg_no = 'MIS-183-2') AND name = 'Arham Mustafa' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-183' OR reg_no = 'MIS-183-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-183', 'Arham Mustafa', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 2300.00, '2026-01-10', 1, 0.00, 0);

-- Student: Anaya Ansar (MIS-040) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-040' OR reg_no = 'MIS-040-2') AND name = 'Anaya Ansar' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-040' OR reg_no = 'MIS-040-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-040', 'Anaya Ansar', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 4800.00, '2026-01-10', 1, 0.00, 0);
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 2, 2026, 1500.00, '2026-02-10', 1, 0.00, 0);

-- Student: Shumaila (MIS-120) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-120' OR reg_no = 'MIS-120-2') AND name = 'Shumaila' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-120' OR reg_no = 'MIS-120-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-120', 'Shumaila', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-01-10', 1, 0.00, 0);

-- Student: M.Sohail (MIS-143) in SOS Children
SET @student_id = (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-143' OR reg_no = 'MIS-143-2') AND name = 'M.Sohail' LIMIT 1);
SET @student_id = COALESCE(@student_id, (SELECT id FROM students WHERE tenant_id = @tenant_id AND (reg_no = 'MIS-143' OR reg_no = 'MIS-143-2') LIMIT 1));
INSERT INTO students (reg_no, name, class_id, status, tenant_id) SELECT 'MIS-143', 'M.Sohail', NULL, 'left', @tenant_id WHERE @student_id IS NULL;
SET @student_id = COALESCE(@student_id, LAST_INSERT_ID());
UPDATE students SET status = 'left' WHERE id = @student_id;
INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived) VALUES (@tenant_id, @student_id, 1, 2026, 300.00, '2026-01-10', 1, 0.00, 0);

COMMIT;
