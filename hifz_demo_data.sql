-- Hifz Demo Data Script for Tenant 4
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM hifz_diary_entries WHERE tenant_id = 4;
DELETE FROM hifz_para_completions WHERE tenant_id = 4;
DELETE FROM hifz_waqaf_periods WHERE tenant_id = 4;

INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-22', 0, 'recited', 1, 12, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-23', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-24', 0, 'recited', 1, 17, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-25', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-26', 0, 'recited', 1, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-27', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-29', 0, 'recited', 1, 16, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-30', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2024-12-31', 0, 'recited', 1, 14, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-01', 0, 'recited', 1, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-02', 0, 'recited', 1, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-03', 0, 'recited', 1, 16, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-05', 0, 'recited', 1, 17, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-06', 0, 'recited', 1, 17, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-07', 0, 'recited', 1, 16, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-08', 0, 'recited', 1, 10, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-09', 0, 'recited', 1, 17, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-10', 0, 'recited', 1, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-01-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-13', 0, 'recited', 1, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-14', 0, 'recited', 1, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-15', 0, 'recited', 1, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 1, '2025-01-15', '2025-01-15', 'pass', 'Qari Ahmed', 0, 'Zabat: 42/50\nTajweed: 19/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 85/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-16', 0, 'recited', 2, 14, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-17', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-01-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-20', 0, 'recited', 2, 18, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-21', 0, 'recited', 2, 14, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-22', 0, 'recited', 2, 18, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-23', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-24', 0, 'recited', 2, 17, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-26', 0, 'recited', 2, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-27', 0, 'recited', 2, 11, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-28', 0, 'recited', 2, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-29', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-01-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-01-31', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-02', 0, 'recited', 2, 10, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-03', 0, 'recited', 2, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-04', 0, 'recited', 2, 15, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-05', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-06', 0, 'recited', 2, 17, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-07', 0, 'recited', 2, 10, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-09', 0, 'recited', 2, 14, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-10', 0, 'recited', 2, 11, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-11', 0, 'recited', 2, 16, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-12', 0, 'recited', 2, 18, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 2, '2025-02-12', '2025-02-12', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 18/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-13', 0, 'recited', 3, 17, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-14', 0, 'recited', 3, 16, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-16', 0, 'recited', 3, 14, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-17', 0, 'recited', 3, 13, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-18', 0, 'recited', 3, 17, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-19', 0, 'recited', 3, 13, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-02-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-21', 0, 'recited', 3, 10, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-23', 0, 'recited', 3, 12, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-24', 0, 'recited', 3, 18, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-25', 0, 'recited', 3, 12, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-26', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-27', 0, 'recited', 3, 17, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-02-28', 0, 'recited', 3, 13, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-02', 0, 'recited', 3, 11, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-03', 0, 'recited', 3, 10, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-04', 0, 'recited', 3, 14, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-05', 0, 'recited', 3, 16, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-06', 0, 'recited', 3, 16, 'needs_work', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-07', 0, 'recited', 3, 12, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-09', 0, 'recited', 3, 11, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-10', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-03-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-12', 0, 'recited', 3, 15, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 3, '2025-03-12', '2025-03-12', 'pass', 'Qari Ahmed', 1, 'Zabat: 42/50\nTajweed: 18/20\nLehja: 8/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-13', 0, 'recited', 4, 10, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-14', 0, 'recited', 4, 11, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-16', 0, 'recited', 4, 11, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-17', 0, 'recited', 4, 11, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-18', 0, 'recited', 4, 11, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-03-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-20', 0, 'recited', 4, 12, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-21', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-23', 0, 'recited', 4, 12, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-24', 0, 'recited', 4, 18, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-25', 0, 'recited', 4, 11, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-26', 0, 'recited', 4, 16, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-03-27', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-28', 0, 'recited', 4, 13, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-30', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-03-31', 0, 'recited', 4, 11, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-01', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-02', 0, 'recited', 4, 10, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-03', 0, 'recited', 4, 12, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-04', 0, 'recited', 4, 10, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-06', 0, 'recited', 4, 14, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-07', 0, 'recited', 4, 17, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-08', 0, 'recited', 4, 15, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-09', 0, 'recited', 4, 16, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-10', 0, 'recited', 4, 12, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 4, '2025-04-10', '2025-04-10', 'pass', 'Qari Ahmed', 1, 'Zabat: 49/50\nTajweed: 17/20\nLehja: 8/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-11', 0, 'recited', 5, 10, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-04-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-14', 0, 'recited', 5, 15, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-15', 0, 'recited', 5, 11, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-16', 0, 'recited', 5, 12, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-17', 0, 'recited', 5, 10, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-18', 0, 'recited', 5, 14, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-20', 0, 'recited', 5, 13, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-21', 0, 'recited', 5, 12, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-22', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-23', 0, 'recited', 5, 11, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-24', 0, 'recited', 5, 11, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-25', 0, 'recited', 5, 12, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-27', 0, 'recited', 5, 13, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-28', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-29', 0, 'recited', 5, 16, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-04-30', 0, 'recited', 5, 12, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-01', 0, 'recited', 5, 17, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-02', 0, 'recited', 5, 13, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-04', 0, 'recited', 5, 11, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-05', 0, 'recited', 5, 11, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-06', 0, 'recited', 5, 13, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-07', 0, 'recited', 5, 14, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-08', 0, 'recited', 5, 14, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-05-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-11', 0, 'recited', 5, 12, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 5, '2025-05-11', '2025-05-11', 'pass', 'Qari Uthman', 0, 'Zabat: 49/50\nTajweed: 15/20\nLehja: 9/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 92/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-12', 0, 'recited', 6, 11, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-05-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-14', 0, 'recited', 6, 18, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-15', 0, 'recited', 6, 11, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-16', 0, 'recited', 6, 13, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-18', 0, 'recited', 6, 18, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-19', 0, 'recited', 6, 10, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-20', 0, 'recited', 6, 10, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-21', 0, 'recited', 6, 12, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-22', 0, 'recited', 6, 15, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-23', 0, 'recited', 6, 11, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-25', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-26', 0, 'recited', 6, 16, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-27', 0, 'recited', 6, 17, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-05-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-29', 0, 'recited', 6, 15, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-05-30', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-01', 0, 'recited', 6, 14, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-02', 0, 'recited', 6, 17, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-03', 0, 'recited', 6, 17, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-04', 0, 'recited', 6, 15, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-05', 0, 'recited', 6, 18, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-06', 0, 'recited', 6, 15, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 6, '2025-06-06', '2025-06-06', 'pass', 'Qari Ahmed', 0, 'Zabat: 43/50\nTajweed: 16/20\nLehja: 9/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 85/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-08', 0, 'recited', 7, 13, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-09', 0, 'recited', 7, 18, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-10', 0, 'recited', 7, 18, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-11', 0, 'recited', 7, 15, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-12', 0, 'recited', 7, 12, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-13', 0, 'recited', 7, 10, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-15', 0, 'recited', 7, 10, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-16', 0, 'recited', 7, 17, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-17', 0, 'recited', 7, 16, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-18', 0, 'recited', 7, 16, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-19', 0, 'recited', 7, 13, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-20', 0, 'recited', 7, 14, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-22', 0, 'recited', 7, 11, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-23', 0, 'recited', 7, 16, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-24', 0, 'recited', 7, 12, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-25', 0, 'recited', 7, 16, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-26', 0, 'recited', 7, 13, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-27', 0, 'recited', 7, 15, 'perfect', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-29', 0, 'recited', 7, 10, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-06-30', 0, 'recited', 7, 15, 'perfect', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-01', 0, 'recited', 7, 14, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-02', 0, 'recited', 7, 13, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 7, '2025-07-02', '2025-07-02', 'pass', 'Qari Uthman', 1, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-03', 0, 'recited', 8, 12, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-04', 0, 'recited', 8, 16, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-06', 0, 'recited', 8, 14, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-07', 0, 'recited', 8, 13, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-08', 0, 'recited', 8, 17, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-09', 0, 'recited', 8, 12, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-10', 0, 'recited', 8, 16, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-11', 0, 'recited', 8, 10, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-13', 0, 'recited', 8, 12, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-14', 0, 'recited', 8, 18, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-07-15', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-16', 0, 'recited', 8, 11, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-17', 0, 'recited', 8, 14, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-18', 0, 'recited', 8, 13, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-20', 0, 'recited', 8, 12, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-07-21', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-22', 0, 'recited', 8, 16, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-23', 0, 'recited', 8, 10, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-24', 0, 'recited', 8, 10, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-25', 0, 'recited', 8, 14, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-27', 0, 'recited', 8, 15, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-07-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-29', 0, 'recited', 8, 13, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-30', 0, 'recited', 8, 11, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-07-31', 0, 'recited', 8, 11, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-01', 0, 'recited', 8, 13, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 8, '2025-08-01', '2025-08-01', 'pass', 'Qari Uthman', 0, 'Zabat: 43/50\nTajweed: 20/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-03', 0, 'recited', 9, 17, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-04', 0, 'recited', 9, 13, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-05', 0, 'recited', 9, 14, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-06', 0, 'recited', 9, 13, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-07', 0, 'recited', 9, 17, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-08', 0, 'recited', 9, 10, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-10', 0, 'recited', 9, 17, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-11', 0, 'recited', 9, 17, 'needs_work', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-08-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-13', 0, 'recited', 9, 13, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-14', 0, 'recited', 9, 10, 'perfect', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-15', 0, 'recited', 9, 12, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-17', 0, 'recited', 9, 17, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-18', 0, 'recited', 9, 15, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-19', 0, 'recited', 9, 11, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-20', 0, 'recited', 9, 17, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-21', 0, 'recited', 9, 14, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-22', 0, 'recited', 9, 11, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-08-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-25', 0, 'recited', 9, 11, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-26', 0, 'recited', 9, 10, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-27', 0, 'recited', 9, 14, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-28', 0, 'recited', 9, 13, 'perfect', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-29', 0, 'recited', 9, 11, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-08-31', 0, 'recited', 9, 18, 'needs_work', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 9, '2025-08-31', '2025-08-31', 'pass', 'Qari Ahmed', 0, 'Zabat: 40/50\nTajweed: 19/20\nLehja: 8/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-01', 0, 'recited', 10, 15, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-02', 0, 'recited', 10, 13, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-03', 0, 'recited', 10, 18, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-04', 0, 'recited', 10, 13, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-05', 0, 'recited', 10, 11, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-07', 0, 'recited', 10, 17, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-08', 0, 'recited', 10, 14, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-09', 0, 'recited', 10, 18, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-10', 0, 'recited', 10, 13, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-11', 0, 'recited', 10, 14, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-12', 0, 'recited', 10, 10, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-14', 0, 'recited', 10, 13, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-09-15', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-16', 0, 'recited', 10, 10, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-17', 0, 'recited', 10, 16, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-18', 0, 'recited', 10, 18, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-19', 0, 'recited', 10, 13, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-21', 0, 'recited', 10, 11, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-22', 0, 'recited', 10, 18, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-23', 0, 'recited', 10, 15, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-24', 0, 'recited', 10, 10, 'perfect', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-25', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-26', 0, 'recited', 10, 13, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 10, '2025-09-26', '2025-09-26', 'pass', 'Qari Uthman', 0, 'Zabat: 46/50\nTajweed: 16/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-28', 0, 'recited', 11, 15, 'perfect', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-09-29', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-09-30', 0, 'recited', 11, 13, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-01', 0, 'recited', 11, 12, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-02', 0, 'recited', 11, 14, 'needs_work', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-03', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-05', 0, 'recited', 11, 14, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-06', 0, 'recited', 11, 11, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-07', 0, 'recited', 11, 11, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-08', 0, 'recited', 11, 18, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-09', 0, 'recited', 11, 13, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-10-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-12', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-13', 0, 'recited', 11, 11, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-14', 0, 'recited', 11, 15, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-15', 0, 'recited', 11, 18, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-16', 0, 'recited', 11, 14, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-10-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-19', 0, 'recited', 11, 15, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-20', 0, 'recited', 11, 18, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-21', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-22', 0, 'recited', 11, 10, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-23', 0, 'recited', 11, 14, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-24', 0, 'recited', 11, 11, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-26', 0, 'recited', 11, 17, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 11, '2025-10-26', '2025-10-26', 'pass', 'Qari Ahmed', 0, 'Zabat: 45/50\nTajweed: 18/20\nLehja: 9/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-27', 0, 'recited', 12, 13, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-28', 0, 'recited', 12, 14, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-29', 0, 'recited', 12, 16, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-30', 0, 'recited', 12, 10, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-10-31', 0, 'recited', 12, 10, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-02', 0, 'recited', 12, 13, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-03', 0, 'recited', 12, 16, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-11-04', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-05', 0, 'recited', 12, 16, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-06', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-07', 0, 'recited', 12, 10, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-09', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-10', 0, 'recited', 12, 18, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-11', 0, 'recited', 12, 16, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-12', 0, 'recited', 12, 17, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-13', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-14', 0, 'recited', 12, 18, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-16', 0, 'recited', 12, 17, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-17', 0, 'recited', 12, 15, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-18', 0, 'recited', 12, 12, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-11-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-20', 0, 'recited', 12, 11, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-21', 0, 'recited', 12, 13, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 12, '2025-11-21', '2025-11-21', 'pass', 'Qari Uthman', 0, 'Zabat: 49/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 94/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-23', 0, 'recited', 13, 12, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-24', 0, 'recited', 13, 16, 'perfect', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-25', 0, 'recited', 13, 18, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-26', 0, 'recited', 13, 15, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-27', 0, 'recited', 13, 18, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-11-28', 0, 'recited', 13, 10, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-11-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-01', 0, 'recited', 13, 16, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-02', 0, 'recited', 13, 12, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-03', 0, 'recited', 13, 12, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-04', 0, 'recited', 13, 12, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-12-05', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-07', 0, 'recited', 13, 15, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-08', 0, 'recited', 13, 13, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-09', 0, 'recited', 13, 12, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-10', 0, 'recited', 13, 13, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-11', 0, 'recited', 13, 14, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-12', 0, 'recited', 13, 17, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-14', 0, 'recited', 13, 14, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-15', 0, 'recited', 13, 12, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-12-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-17', 0, 'recited', 13, 10, 'perfect', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-18', 0, 'recited', 13, 13, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-19', 0, 'recited', 13, 15, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-21', 0, 'recited', 13, 15, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 13, '2025-12-21', '2025-12-21', 'pass', 'Qari Ahmed', 1, 'Zabat: 47/50\nTajweed: 15/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-22', 0, 'recited', 14, 10, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-23', 0, 'recited', 14, 12, 'perfect', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-24', 0, 'recited', 14, 17, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2025-12-25', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-26', 0, 'recited', 14, 17, 'minor_errors', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-28', 0, 'recited', 14, 18, 'needs_work', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-29', 0, 'recited', 14, 18, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-30', 0, 'recited', 14, 10, 'needs_work', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2025-12-31', 0, 'recited', 14, 17, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-01', 0, 'recited', 14, 14, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-01-02', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-04', 0, 'recited', 14, 13, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-05', 0, 'recited', 14, 10, 'needs_work', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-06', 0, 'recited', 14, 16, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-07', 0, 'recited', 14, 12, 'minor_errors', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-08', 0, 'recited', 14, 10, 'needs_work', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-09', 0, 'recited', 14, 13, 'needs_work', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-11', 0, 'recited', 14, 12, 'perfect', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-12', 0, 'recited', 14, 10, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-13', 0, 'recited', 14, 16, 'perfect', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-01-14', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-15', 0, 'recited', 14, 14, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-16', 0, 'recited', 14, 13, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-18', 0, 'recited', 14, 13, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-01-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-01-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-21', 0, 'recited', 14, 18, 'needs_work', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 14, '2026-01-21', '2026-01-21', 'pass', 'Qari Uthman', 1, 'Zabat: 41/50\nTajweed: 16/20\nLehja: 8/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-22', 0, 'recited', 15, 13, 'needs_work', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-23', 0, 'recited', 15, 16, 'needs_work', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-25', 0, 'recited', 15, 12, 'minor_errors', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-26', 0, 'recited', 15, 18, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-27', 0, 'recited', 15, 15, 'needs_work', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-28', 0, 'recited', 15, 18, 'needs_work', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-29', 0, 'recited', 15, 13, 'minor_errors', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-01-30', 0, 'recited', 15, 17, 'minor_errors', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-01', 0, 'recited', 15, 13, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-02', 0, 'recited', 15, 14, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-03', 0, 'recited', 15, 14, 'needs_work', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-04', 0, 'recited', 15, 16, 'needs_work', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-05', 0, 'recited', 15, 10, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-06', 0, 'recited', 15, 13, 'needs_work', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-08', 0, 'recited', 15, 18, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-09', 0, 'recited', 15, 14, 'needs_work', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-10', 0, 'recited', 15, 16, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-02-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-12', 0, 'recited', 15, 17, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-13', 0, 'recited', 15, 18, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-15', 0, 'recited', 15, 12, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-16', 0, 'recited', 15, 14, 'perfect', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 15, '2026-02-16', '2026-02-16', 'pass', 'Qari Uthman', 1, 'Zabat: 45/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-17', 0, 'recited', 16, 11, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-18', 0, 'recited', 16, 17, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-19', 0, 'recited', 16, 15, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-20', 0, 'recited', 16, 11, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-22', 0, 'recited', 16, 14, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-23', 0, 'recited', 16, 15, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-24', 0, 'recited', 16, 11, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-25', 0, 'recited', 16, 10, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-26', 0, 'recited', 16, 12, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-02-27', 0, 'recited', 16, 13, 'perfect', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-01', 0, 'recited', 16, 12, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-02', 0, 'recited', 16, 18, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-03', 0, 'recited', 16, 13, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-04', 0, 'recited', 16, 12, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-05', 0, 'recited', 16, 11, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-06', 0, 'recited', 16, 18, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-08', 0, 'recited', 16, 15, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-09', 0, 'recited', 16, 18, 'minor_errors', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-10', 0, 'recited', 16, 14, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-03-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-12', 0, 'recited', 16, 16, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-13', 0, 'recited', 16, 11, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-15', 0, 'recited', 16, 16, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 16, '2026-03-15', '2026-03-15', 'pass', 'Qari Uthman', 1, 'Zabat: 44/50\nTajweed: 19/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-16', 0, 'recited', 17, 15, 'needs_work', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-17', 0, 'recited', 17, 14, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-18', 0, 'recited', 17, 17, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-19', 0, 'recited', 17, 15, 'perfect', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-20', 0, 'recited', 17, 14, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-03-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-23', 0, 'recited', 17, 13, 'minor_errors', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-24', 0, 'recited', 17, 14, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-25', 0, 'recited', 17, 17, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-26', 0, 'recited', 17, 10, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-27', 0, 'recited', 17, 11, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-29', 0, 'recited', 17, 14, 'perfect', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-30', 0, 'recited', 17, 10, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-03-31', 0, 'recited', 17, 15, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-01', 0, 'recited', 17, 16, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-02', 0, 'recited', 17, 15, 'perfect', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-03', 0, 'recited', 17, 13, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-05', 0, 'recited', 17, 14, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-06', 0, 'recited', 17, 10, 'perfect', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-07', 0, 'recited', 17, 17, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-08', 0, 'recited', 17, 17, 'needs_work', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-09', 0, 'recited', 17, 17, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-10', 0, 'recited', 17, 17, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 17, '2026-04-10', '2026-04-10', 'pass', 'Qari Uthman', 1, 'Zabat: 47/50\nTajweed: 15/20\nLehja: 9/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-12', 0, 'recited', 18, 14, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-13', 0, 'recited', 18, 11, 'perfect', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-14', 0, 'recited', 18, 11, 'needs_work', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-15', 0, 'recited', 18, 15, 'perfect', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-16', 0, 'recited', 18, 18, 'minor_errors', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-17', 0, 'recited', 18, 17, 'needs_work', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-19', 0, 'recited', 18, 12, 'perfect', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-20', 0, 'recited', 18, 12, 'perfect', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-21', 0, 'recited', 18, 12, 'minor_errors', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-22', 0, 'recited', 18, 13, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-23', 0, 'recited', 18, 18, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-24', 0, 'recited', 18, 12, 'needs_work', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-26', 0, 'recited', 18, 15, 'minor_errors', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-27', 0, 'recited', 18, 15, 'needs_work', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-28', 0, 'recited', 18, 15, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-29', 0, 'recited', 18, 18, 'minor_errors', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-04-30', 0, 'recited', 18, 17, 'perfect', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-01', 0, 'recited', 18, 15, 'needs_work', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-03', 0, 'recited', 18, 10, 'needs_work', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-05-04', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-05', 0, 'recited', 18, 12, 'minor_errors', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-06', 0, 'recited', 18, 12, 'perfect', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-07', 0, 'recited', 18, 16, 'minor_errors', 'average', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 18, '2026-05-07', '2026-05-07', 'pass', 'Qari Ahmed', 0, 'Zabat: 41/50\nTajweed: 20/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-08', 0, 'recited', 19, 17, 'minor_errors', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-10', 0, 'recited', 19, 18, 'perfect', 'excellent', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-11', 0, 'recited', 19, 12, 'perfect', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-12', 0, 'recited', 19, 15, 'minor_errors', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-13', 0, 'recited', 19, 15, 'perfect', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-14', 0, 'recited', 19, 18, 'perfect', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-15', 0, 'recited', 19, 16, 'minor_errors', 'excellent', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-17', 0, 'recited', 19, 11, 'needs_work', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-18', 0, 'recited', 19, 16, 'needs_work', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-19', 0, 'recited', 19, 11, 'minor_errors', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-20', 0, 'recited', 19, 10, 'minor_errors', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-21', 0, 'recited', 19, 12, 'minor_errors', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-22', 0, 'recited', 19, 17, 'minor_errors', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-24', 0, 'recited', 19, 17, 'minor_errors', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-25', 0, 'recited', 19, 16, 'needs_work', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-26', 0, 'recited', 19, 17, 'minor_errors', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-05-27', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-28', 0, 'recited', 19, 12, 'minor_errors', 'excellent', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-29', 0, 'recited', 19, 12, 'minor_errors', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-05-31', 0, 'recited', 19, 12, 'needs_work', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-06-01', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-02', 0, 'recited', 19, 10, 'needs_work', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-03', 0, 'recited', 19, 12, 'perfect', 'average', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-04', 0, 'recited', 19, 12, 'needs_work', 'good', 'recited', 18, 'recited', 16, 18);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 19, '2026-06-04', '2026-06-04', 'pass', 'Qari Ahmed', 1, 'Zabat: 45/50\nTajweed: 15/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 87/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-05', 0, 'recited', 20, 10, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-07', 0, 'recited', 20, 17, 'minor_errors', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-06-08', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-09', 0, 'recited', 20, 11, 'minor_errors', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-10', 0, 'recited', 20, 18, 'minor_errors', 'good', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-11', 0, 'recited', 20, 10, 'minor_errors', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-12', 0, 'recited', 20, 14, 'minor_errors', 'good', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-14', 0, 'recited', 20, 15, 'minor_errors', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-15', 0, 'recited', 20, 16, 'needs_work', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-16', 0, 'recited', 20, 13, 'minor_errors', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-17', 0, 'recited', 20, 11, 'perfect', 'good', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-18', 0, 'recited', 20, 11, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-19', 0, 'recited', 20, 14, 'needs_work', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-21', 0, 'recited', 20, 15, 'needs_work', 'good', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-22', 0, 'recited', 20, 12, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-23', 0, 'recited', 20, 15, 'needs_work', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-24', 0, 'recited', 20, 14, 'perfect', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-25', 0, 'recited', 20, 14, 'minor_errors', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-26', 0, 'recited', 20, 11, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-28', 0, 'recited', 20, 17, 'perfect', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-29', 0, 'recited', 20, 12, 'needs_work', 'good', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-06-30', 0, 'recited', 20, 17, 'needs_work', 'average', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-01', 0, 'recited', 20, 11, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-02', 0, 'recited', 20, 18, 'needs_work', 'excellent', 'recited', 19, 'recited', 17, 19);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 20, '2026-07-02', '2026-07-02', 'pass', 'Qari Ahmed', 0, 'Zabat: 41/50\nTajweed: 16/20\nLehja: 9/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-03', 0, 'recited', 21, 14, 'perfect', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-05', 0, 'recited', 21, 18, 'minor_errors', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-06', 0, 'recited', 21, 16, 'needs_work', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-07-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-08', 0, 'recited', 21, 14, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-07-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-10', 0, 'recited', 21, 13, 'needs_work', 'average', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-12', 0, 'recited', 21, 13, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-13', 0, 'recited', 21, 17, 'minor_errors', 'average', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-14', 0, 'recited', 21, 18, 'needs_work', 'average', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-15', 0, 'recited', 21, 16, 'minor_errors', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-16', 0, 'recited', 21, 15, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-17', 0, 'recited', 21, 18, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 214, '2026-07-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-20', 0, 'recited', 21, 11, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-21', 0, 'recited', 21, 10, 'minor_errors', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-22', 0, 'recited', 21, 15, 'needs_work', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-23', 0, 'recited', 21, 17, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-24', 0, 'recited', 21, 16, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-26', 0, 'recited', 21, 11, 'minor_errors', 'average', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-27', 0, 'recited', 21, 15, 'minor_errors', 'good', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-28', 0, 'recited', 21, 12, 'perfect', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-29', 0, 'recited', 21, 18, 'needs_work', 'average', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-30', 0, 'recited', 21, 10, 'needs_work', 'excellent', 'recited', 20, 'recited', 18, 20);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 214, 21, '2026-07-30', '2026-07-30', 'pass', 'Qari Ahmed', 0, 'Zabat: 41/50\nTajweed: 20/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-07-31', 0, 'recited', 22, 15, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-02', 0, 'recited', 22, 17, 'needs_work', 'excellent', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-03', 0, 'recited', 22, 16, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-04', 0, 'recited', 22, 12, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-05', 0, 'recited', 22, 14, 'minor_errors', 'average', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-06', 0, 'recited', 22, 10, 'perfect', 'excellent', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-07', 0, 'recited', 22, 10, 'perfect', 'excellent', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-09', 0, 'recited', 22, 11, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-10', 0, 'recited', 22, 14, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-11', 0, 'recited', 22, 16, 'minor_errors', 'average', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-12', 0, 'recited', 22, 10, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-13', 0, 'recited', 22, 15, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 214, '2026-08-14', 0, 'recited', 22, 16, 'minor_errors', 'good', 'recited', 21, 'recited', 19, 21);
UPDATE hifz_enrollment 
                SET current_para = 22, 
                    current_para_lines_done = 176,
                    total_lines_memorized = 6637,
                    current_streak_days = 23,
                    longest_streak_days = 40,
                    avg_lines_30d = 13.23,
                    current_phase = 'advanced',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 214;

INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-01', 0, 'recited', 1, 12, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-02', 0, 'recited', 1, 18, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-03', 0, 'recited', 1, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-04-04', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-06', 0, 'recited', 1, 14, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-07', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-08', 0, 'recited', 1, 16, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-09', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-10', 0, 'recited', 1, 17, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-11', 0, 'recited', 1, 12, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-13', 0, 'recited', 1, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-14', 0, 'recited', 1, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-15', 0, 'recited', 1, 10, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-04-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-17', 0, 'recited', 1, 16, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-18', 0, 'recited', 1, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-20', 0, 'recited', 1, 18, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-21', 0, 'recited', 1, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-22', 0, 'recited', 1, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-23', 0, 'recited', 1, 13, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-24', 0, 'recited', 1, 17, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-04-25', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-27', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-28', 0, 'recited', 1, 13, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-29', 0, 'recited', 1, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 1, '2025-04-29', '2025-04-29', 'pass', 'Qari Ahmed', 1, 'Zabat: 43/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-04-30', 0, 'recited', 2, 18, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-05-01', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-02', 0, 'recited', 2, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-04', 0, 'recited', 2, 11, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-05', 0, 'recited', 2, 12, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-06', 0, 'recited', 2, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-07', 0, 'recited', 2, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-08', 0, 'recited', 2, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-05-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-05-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-12', 0, 'recited', 2, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-13', 0, 'recited', 2, 11, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-14', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-15', 0, 'recited', 2, 17, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-16', 0, 'recited', 2, 15, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-18', 0, 'recited', 2, 10, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-19', 0, 'recited', 2, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-20', 0, 'recited', 2, 18, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-21', 0, 'recited', 2, 13, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-22', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-23', 0, 'recited', 2, 11, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-25', 0, 'recited', 2, 14, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-05-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-27', 0, 'recited', 2, 12, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-28', 0, 'recited', 2, 16, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-29', 0, 'recited', 2, 10, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-05-30', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 2, '2025-05-30', '2025-05-30', 'pass', 'Qari Uthman', 0, 'Zabat: 50/50\nTajweed: 15/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 95/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-01', 0, 'recited', 3, 10, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-02', 0, 'recited', 3, 18, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-03', 0, 'recited', 3, 17, 'needs_work', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-04', 0, 'recited', 3, 11, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-05', 0, 'recited', 3, 13, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-06-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-08', 0, 'recited', 3, 16, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-09', 0, 'recited', 3, 11, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-10', 0, 'recited', 3, 10, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-11', 0, 'recited', 3, 11, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-12', 0, 'recited', 3, 14, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-13', 0, 'recited', 3, 15, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-15', 0, 'recited', 3, 15, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-16', 0, 'recited', 3, 10, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-17', 0, 'recited', 3, 12, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-18', 0, 'recited', 3, 17, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-19', 0, 'recited', 3, 18, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-20', 0, 'recited', 3, 13, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-06-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-06-23', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-24', 0, 'recited', 3, 10, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-25', 0, 'recited', 3, 17, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-26', 0, 'recited', 3, 18, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-27', 0, 'recited', 3, 17, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-29', 0, 'recited', 3, 12, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 3, '2025-06-29', '2025-06-29', 'pass', 'Qari Ahmed', 0, 'Zabat: 45/50\nTajweed: 18/20\nLehja: 10/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-06-30', 0, 'recited', 4, 13, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-01', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-02', 0, 'recited', 4, 11, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-03', 0, 'recited', 4, 10, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-04', 0, 'recited', 4, 14, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-06', 0, 'recited', 4, 11, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-07-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-08', 0, 'recited', 4, 12, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-09', 0, 'recited', 4, 16, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-10', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-11', 0, 'recited', 4, 15, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-13', 0, 'recited', 4, 18, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-14', 0, 'recited', 4, 18, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-15', 0, 'recited', 4, 12, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-16', 0, 'recited', 4, 16, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-17', 0, 'recited', 4, 10, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-18', 0, 'recited', 4, 11, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-20', 0, 'recited', 4, 15, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-21', 0, 'recited', 4, 18, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-07-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-23', 0, 'recited', 4, 16, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-07-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-25', 0, 'recited', 4, 12, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-27', 0, 'recited', 4, 10, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-28', 0, 'recited', 4, 10, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 4, '2025-07-28', '2025-07-28', 'pass', 'Qari Ahmed', 0, 'Zabat: 42/50\nTajweed: 19/20\nLehja: 10/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-29', 0, 'recited', 5, 11, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-07-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-07-31', 0, 'recited', 5, 14, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-01', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-03', 0, 'recited', 5, 14, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-04', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-05', 0, 'recited', 5, 18, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-06', 0, 'recited', 5, 13, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-07', 0, 'recited', 5, 15, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-08', 0, 'recited', 5, 10, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-08-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-11', 0, 'recited', 5, 13, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-08-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-13', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-14', 0, 'recited', 5, 12, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-15', 0, 'recited', 5, 12, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-17', 0, 'recited', 5, 14, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-18', 0, 'recited', 5, 11, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-19', 0, 'recited', 5, 12, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-20', 0, 'recited', 5, 11, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-21', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-22', 0, 'recited', 5, 18, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-24', 0, 'recited', 5, 12, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-25', 0, 'recited', 5, 10, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-26', 0, 'recited', 5, 13, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-27', 0, 'recited', 5, 11, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-08-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-08-29', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-08-31', 0, 'recited', 5, 13, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 5, '2025-08-31', '2025-08-31', 'pass', 'Qari Uthman', 0, 'Zabat: 45/50\nTajweed: 20/20\nLehja: 9/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 94/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-01', 0, 'recited', 6, 11, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-09-02', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-03', 0, 'recited', 6, 13, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-04', 0, 'recited', 6, 18, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-05', 0, 'recited', 6, 13, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-09-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-08', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-09', 0, 'recited', 6, 13, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-10', 0, 'recited', 6, 16, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-11', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-12', 0, 'recited', 6, 14, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-14', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-15', 0, 'recited', 6, 13, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-16', 0, 'recited', 6, 16, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-17', 0, 'recited', 6, 15, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-18', 0, 'recited', 6, 16, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-09-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-21', 0, 'recited', 6, 18, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-22', 0, 'recited', 6, 11, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-23', 0, 'recited', 6, 16, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-24', 0, 'recited', 6, 18, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-25', 0, 'recited', 6, 16, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-09-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-28', 0, 'recited', 6, 17, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 6, '2025-09-28', '2025-09-28', 'pass', 'Qari Uthman', 1, 'Zabat: 48/50\nTajweed: 16/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-09-29', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-09-30', 0, 'recited', 7, 17, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-01', 0, 'recited', 7, 18, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-02', 0, 'recited', 7, 15, 'perfect', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-03', 0, 'recited', 7, 17, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-05', 0, 'recited', 7, 14, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-06', 0, 'recited', 7, 18, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-10-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-08', 0, 'recited', 7, 14, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-09', 0, 'recited', 7, 15, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-10-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-12', 0, 'recited', 7, 15, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-13', 0, 'recited', 7, 18, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-14', 0, 'recited', 7, 17, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-15', 0, 'recited', 7, 14, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-16', 0, 'recited', 7, 17, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-10-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-19', 0, 'recited', 7, 11, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-20', 0, 'recited', 7, 15, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-21', 0, 'recited', 7, 17, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-22', 0, 'recited', 7, 18, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-23', 0, 'recited', 7, 11, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-10-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-26', 0, 'recited', 7, 11, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-27', 0, 'recited', 7, 14, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 7, '2025-10-27', '2025-10-27', 'pass', 'Qari Uthman', 1, 'Zabat: 40/50\nTajweed: 15/20\nLehja: 9/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 83/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-28', 0, 'recited', 8, 10, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-29', 0, 'recited', 8, 12, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-10-30', 0, 'recited', 8, 18, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-10-31', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-02', 0, 'recited', 8, 13, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-03', 0, 'recited', 8, 12, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-04', 0, 'recited', 8, 16, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-05', 0, 'recited', 8, 15, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-06', 0, 'recited', 8, 15, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-07', 0, 'recited', 8, 12, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-09', 0, 'recited', 8, 14, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-10', 0, 'recited', 8, 16, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-11-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-12', 0, 'recited', 8, 12, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-13', 0, 'recited', 8, 11, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-14', 0, 'recited', 8, 17, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-16', 0, 'recited', 8, 10, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-17', 0, 'recited', 8, 10, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-18', 0, 'recited', 8, 13, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-19', 0, 'recited', 8, 11, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-11-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-21', 0, 'recited', 8, 15, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-23', 0, 'recited', 8, 14, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-24', 0, 'recited', 8, 15, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-25', 0, 'recited', 8, 12, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-26', 0, 'recited', 8, 16, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 8, '2025-11-26', '2025-11-26', 'pass', 'Qari Uthman', 1, 'Zabat: 44/50\nTajweed: 20/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 94/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-27', 0, 'recited', 9, 10, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-11-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-11-30', 0, 'recited', 9, 15, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-01', 0, 'recited', 9, 18, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-02', 0, 'recited', 9, 14, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-03', 0, 'recited', 9, 16, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-04', 0, 'recited', 9, 13, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-05', 0, 'recited', 9, 18, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-07', 0, 'recited', 9, 15, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-08', 0, 'recited', 9, 16, 'needs_work', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-12-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-10', 0, 'recited', 9, 11, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-11', 0, 'recited', 9, 15, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-12', 0, 'recited', 9, 16, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-14', 0, 'recited', 9, 14, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-15', 0, 'recited', 9, 11, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-16', 0, 'recited', 9, 13, 'needs_work', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-17', 0, 'recited', 9, 11, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-18', 0, 'recited', 9, 17, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-19', 0, 'recited', 9, 17, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-21', 0, 'recited', 9, 16, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-22', 0, 'recited', 9, 13, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-23', 0, 'recited', 9, 11, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 9, '2025-12-23', '2025-12-23', 'pass', 'Qari Ahmed', 0, 'Zabat: 49/50\nTajweed: 17/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 95/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-12-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-25', 0, 'recited', 10, 13, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-12-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-28', 0, 'recited', 10, 11, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-29', 0, 'recited', 10, 12, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2025-12-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2025-12-31', 0, 'recited', 10, 18, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-01', 0, 'recited', 10, 12, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-02', 0, 'recited', 10, 10, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-04', 0, 'recited', 10, 15, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-05', 0, 'recited', 10, 13, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-06', 0, 'recited', 10, 10, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-07', 0, 'recited', 10, 13, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-08', 0, 'recited', 10, 13, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-09', 0, 'recited', 10, 12, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-11', 0, 'recited', 10, 16, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-12', 0, 'recited', 10, 17, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-13', 0, 'recited', 10, 15, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-14', 0, 'recited', 10, 15, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-01-15', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-16', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-18', 0, 'recited', 10, 14, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-19', 0, 'recited', 10, 15, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-20', 0, 'recited', 10, 15, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-21', 0, 'recited', 10, 18, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-22', 0, 'recited', 10, 11, 'needs_work', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 10, '2026-01-22', '2026-01-22', 'pass', 'Qari Uthman', 0, 'Zabat: 46/50\nTajweed: 19/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-23', 0, 'recited', 11, 12, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-25', 0, 'recited', 11, 14, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-26', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-27', 0, 'recited', 11, 15, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-28', 0, 'recited', 11, 11, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-29', 0, 'recited', 11, 17, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-01-30', 0, 'recited', 11, 15, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-01', 0, 'recited', 11, 16, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-02', 0, 'recited', 11, 13, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-03', 0, 'recited', 11, 17, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-04', 0, 'recited', 11, 15, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-05', 0, 'recited', 11, 13, 'needs_work', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-06', 0, 'recited', 11, 10, 'needs_work', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-08', 0, 'recited', 11, 16, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-02-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-10', 0, 'recited', 11, 12, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-11', 0, 'recited', 11, 13, 'perfect', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-12', 0, 'recited', 11, 16, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-13', 0, 'recited', 11, 11, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-15', 0, 'recited', 11, 18, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-16', 0, 'recited', 11, 18, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-17', 0, 'recited', 11, 16, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 11, '2026-02-17', '2026-02-17', 'pass', 'Qari Ahmed', 1, 'Zabat: 50/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 96/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-18', 0, 'recited', 12, 17, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-19', 0, 'recited', 12, 18, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-02-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-22', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-23', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-02-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-25', 0, 'recited', 12, 12, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-26', 0, 'recited', 12, 12, 'needs_work', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-02-27', 0, 'recited', 12, 11, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-01', 0, 'recited', 12, 11, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-02', 0, 'recited', 12, 17, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-03', 0, 'recited', 12, 12, 'needs_work', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-04', 0, 'recited', 12, 14, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-05', 0, 'recited', 12, 16, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-06', 0, 'recited', 12, 14, 'perfect', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-03-08', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-09', 0, 'recited', 12, 18, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-10', 0, 'recited', 12, 11, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-11', 0, 'recited', 12, 12, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-12', 0, 'recited', 12, 15, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-13', 0, 'recited', 12, 16, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-15', 0, 'recited', 12, 17, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-16', 0, 'recited', 12, 11, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-17', 0, 'recited', 12, 17, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 12, '2026-03-17', '2026-03-17', 'pass', 'Qari Uthman', 1, 'Zabat: 44/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 87/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-18', 0, 'recited', 13, 17, 'needs_work', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-19', 0, 'recited', 13, 15, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-20', 0, 'recited', 13, 10, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-22', 0, 'recited', 13, 10, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-23', 0, 'recited', 13, 16, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-24', 0, 'recited', 13, 14, 'needs_work', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-25', 0, 'recited', 13, 16, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-26', 0, 'recited', 13, 15, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-27', 0, 'recited', 13, 12, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-29', 0, 'recited', 13, 14, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-30', 0, 'recited', 13, 11, 'perfect', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-03-31', 0, 'recited', 13, 13, 'perfect', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-04-01', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-02', 0, 'recited', 13, 18, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-03', 0, 'recited', 13, 14, 'needs_work', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-05', 0, 'recited', 13, 18, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-06', 0, 'recited', 13, 10, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-07', 0, 'recited', 13, 14, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-08', 0, 'recited', 13, 16, 'needs_work', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-09', 0, 'recited', 13, 12, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-10', 0, 'recited', 13, 15, 'needs_work', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-12', 0, 'recited', 13, 15, 'minor_errors', 'average', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-13', 0, 'recited', 13, 12, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 13, '2026-04-13', '2026-04-13', 'pass', 'Qari Ahmed', 1, 'Zabat: 45/50\nTajweed: 17/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-14', 0, 'recited', 14, 12, 'minor_errors', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-15', 0, 'recited', 14, 16, 'needs_work', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-16', 0, 'recited', 14, 16, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-17', 0, 'recited', 14, 11, 'needs_work', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-19', 0, 'recited', 14, 12, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-20', 0, 'recited', 14, 17, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-21', 0, 'recited', 14, 14, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-22', 0, 'recited', 14, 16, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-23', 0, 'recited', 14, 11, 'minor_errors', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-04-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-26', 0, 'recited', 14, 17, 'needs_work', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-27', 0, 'recited', 14, 11, 'needs_work', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-28', 0, 'recited', 14, 16, 'perfect', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-29', 0, 'recited', 14, 17, 'minor_errors', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-04-30', 0, 'recited', 14, 16, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-01', 0, 'recited', 14, 13, 'minor_errors', 'average', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-03', 0, 'recited', 14, 11, 'needs_work', 'excellent', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-05-04', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-05', 0, 'recited', 14, 18, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-06', 0, 'recited', 14, 13, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-07', 0, 'recited', 14, 10, 'minor_errors', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-08', 0, 'recited', 14, 17, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-10', 0, 'recited', 14, 17, 'perfect', 'good', 'recited', 13, 'recited', 11, 13);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 14, '2026-05-10', '2026-05-10', 'pass', 'Qari Uthman', 1, 'Zabat: 45/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-11', 0, 'recited', 15, 16, 'needs_work', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-12', 0, 'recited', 15, 13, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-05-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-14', 0, 'recited', 15, 17, 'needs_work', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-15', 0, 'recited', 15, 14, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-17', 0, 'recited', 15, 18, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-18', 0, 'recited', 15, 12, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-19', 0, 'recited', 15, 16, 'minor_errors', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-20', 0, 'recited', 15, 11, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-05-21', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-05-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-24', 0, 'recited', 15, 16, 'minor_errors', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-25', 0, 'recited', 15, 10, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-26', 0, 'recited', 15, 18, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-27', 0, 'recited', 15, 17, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-28', 0, 'recited', 15, 12, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-05-29', 0, 'recited', 15, 13, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-05-31', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-01', 0, 'recited', 15, 10, 'needs_work', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-02', 0, 'recited', 15, 10, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-03', 0, 'recited', 15, 16, 'minor_errors', 'average', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-04', 0, 'recited', 15, 18, 'needs_work', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-05', 0, 'recited', 15, 12, 'perfect', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-07', 0, 'recited', 15, 14, 'perfect', 'excellent', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-08', 0, 'recited', 15, 17, 'minor_errors', 'good', 'recited', 14, 'recited', 12, 14);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 15, '2026-06-08', '2026-06-08', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 19/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 92/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-09', 0, 'recited', 16, 12, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-10', 0, 'recited', 16, 13, 'perfect', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-11', 0, 'recited', 16, 12, 'minor_errors', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-12', 0, 'recited', 16, 12, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-14', 0, 'recited', 16, 11, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-15', 0, 'recited', 16, 12, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-06-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-17', 0, 'recited', 16, 11, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-18', 0, 'recited', 16, 14, 'minor_errors', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-19', 0, 'recited', 16, 14, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-21', 0, 'recited', 16, 11, 'needs_work', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-22', 0, 'recited', 16, 14, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-23', 0, 'recited', 16, 16, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-24', 0, 'recited', 16, 14, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-25', 0, 'recited', 16, 14, 'needs_work', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-26', 0, 'recited', 16, 15, 'needs_work', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-28', 0, 'recited', 16, 15, 'needs_work', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-29', 0, 'recited', 16, 16, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-06-30', 0, 'recited', 16, 13, 'minor_errors', 'average', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-01', 0, 'recited', 16, 12, 'minor_errors', 'excellent', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-02', 0, 'recited', 16, 10, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-03', 0, 'recited', 16, 15, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-05', 0, 'recited', 16, 16, 'minor_errors', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-06', 0, 'recited', 16, 16, 'perfect', 'good', 'recited', 15, 'recited', 13, 15);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 16, '2026-07-06', '2026-07-06', 'pass', 'Qari Uthman', 0, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-07', 0, 'recited', 17, 13, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-08', 0, 'recited', 17, 16, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-07-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-10', 0, 'recited', 17, 13, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-12', 0, 'recited', 17, 14, 'minor_errors', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-13', 0, 'recited', 17, 12, 'needs_work', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-14', 0, 'recited', 17, 12, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-15', 0, 'recited', 17, 10, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-16', 0, 'recited', 17, 15, 'perfect', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-17', 0, 'recited', 17, 14, 'perfect', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-19', 0, 'recited', 17, 17, 'perfect', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-20', 0, 'recited', 17, 11, 'needs_work', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-21', 0, 'recited', 17, 12, 'minor_errors', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-22', 0, 'recited', 17, 16, 'minor_errors', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-07-23', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-24', 0, 'recited', 17, 14, 'needs_work', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-26', 0, 'recited', 17, 15, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-27', 0, 'recited', 17, 12, 'needs_work', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 216, '2026-07-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-29', 0, 'recited', 17, 14, 'perfect', 'good', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-30', 0, 'recited', 17, 12, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-07-31', 0, 'recited', 17, 10, 'minor_errors', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-02', 0, 'recited', 17, 13, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-03', 0, 'recited', 17, 16, 'needs_work', 'average', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-04', 0, 'recited', 17, 12, 'minor_errors', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-05', 0, 'recited', 17, 18, 'needs_work', 'excellent', 'recited', 16, 'recited', 14, 16);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 216, 17, '2026-08-05', '2026-08-05', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 85/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-06', 0, 'recited', 18, 14, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-07', 0, 'recited', 18, 18, 'perfect', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-09', 0, 'recited', 18, 14, 'perfect', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-10', 0, 'recited', 18, 13, 'minor_errors', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-11', 0, 'recited', 18, 15, 'perfect', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-12', 0, 'recited', 18, 10, 'minor_errors', 'excellent', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-13', 0, 'recited', 18, 10, 'minor_errors', 'good', 'recited', 17, 'recited', 15, 17);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 216, '2026-08-14', 0, 'recited', 18, 11, 'needs_work', 'good', 'recited', 17, 'recited', 15, 17);
UPDATE hifz_enrollment 
                SET current_para = 18, 
                    current_para_lines_done = 105,
                    total_lines_memorized = 5289,
                    current_streak_days = 15,
                    longest_streak_days = 20,
                    avg_lines_30d = 12.54,
                    current_phase = 'mid',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 216;

INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-08-29', 0, 'recited', 1, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-08-31', 0, 'recited', 1, 16, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-09-01', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-09-02', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-03', 0, 'recited', 1, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-04', 0, 'recited', 1, 14, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-05', 0, 'recited', 1, 18, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-07', 0, 'recited', 1, 17, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-08', 0, 'recited', 1, 13, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-09', 0, 'recited', 1, 12, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-10', 0, 'recited', 1, 11, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-11', 0, 'recited', 1, 11, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-12', 0, 'recited', 1, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-14', 0, 'recited', 1, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-15', 0, 'recited', 1, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-16', 0, 'recited', 1, 10, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-17', 0, 'recited', 1, 12, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-18', 0, 'recited', 1, 16, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-09-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-09-21', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-22', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-23', 0, 'recited', 1, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-24', 0, 'recited', 1, 11, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-25', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-26', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-28', 0, 'recited', 1, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 1, '2025-09-28', '2025-09-28', 'pass', 'Qari Uthman', 1, 'Zabat: 43/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-09-29', 0, 'recited', 2, 18, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-09-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-01', 0, 'recited', 2, 18, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-02', 0, 'recited', 2, 14, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-03', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-05', 0, 'recited', 2, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-06', 0, 'recited', 2, 18, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-07', 0, 'recited', 2, 10, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-08', 0, 'recited', 2, 10, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-09', 0, 'recited', 2, 17, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-10', 0, 'recited', 2, 17, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-12', 0, 'recited', 2, 15, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-13', 0, 'recited', 2, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-14', 0, 'recited', 2, 10, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-15', 0, 'recited', 2, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-16', 0, 'recited', 2, 18, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-17', 0, 'recited', 2, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-19', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-20', 0, 'recited', 2, 18, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-21', 0, 'recited', 2, 14, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-22', 0, 'recited', 2, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-23', 0, 'recited', 2, 16, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 2, '2025-10-23', '2025-10-23', 'pass', 'Qari Ahmed', 1, 'Zabat: 47/50\nTajweed: 16/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-24', 0, 'recited', 3, 11, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-10-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-27', 0, 'recited', 3, 18, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-28', 0, 'recited', 3, 17, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-29', 0, 'recited', 3, 17, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-10-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-10-31', 0, 'recited', 3, 12, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-02', 0, 'recited', 3, 10, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-03', 0, 'recited', 3, 16, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-04', 0, 'recited', 3, 10, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-05', 0, 'recited', 3, 16, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-11-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-07', 0, 'recited', 3, 13, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-09', 0, 'recited', 3, 14, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-10', 0, 'recited', 3, 14, 'needs_work', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-11', 0, 'recited', 3, 11, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-12', 0, 'recited', 3, 17, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-13', 0, 'recited', 3, 10, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-14', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-11-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-17', 0, 'recited', 3, 11, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-18', 0, 'recited', 3, 10, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-19', 0, 'recited', 3, 18, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-20', 0, 'recited', 3, 16, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-21', 0, 'recited', 3, 11, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-23', 0, 'recited', 3, 14, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 3, '2025-11-23', '2025-11-23', 'pass', 'Qari Uthman', 0, 'Zabat: 46/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-24', 0, 'recited', 4, 13, 'perfect', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-25', 0, 'recited', 4, 10, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-26', 0, 'recited', 4, 16, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-27', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-28', 0, 'recited', 4, 16, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-11-30', 0, 'recited', 4, 11, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-01', 0, 'recited', 4, 10, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-02', 0, 'recited', 4, 15, 'perfect', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-03', 0, 'recited', 4, 18, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-04', 0, 'recited', 4, 17, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-05', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-07', 0, 'recited', 4, 15, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-08', 0, 'recited', 4, 17, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-09', 0, 'recited', 4, 16, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-10', 0, 'recited', 4, 12, 'perfect', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-11', 0, 'recited', 4, 14, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-12', 0, 'recited', 4, 11, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-14', 0, 'recited', 4, 12, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-15', 0, 'recited', 4, 10, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-16', 0, 'recited', 4, 13, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-17', 0, 'recited', 4, 16, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-18', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 4, '2025-12-18', '2025-12-18', 'pass', 'Qari Ahmed', 0, 'Zabat: 49/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-19', 0, 'recited', 5, 15, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-21', 0, 'recited', 5, 11, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-22', 0, 'recited', 5, 12, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-23', 0, 'recited', 5, 18, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-24', 0, 'recited', 5, 18, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-25', 0, 'recited', 5, 15, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-26', 0, 'recited', 5, 10, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-28', 0, 'recited', 5, 15, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2025-12-29', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-30', 0, 'recited', 5, 13, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2025-12-31', 0, 'recited', 5, 18, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-01', 0, 'recited', 5, 18, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-02', 0, 'recited', 5, 18, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-04', 0, 'recited', 5, 16, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-05', 0, 'recited', 5, 15, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-06', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-07', 0, 'recited', 5, 15, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-08', 0, 'recited', 5, 18, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-09', 0, 'recited', 5, 15, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-11', 0, 'recited', 5, 16, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-12', 0, 'recited', 5, 18, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 5, '2026-01-12', '2026-01-12', 'pass', 'Qari Uthman', 0, 'Zabat: 41/50\nTajweed: 18/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-13', 0, 'recited', 6, 17, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-14', 0, 'recited', 6, 12, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-15', 0, 'recited', 6, 11, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-16', 0, 'recited', 6, 16, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-18', 0, 'recited', 6, 11, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-19', 0, 'recited', 6, 13, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-20', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-21', 0, 'recited', 6, 10, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-22', 0, 'recited', 6, 14, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-23', 0, 'recited', 6, 13, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-25', 0, 'recited', 6, 17, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-26', 0, 'recited', 6, 17, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-27', 0, 'recited', 6, 15, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-28', 0, 'recited', 6, 11, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-29', 0, 'recited', 6, 15, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-01-30', 0, 'recited', 6, 16, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-01', 0, 'recited', 6, 18, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-02', 0, 'recited', 6, 17, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-03', 0, 'recited', 6, 15, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-04', 0, 'recited', 6, 17, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-05', 0, 'recited', 6, 15, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 6, '2026-02-05', '2026-02-05', 'pass', 'Qari Ahmed', 1, 'Zabat: 46/50\nTajweed: 20/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 95/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-06', 0, 'recited', 7, 13, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-08', 0, 'recited', 7, 16, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-09', 0, 'recited', 7, 18, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-10', 0, 'recited', 7, 18, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-11', 0, 'recited', 7, 13, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-12', 0, 'recited', 7, 18, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-02-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-15', 0, 'recited', 7, 12, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-16', 0, 'recited', 7, 17, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-17', 0, 'recited', 7, 12, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-18', 0, 'recited', 7, 17, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-02-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-20', 0, 'recited', 7, 12, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-22', 0, 'recited', 7, 17, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-23', 0, 'recited', 7, 11, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-24', 0, 'recited', 7, 10, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-25', 0, 'recited', 7, 13, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-26', 0, 'recited', 7, 14, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-02-27', 0, 'recited', 7, 16, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-01', 0, 'recited', 7, 10, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-02', 0, 'recited', 7, 14, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-03', 0, 'recited', 7, 10, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-04', 0, 'recited', 7, 13, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-05', 0, 'recited', 7, 10, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 7, '2026-03-05', '2026-03-05', 'pass', 'Qari Ahmed', 0, 'Zabat: 49/50\nTajweed: 20/20\nLehja: 8/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 94/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-03-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-08', 0, 'recited', 8, 15, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-09', 0, 'recited', 8, 18, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-03-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-11', 0, 'recited', 8, 11, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-03-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-13', 0, 'recited', 8, 16, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-15', 0, 'recited', 8, 11, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-16', 0, 'recited', 8, 14, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-17', 0, 'recited', 8, 15, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-18', 0, 'recited', 8, 10, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-03-19', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-20', 0, 'recited', 8, 13, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-22', 0, 'recited', 8, 16, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-23', 0, 'recited', 8, 10, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-24', 0, 'recited', 8, 11, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-03-25', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-26', 0, 'recited', 8, 10, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-27', 0, 'recited', 8, 10, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-29', 0, 'recited', 8, 11, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-30', 0, 'recited', 8, 15, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-03-31', 0, 'recited', 8, 12, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-01', 0, 'recited', 8, 14, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-02', 0, 'recited', 8, 11, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-03', 0, 'recited', 8, 17, 'minor_errors', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-05', 0, 'recited', 8, 11, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-06', 0, 'recited', 8, 17, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-04-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-08', 0, 'recited', 8, 11, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-04-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-10', 0, 'recited', 8, 18, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 8, '2026-04-10', '2026-04-10', 'pass', 'Qari Uthman', 1, 'Zabat: 47/50\nTajweed: 19/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-04-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-13', 0, 'recited', 9, 16, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-14', 0, 'recited', 9, 17, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-15', 0, 'recited', 9, 13, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-16', 0, 'recited', 9, 13, 'needs_work', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-17', 0, 'recited', 9, 15, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-19', 0, 'recited', 9, 14, 'needs_work', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-20', 0, 'recited', 9, 14, 'perfect', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-21', 0, 'recited', 9, 10, 'perfect', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-04-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-23', 0, 'recited', 9, 17, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-24', 0, 'recited', 9, 11, 'needs_work', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-26', 0, 'recited', 9, 18, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-27', 0, 'recited', 9, 11, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-28', 0, 'recited', 9, 16, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-29', 0, 'recited', 9, 10, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-04-30', 0, 'recited', 9, 14, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-01', 0, 'recited', 9, 13, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-03', 0, 'recited', 9, 10, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-04', 0, 'recited', 9, 11, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-05', 0, 'recited', 9, 18, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-06', 0, 'recited', 9, 11, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-07', 0, 'recited', 9, 18, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-08', 0, 'recited', 9, 18, 'needs_work', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 9, '2026-05-08', '2026-05-08', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-11', 0, 'recited', 10, 15, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-12', 0, 'recited', 10, 17, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-13', 0, 'recited', 10, 12, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-14', 0, 'recited', 10, 18, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-15', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-18', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-19', 0, 'recited', 10, 10, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-20', 0, 'recited', 10, 16, 'perfect', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-21', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-22', 0, 'recited', 10, 10, 'needs_work', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-05-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-25', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-26', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-27', 0, 'recited', 10, 15, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-28', 0, 'recited', 10, 17, 'needs_work', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-29', 0, 'recited', 10, 16, 'perfect', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-05-31', 0, 'recited', 10, 14, 'perfect', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-01', 0, 'recited', 10, 12, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-02', 0, 'recited', 10, 12, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-03', 0, 'recited', 10, 14, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-04', 0, 'recited', 10, 18, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-05', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-07', 0, 'recited', 10, 10, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-08', 0, 'recited', 10, 10, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-06-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-10', 0, 'recited', 10, 14, 'perfect', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-11', 0, 'recited', 10, 14, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 10, '2026-06-11', '2026-06-11', 'pass', 'Qari Uthman', 0, 'Zabat: 50/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 95/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-12', 0, 'recited', 11, 12, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-14', 0, 'recited', 11, 14, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-15', 0, 'recited', 11, 18, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-16', 0, 'recited', 11, 18, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-17', 0, 'recited', 11, 18, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-06-18', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-19', 0, 'recited', 11, 10, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-21', 0, 'recited', 11, 11, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-22', 0, 'recited', 11, 10, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-23', 0, 'recited', 11, 15, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-24', 0, 'recited', 11, 18, 'needs_work', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-25', 0, 'recited', 11, 15, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-26', 0, 'recited', 11, 16, 'perfect', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-28', 0, 'recited', 11, 12, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-29', 0, 'recited', 11, 10, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-06-30', 0, 'recited', 11, 17, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-01', 0, 'recited', 11, 10, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-07-02', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-03', 0, 'recited', 11, 10, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-05', 0, 'recited', 11, 13, 'perfect', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-06', 0, 'recited', 11, 10, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-07', 0, 'recited', 11, 10, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-08', 0, 'recited', 11, 11, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-09', 0, 'recited', 11, 10, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-10', 0, 'recited', 11, 12, 'needs_work', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 11, '2026-07-10', '2026-07-10', 'pass', 'Qari Ahmed', 0, 'Zabat: 50/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-12', 0, 'recited', 12, 13, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-13', 0, 'recited', 12, 11, 'needs_work', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-14', 0, 'recited', 12, 18, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-15', 0, 'recited', 12, 15, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-16', 0, 'recited', 12, 17, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-17', 0, 'recited', 12, 10, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-19', 0, 'recited', 12, 12, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-20', 0, 'recited', 12, 12, 'perfect', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-21', 0, 'recited', 12, 10, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-22', 0, 'recited', 12, 17, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-23', 0, 'recited', 12, 11, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-24', 0, 'recited', 12, 13, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-26', 0, 'recited', 12, 12, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-27', 0, 'recited', 12, 14, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-28', 0, 'recited', 12, 17, 'perfect', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-29', 0, 'recited', 12, 13, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-30', 0, 'recited', 12, 14, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-07-31', 0, 'recited', 12, 16, 'needs_work', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-02', 0, 'recited', 12, 16, 'needs_work', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-03', 0, 'recited', 12, 18, 'needs_work', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-08-04', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-05', 0, 'recited', 12, 12, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-06', 0, 'recited', 12, 13, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 218, 12, '2026-08-06', '2026-08-06', 'pass', 'Qari Uthman', 1, 'Zabat: 48/50\nTajweed: 17/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 95/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-07', 0, 'recited', 13, 15, 'perfect', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-09', 0, 'recited', 13, 18, 'needs_work', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-10', 0, 'recited', 13, 18, 'minor_errors', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-11', 0, 'recited', 13, 15, 'minor_errors', 'good', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 218, '2026-08-12', 0, 'recited', 13, 11, 'perfect', 'excellent', 'recited', 12, 'recited', 10, 12);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-08-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 218, '2026-08-14', 1, 'not_recited', 'not_recited', 'not_recited');
UPDATE hifz_enrollment 
                SET current_para = 13, 
                    current_para_lines_done = 77,
                    total_lines_memorized = 3758,
                    current_streak_days = 0,
                    longest_streak_days = 39,
                    avg_lines_30d = 12.46,
                    current_phase = 'mid',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 218;

INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-09-18', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-19', 0, 'recited', 1, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-21', 0, 'recited', 1, 16, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-22', 0, 'recited', 1, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-23', 0, 'recited', 1, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-09-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-09-25', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-26', 0, 'recited', 1, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-28', 0, 'recited', 1, 14, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-29', 0, 'recited', 1, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-09-30', 0, 'recited', 1, 16, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-01', 0, 'recited', 1, 17, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-02', 0, 'recited', 1, 14, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-03', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-05', 0, 'recited', 1, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-06', 0, 'recited', 1, 15, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-10-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-08', 0, 'recited', 1, 15, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-09', 0, 'recited', 1, 16, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-10', 0, 'recited', 1, 12, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-12', 0, 'recited', 1, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-13', 0, 'recited', 1, 18, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-14', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-15', 0, 'recited', 1, 10, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-10-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-17', 0, 'recited', 1, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-19', 0, 'recited', 1, 16, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 1, '2025-10-19', '2025-10-19', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 87/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-20', 0, 'recited', 2, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-21', 0, 'recited', 2, 12, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-22', 0, 'recited', 2, 11, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-23', 0, 'recited', 2, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-24', 0, 'recited', 2, 16, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-26', 0, 'recited', 2, 14, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-27', 0, 'recited', 2, 14, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-28', 0, 'recited', 2, 10, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-29', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-10-30', 0, 'recited', 2, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-10-31', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-02', 0, 'recited', 2, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-03', 0, 'recited', 2, 10, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-04', 0, 'recited', 2, 11, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-05', 0, 'recited', 2, 10, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-06', 0, 'recited', 2, 12, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-07', 0, 'recited', 2, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-09', 0, 'recited', 2, 12, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-10', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-11', 0, 'recited', 2, 14, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-12', 0, 'recited', 2, 18, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-11-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-14', 0, 'recited', 2, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-16', 0, 'recited', 2, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-17', 0, 'recited', 2, 11, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-11-18', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-19', 0, 'recited', 2, 15, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 2, '2025-11-19', '2025-11-19', 'pass', 'Qari Ahmed', 1, 'Zabat: 41/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 8/10\nTotal: 81/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-20', 0, 'recited', 3, 13, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-21', 0, 'recited', 3, 15, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-23', 0, 'recited', 3, 11, 'needs_work', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-24', 0, 'recited', 3, 17, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-25', 0, 'recited', 3, 15, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-26', 0, 'recited', 3, 14, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-27', 0, 'recited', 3, 10, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-28', 0, 'recited', 3, 11, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-11-30', 0, 'recited', 3, 18, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-01', 0, 'recited', 3, 11, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-02', 0, 'recited', 3, 12, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-03', 0, 'recited', 3, 18, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-04', 0, 'recited', 3, 16, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-05', 0, 'recited', 3, 12, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-07', 0, 'recited', 3, 13, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-08', 0, 'recited', 3, 11, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-09', 0, 'recited', 3, 13, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-10', 0, 'recited', 3, 15, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-11', 0, 'recited', 3, 11, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-12', 0, 'recited', 3, 18, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-14', 0, 'recited', 3, 14, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-15', 0, 'recited', 3, 11, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-16', 0, 'recited', 3, 10, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 3, '2025-12-16', '2025-12-16', 'pass', 'Qari Ahmed', 1, 'Zabat: 45/50\nTajweed: 20/20\nLehja: 9/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 92/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-17', 0, 'recited', 4, 13, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-18', 0, 'recited', 4, 15, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-19', 0, 'recited', 4, 16, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-21', 0, 'recited', 4, 15, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-22', 0, 'recited', 4, 13, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-12-23', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2025-12-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-25', 0, 'recited', 4, 16, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-26', 0, 'recited', 4, 11, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-28', 0, 'recited', 4, 18, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-29', 0, 'recited', 4, 12, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-30', 0, 'recited', 4, 13, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2025-12-31', 0, 'recited', 4, 10, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-01', 0, 'recited', 4, 18, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-02', 0, 'recited', 4, 13, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-04', 0, 'recited', 4, 15, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-01-05', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-01-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-01-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-08', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-09', 0, 'recited', 4, 11, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-11', 0, 'recited', 4, 17, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-12', 0, 'recited', 4, 17, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-13', 0, 'recited', 4, 18, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-14', 0, 'recited', 4, 11, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-15', 0, 'recited', 4, 17, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 4, '2026-01-15', '2026-01-15', 'pass', 'Qari Uthman', 1, 'Zabat: 40/50\nTajweed: 16/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 81/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-16', 0, 'recited', 5, 16, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-18', 0, 'recited', 5, 13, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-19', 0, 'recited', 5, 15, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-20', 0, 'recited', 5, 16, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-21', 0, 'recited', 5, 11, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-22', 0, 'recited', 5, 18, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-23', 0, 'recited', 5, 15, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-25', 0, 'recited', 5, 15, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-01-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-27', 0, 'recited', 5, 14, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-28', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-29', 0, 'recited', 5, 11, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-01-30', 0, 'recited', 5, 17, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-01', 0, 'recited', 5, 14, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-02', 0, 'recited', 5, 10, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-03', 0, 'recited', 5, 12, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-04', 0, 'recited', 5, 11, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-05', 0, 'recited', 5, 14, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-06', 0, 'recited', 5, 18, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-08', 0, 'recited', 5, 16, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-09', 0, 'recited', 5, 13, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-10', 0, 'recited', 5, 10, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-11', 0, 'recited', 5, 14, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 5, '2026-02-11', '2026-02-11', 'pass', 'Qari Ahmed', 0, 'Zabat: 44/50\nTajweed: 19/20\nLehja: 8/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-12', 0, 'recited', 6, 13, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-13', 0, 'recited', 6, 11, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-15', 0, 'recited', 6, 12, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-16', 0, 'recited', 6, 10, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-17', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-18', 0, 'recited', 6, 14, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-19', 0, 'recited', 6, 16, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-20', 0, 'recited', 6, 16, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-22', 0, 'recited', 6, 17, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-23', 0, 'recited', 6, 14, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-24', 0, 'recited', 6, 14, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-25', 0, 'recited', 6, 13, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-26', 0, 'recited', 6, 11, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-02-27', 0, 'recited', 6, 16, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-01', 0, 'recited', 6, 12, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-02', 0, 'recited', 6, 13, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-03', 0, 'recited', 6, 17, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-04', 0, 'recited', 6, 10, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-05', 0, 'recited', 6, 18, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-03-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-08', 0, 'recited', 6, 11, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-09', 0, 'recited', 6, 17, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-10', 0, 'recited', 6, 15, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 6, '2026-03-10', '2026-03-10', 'pass', 'Qari Uthman', 0, 'Zabat: 45/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-11', 0, 'recited', 7, 16, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-12', 0, 'recited', 7, 13, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-13', 0, 'recited', 7, 14, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-15', 0, 'recited', 7, 14, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-16', 0, 'recited', 7, 17, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-17', 0, 'recited', 7, 12, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-18', 0, 'recited', 7, 14, 'perfect', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-19', 0, 'recited', 7, 12, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-20', 0, 'recited', 7, 13, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-03-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-23', 0, 'recited', 7, 14, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-24', 0, 'recited', 7, 13, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-25', 0, 'recited', 7, 11, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-26', 0, 'recited', 7, 15, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-27', 0, 'recited', 7, 15, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-29', 0, 'recited', 7, 17, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-30', 0, 'recited', 7, 14, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-03-31', 0, 'recited', 7, 11, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-01', 0, 'recited', 7, 14, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-02', 0, 'recited', 7, 15, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-03', 0, 'recited', 7, 15, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-05', 0, 'recited', 7, 18, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-06', 0, 'recited', 7, 18, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 7, '2026-04-06', '2026-04-06', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-07', 0, 'recited', 8, 14, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-08', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-09', 0, 'recited', 8, 12, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-10', 0, 'recited', 8, 12, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-12', 0, 'recited', 8, 17, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-13', 0, 'recited', 8, 15, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-14', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-15', 0, 'recited', 8, 10, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-17', 0, 'recited', 8, 11, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-19', 0, 'recited', 8, 17, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-20', 0, 'recited', 8, 15, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-21', 0, 'recited', 8, 10, 'needs_work', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-23', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-04-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-26', 0, 'recited', 8, 16, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-27', 0, 'recited', 8, 15, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-28', 0, 'recited', 8, 13, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-29', 0, 'recited', 8, 18, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-04-30', 0, 'recited', 8, 16, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-01', 0, 'recited', 8, 10, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-03', 0, 'recited', 8, 16, 'perfect', 'average', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-04', 0, 'recited', 8, 13, 'perfect', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-05', 0, 'recited', 8, 17, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-06', 0, 'recited', 8, 14, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-07', 0, 'recited', 8, 15, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-08', 0, 'recited', 8, 18, 'needs_work', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 8, '2026-05-08', '2026-05-08', 'pass', 'Qari Uthman', 0, 'Zabat: 42/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 82/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-10', 0, 'recited', 9, 15, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-05-11', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-12', 0, 'recited', 9, 15, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-13', 0, 'recited', 9, 16, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-14', 0, 'recited', 9, 10, 'minor_errors', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-15', 0, 'recited', 9, 14, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-05-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-18', 0, 'recited', 9, 11, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-19', 0, 'recited', 9, 10, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-20', 0, 'recited', 9, 15, 'needs_work', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-21', 0, 'recited', 9, 13, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-22', 0, 'recited', 9, 12, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-24', 0, 'recited', 9, 15, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-25', 0, 'recited', 9, 17, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-26', 0, 'recited', 9, 18, 'minor_errors', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-27', 0, 'recited', 9, 16, 'perfect', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-28', 0, 'recited', 9, 12, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-29', 0, 'recited', 9, 14, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-05-31', 0, 'recited', 9, 13, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-01', 0, 'recited', 9, 14, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-02', 0, 'recited', 9, 15, 'needs_work', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-03', 0, 'recited', 9, 14, 'perfect', 'excellent', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-04', 0, 'recited', 9, 11, 'minor_errors', 'average', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-05', 0, 'recited', 9, 13, 'perfect', 'good', 'recited', 8, 'recited', 6, 8);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 9, '2026-06-05', '2026-06-05', 'pass', 'Qari Ahmed', 1, 'Zabat: 46/50\nTajweed: 19/20\nLehja: 9/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-07', 0, 'recited', 10, 15, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-08', 0, 'recited', 10, 11, 'perfect', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-09', 0, 'recited', 10, 15, 'needs_work', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-10', 0, 'recited', 10, 18, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-11', 0, 'recited', 10, 14, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-12', 0, 'recited', 10, 12, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-14', 0, 'recited', 10, 12, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-15', 0, 'recited', 10, 11, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-16', 0, 'recited', 10, 11, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-17', 0, 'recited', 10, 10, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-18', 0, 'recited', 10, 16, 'minor_errors', 'average', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-19', 0, 'recited', 10, 18, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-21', 0, 'recited', 10, 14, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-22', 0, 'recited', 10, 15, 'needs_work', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-23', 0, 'recited', 10, 11, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-24', 0, 'recited', 10, 13, 'needs_work', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-06-25', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-26', 0, 'recited', 10, 13, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-28', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-06-29', 0, 'recited', 10, 13, 'needs_work', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-06-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-07-01', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-02', 0, 'recited', 10, 11, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-03', 0, 'recited', 10, 11, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-05', 0, 'recited', 10, 15, 'minor_errors', 'good', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-07-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-07', 0, 'recited', 10, 16, 'minor_errors', 'excellent', 'recited', 9, 'recited', 7, 9);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 10, '2026-07-07', '2026-07-07', 'pass', 'Qari Uthman', 0, 'Zabat: 49/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-08', 0, 'recited', 11, 15, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-09', 0, 'recited', 11, 18, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-10', 0, 'recited', 11, 14, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-12', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-13', 0, 'recited', 11, 17, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-07-14', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-15', 0, 'recited', 11, 13, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-16', 0, 'recited', 11, 15, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-17', 0, 'recited', 11, 15, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-19', 0, 'recited', 11, 12, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-20', 0, 'recited', 11, 12, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-21', 0, 'recited', 11, 11, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-22', 0, 'recited', 11, 11, 'perfect', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-23', 0, 'recited', 11, 15, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-24', 0, 'recited', 11, 18, 'needs_work', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-26', 0, 'recited', 11, 12, 'minor_errors', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-27', 0, 'recited', 11, 17, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-28', 0, 'recited', 11, 16, 'minor_errors', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-29', 0, 'recited', 11, 11, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-30', 0, 'recited', 11, 16, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-07-31', 0, 'recited', 11, 10, 'minor_errors', 'good', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-02', 0, 'recited', 11, 15, 'perfect', 'excellent', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 220, '2026-08-03', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-04', 0, 'recited', 11, 16, 'needs_work', 'average', 'recited', 10, 'recited', 8, 10);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 220, 11, '2026-08-04', '2026-08-04', 'pass', 'Qari Uthman', 0, 'Zabat: 44/50\nTajweed: 19/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-05', 0, 'recited', 12, 13, 'perfect', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-06', 0, 'recited', 12, 14, 'needs_work', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-07', 0, 'recited', 12, 12, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-09', 0, 'recited', 12, 18, 'minor_errors', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-10', 0, 'recited', 12, 15, 'perfect', 'excellent', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-11', 0, 'recited', 12, 18, 'perfect', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-12', 0, 'recited', 12, 10, 'perfect', 'average', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-13', 0, 'recited', 12, 15, 'minor_errors', 'good', 'recited', 11, 'recited', 9, 11);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 220, '2026-08-14', 0, 'recited', 12, 10, 'minor_errors', 'excellent', 'recited', 11, 'recited', 9, 11);
UPDATE hifz_enrollment 
                SET current_para = 12, 
                    current_para_lines_done = 125,
                    total_lines_memorized = 3527,
                    current_streak_days = 10,
                    longest_streak_days = 33,
                    avg_lines_30d = 13.35,
                    current_phase = 'mid',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 220;

INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-01-26', 0, 'recited', 1, 10, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-01-27', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-01-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-01-29', 0, 'recited', 1, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-01-30', 0, 'recited', 1, 13, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-01', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-02', 0, 'recited', 1, 14, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-03', 0, 'recited', 1, 14, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-04', 0, 'recited', 1, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-05', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-06', 0, 'recited', 1, 11, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-08', 0, 'recited', 1, 16, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-02-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-10', 0, 'recited', 1, 14, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-11', 0, 'recited', 1, 18, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-02-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-02-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-15', 0, 'recited', 1, 10, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-16', 0, 'recited', 1, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-17', 0, 'recited', 1, 15, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-18', 0, 'recited', 1, 14, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-19', 0, 'recited', 1, 14, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-02-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-22', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-23', 0, 'recited', 1, 16, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-24', 0, 'recited', 1, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-25', 0, 'recited', 1, 14, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 1, '2026-02-25', '2026-02-25', 'pass', 'Qari Ahmed', 1, 'Zabat: 44/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 85/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-26', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-02-27', 0, 'recited', 2, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-01', 0, 'recited', 2, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-02', 0, 'recited', 2, 11, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-03', 0, 'recited', 2, 11, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-04', 0, 'recited', 2, 13, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-05', 0, 'recited', 2, 13, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-06', 0, 'recited', 2, 13, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-08', 0, 'recited', 2, 18, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-09', 0, 'recited', 2, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-10', 0, 'recited', 2, 18, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-11', 0, 'recited', 2, 16, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-12', 0, 'recited', 2, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-13', 0, 'recited', 2, 12, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-15', 0, 'recited', 2, 13, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-16', 0, 'recited', 2, 17, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-17', 0, 'recited', 2, 16, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-18', 0, 'recited', 2, 14, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-19', 0, 'recited', 2, 12, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-20', 0, 'recited', 2, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-22', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-23', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 2, '2026-03-23', '2026-03-23', 'pass', 'Qari Ahmed', 1, 'Zabat: 48/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 91/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-24', 0, 'recited', 3, 18, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-25', 0, 'recited', 3, 13, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-26', 0, 'recited', 3, 15, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-27', 0, 'recited', 3, 14, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-03-29', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-30', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-03-31', 0, 'recited', 3, 11, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-01', 0, 'recited', 3, 11, 'needs_work', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-02', 0, 'recited', 3, 12, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-03', 0, 'recited', 3, 14, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-05', 0, 'recited', 3, 17, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-06', 0, 'recited', 3, 17, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-07', 0, 'recited', 3, 11, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-08', 0, 'recited', 3, 16, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-09', 0, 'recited', 3, 16, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-04-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-12', 0, 'recited', 3, 13, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-13', 0, 'recited', 3, 10, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-14', 0, 'recited', 3, 10, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-15', 0, 'recited', 3, 10, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-16', 0, 'recited', 3, 13, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-17', 0, 'recited', 3, 18, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-19', 0, 'recited', 3, 14, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-20', 0, 'recited', 3, 15, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 3, '2026-04-20', '2026-04-20', 'pass', 'Qari Uthman', 0, 'Zabat: 49/50\nTajweed: 18/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 9/10\nTotal: 96/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-21', 0, 'recited', 4, 14, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-04-22', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-23', 0, 'recited', 4, 15, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-24', 0, 'recited', 4, 15, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-26', 0, 'recited', 4, 15, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-27', 0, 'recited', 4, 15, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-28', 0, 'recited', 4, 13, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-29', 0, 'recited', 4, 15, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-04-30', 0, 'recited', 4, 12, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-01', 0, 'recited', 4, 17, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-03', 0, 'recited', 4, 12, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-04', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-05', 0, 'recited', 4, 16, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-05-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-07', 0, 'recited', 4, 17, 'perfect', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-08', 0, 'recited', 4, 18, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-10', 0, 'recited', 4, 16, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-11', 0, 'recited', 4, 11, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-12', 0, 'recited', 4, 14, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-13', 0, 'recited', 4, 12, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-14', 0, 'recited', 4, 14, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-15', 0, 'recited', 4, 15, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-05-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-18', 0, 'recited', 4, 15, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 4, '2026-05-18', '2026-05-18', 'pass', 'Qari Ahmed', 1, 'Zabat: 41/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 8/10\nTotal: 82/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-19', 0, 'recited', 5, 15, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-20', 0, 'recited', 5, 15, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-21', 0, 'recited', 5, 12, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-22', 0, 'recited', 5, 10, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-24', 0, 'recited', 5, 10, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-25', 0, 'recited', 5, 16, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-26', 0, 'recited', 5, 16, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-27', 0, 'recited', 5, 10, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-28', 0, 'recited', 5, 14, 'needs_work', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-29', 0, 'recited', 5, 10, 'perfect', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-05-31', 0, 'recited', 5, 15, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-01', 0, 'recited', 5, 14, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-02', 0, 'recited', 5, 12, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-03', 0, 'recited', 5, 10, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-04', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-05', 0, 'recited', 5, 17, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-06-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-08', 0, 'recited', 5, 15, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-09', 0, 'recited', 5, 18, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-06-10', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-11', 0, 'recited', 5, 16, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-12', 0, 'recited', 5, 13, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-14', 0, 'recited', 5, 10, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-15', 0, 'recited', 5, 13, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-16', 0, 'recited', 5, 11, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 5, '2026-06-16', '2026-06-16', 'pass', 'Qari Ahmed', 0, 'Zabat: 46/50\nTajweed: 16/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-17', 0, 'recited', 6, 15, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-18', 0, 'recited', 6, 16, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-19', 0, 'recited', 6, 14, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-21', 0, 'recited', 6, 16, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-22', 0, 'recited', 6, 14, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-23', 0, 'recited', 6, 13, 'needs_work', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-06-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-25', 0, 'recited', 6, 11, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-26', 0, 'recited', 6, 16, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-28', 0, 'recited', 6, 13, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-06-29', 0, 'recited', 6, 12, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-06-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-01', 0, 'recited', 6, 10, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-02', 0, 'recited', 6, 18, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-03', 0, 'recited', 6, 16, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-05', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-07-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-07', 0, 'recited', 6, 13, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-08', 0, 'recited', 6, 12, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-09', 0, 'recited', 6, 10, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-10', 0, 'recited', 6, 18, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-12', 0, 'recited', 6, 16, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-13', 0, 'recited', 6, 12, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-14', 0, 'recited', 6, 17, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 6, '2026-07-14', '2026-07-14', 'pass', 'Qari Ahmed', 0, 'Zabat: 41/50\nTajweed: 20/20\nLehja: 8/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-15', 0, 'recited', 7, 10, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-16', 0, 'recited', 7, 15, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-17', 0, 'recited', 7, 16, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-19', 0, 'recited', 7, 13, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-07-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-21', 0, 'recited', 7, 17, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-22', 0, 'recited', 7, 15, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-23', 0, 'recited', 7, 18, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-24', 0, 'recited', 7, 15, 'needs_work', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-26', 0, 'recited', 7, 17, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-27', 0, 'recited', 7, 13, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-28', 0, 'recited', 7, 18, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-29', 0, 'recited', 7, 15, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-30', 0, 'recited', 7, 17, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-07-31', 0, 'recited', 7, 13, 'needs_work', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-02', 0, 'recited', 7, 16, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-03', 0, 'recited', 7, 14, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-04', 0, 'recited', 7, 17, 'perfect', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-05', 0, 'recited', 7, 16, 'needs_work', 'good', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-06', 0, 'recited', 7, 16, 'minor_errors', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-07', 0, 'recited', 7, 11, 'perfect', 'excellent', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 222, 7, '2026-08-07', '2026-08-07', 'pass', 'Qari Uthman', 1, 'Zabat: 45/50\nTajweed: 18/20\nLehja: 7/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 88/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-09', 0, 'recited', 8, 12, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-10', 0, 'recited', 8, 10, 'minor_errors', 'excellent', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-11', 0, 'recited', 8, 16, 'needs_work', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-12', 0, 'recited', 8, 14, 'perfect', 'good', 'recited', 7, 'recited', 5, 7);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 222, '2026-08-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 222, '2026-08-14', 0, 'recited', 8, 17, 'minor_errors', 'good', 'recited', 7, 'recited', 5, 7);
UPDATE hifz_enrollment 
                SET current_para = 8, 
                    current_para_lines_done = 69,
                    total_lines_memorized = 2197,
                    current_streak_days = 1,
                    longest_streak_days = 30,
                    avg_lines_30d = 13.88,
                    current_phase = 'early',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 222;

INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-15', 0, 'recited', 1, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-16', 0, 'recited', 1, 11, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-17', 0, 'recited', 1, 11, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-02-18', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-19', 0, 'recited', 1, 11, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-20', 0, 'recited', 1, 13, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-22', 0, 'recited', 1, 17, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-23', 0, 'recited', 1, 17, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-02-24', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-25', 0, 'recited', 1, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-02-26', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-02-27', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-01', 0, 'recited', 1, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-02', 0, 'recited', 1, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-03-03', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-04', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-05', 0, 'recited', 1, 13, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-06', 0, 'recited', 1, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-08', 0, 'recited', 1, 11, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-09', 0, 'recited', 1, 18, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-10', 0, 'recited', 1, 18, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-11', 0, 'recited', 1, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-12', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-03-13', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-15', 0, 'recited', 1, 13, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-16', 0, 'recited', 1, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 1, '2026-03-16', '2026-03-16', 'pass', 'Qari Uthman', 0, 'Zabat: 47/50\nTajweed: 16/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-17', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-18', 0, 'recited', 2, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-19', 0, 'recited', 2, 17, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-20', 0, 'recited', 2, 17, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-22', 0, 'recited', 2, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-23', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-24', 0, 'recited', 2, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-25', 0, 'recited', 2, 15, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-26', 0, 'recited', 2, 10, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-27', 0, 'recited', 2, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-29', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-03-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-03-31', 0, 'recited', 2, 14, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-01', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-02', 0, 'recited', 2, 10, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-03', 0, 'recited', 2, 18, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-05', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-06', 0, 'recited', 2, 11, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-07', 0, 'recited', 2, 16, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-08', 0, 'recited', 2, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-04-09', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-10', 0, 'recited', 2, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-12', 0, 'recited', 2, 18, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-13', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 2, '2026-04-13', '2026-04-13', 'pass', 'Qari Uthman', 0, 'Zabat: 50/50\nTajweed: 20/20\nLehja: 10/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 98/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-14', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-15', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-16', 0, 'recited', 3, 14, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-17', 0, 'recited', 3, 14, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-19', 0, 'recited', 3, 14, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-20', 0, 'recited', 3, 12, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-04-21', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-22', 0, 'recited', 3, 13, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-23', 0, 'recited', 3, 11, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-24', 0, 'recited', 3, 10, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-26', 0, 'recited', 3, 10, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-27', 0, 'recited', 3, 17, 'minor_errors', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-28', 0, 'recited', 3, 15, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-04-29', 0, 'recited', 3, 12, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-04-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-01', 0, 'recited', 3, 17, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-03', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-04', 0, 'recited', 3, 14, 'needs_work', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-05', 0, 'recited', 3, 18, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-06', 0, 'recited', 3, 18, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-05-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-05-08', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-10', 0, 'recited', 3, 15, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-11', 0, 'recited', 3, 10, 'needs_work', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-12', 0, 'recited', 3, 16, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-13', 0, 'recited', 3, 11, 'perfect', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 3, '2026-05-13', '2026-05-13', 'pass', 'Qari Uthman', 1, 'Zabat: 45/50\nTajweed: 16/20\nLehja: 10/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 89/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-14', 0, 'recited', 4, 12, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-15', 0, 'recited', 4, 10, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-17', 0, 'recited', 4, 18, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-18', 0, 'recited', 4, 12, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-19', 0, 'recited', 4, 18, 'perfect', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-20', 0, 'recited', 4, 12, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-21', 0, 'recited', 4, 15, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-22', 0, 'recited', 4, 13, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-24', 0, 'recited', 4, 18, 'needs_work', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-25', 0, 'recited', 4, 13, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-26', 0, 'recited', 4, 13, 'minor_errors', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-27', 0, 'recited', 4, 15, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-28', 0, 'recited', 4, 14, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-29', 0, 'recited', 4, 17, 'minor_errors', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-05-31', 0, 'recited', 4, 16, 'needs_work', 'excellent', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-01', 0, 'recited', 4, 17, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-02', 0, 'recited', 4, 13, 'perfect', 'average', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-03', 0, 'recited', 4, 11, 'perfect', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-04', 0, 'recited', 4, 17, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-05', 0, 'recited', 4, 13, 'minor_errors', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-07', 0, 'recited', 4, 13, 'needs_work', 'good', 'recited', 3, 'recited', 1, 3);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 4, '2026-06-07', '2026-06-07', 'pass', 'Qari Ahmed', 1, 'Zabat: 50/50\nTajweed: 19/20\nLehja: 10/10\nAttendance: 10/10\nTarbiyah: 10/10\nTotal: 99/100');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-06-08', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-09', 0, 'recited', 5, 11, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-10', 0, 'recited', 5, 17, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-11', 0, 'recited', 5, 17, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-12', 0, 'recited', 5, 11, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-14', 0, 'recited', 5, 11, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-15', 0, 'recited', 5, 10, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-16', 0, 'recited', 5, 18, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-06-17', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-18', 0, 'recited', 5, 14, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-19', 0, 'recited', 5, 18, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-21', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-22', 0, 'recited', 5, 10, 'perfect', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-23', 0, 'recited', 5, 12, 'needs_work', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-24', 0, 'recited', 5, 12, 'perfect', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-25', 0, 'recited', 5, 10, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-26', 0, 'recited', 5, 15, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-28', 0, 'recited', 5, 14, 'needs_work', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-29', 0, 'recited', 5, 11, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-06-30', 0, 'recited', 5, 13, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-01', 0, 'recited', 5, 17, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-02', 0, 'recited', 5, 15, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-03', 0, 'recited', 5, 11, 'minor_errors', 'excellent', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-05', 0, 'recited', 5, 15, 'minor_errors', 'average', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-07-06', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-07', 0, 'recited', 5, 15, 'minor_errors', 'good', 'recited', 4, 'recited', 2, 4);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 5, '2026-07-07', '2026-07-07', 'pass', 'Qari Ahmed', 0, 'Zabat: 41/50\nTajweed: 19/20\nLehja: 8/10\nAttendance: 10/10\nTarbiyah: 8/10\nTotal: 86/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-08', 0, 'recited', 6, 14, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-09', 0, 'recited', 6, 13, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-10', 0, 'recited', 6, 11, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-12', 0, 'recited', 6, 15, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-13', 0, 'recited', 6, 10, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-14', 0, 'recited', 6, 12, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-15', 0, 'recited', 6, 11, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-07-16', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-17', 0, 'recited', 6, 13, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-19', 0, 'recited', 6, 17, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-20', 0, 'recited', 6, 13, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-21', 0, 'recited', 6, 17, 'perfect', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-22', 0, 'recited', 6, 12, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-23', 0, 'recited', 6, 16, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-24', 0, 'recited', 6, 16, 'minor_errors', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-26', 0, 'recited', 6, 11, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-07-27', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-07-28', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-29', 0, 'recited', 6, 10, 'needs_work', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-30', 0, 'recited', 6, 11, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-07-31', 0, 'recited', 6, 10, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-02', 0, 'recited', 6, 13, 'minor_errors', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-08-03', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-04', 0, 'recited', 6, 11, 'perfect', 'average', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-05', 0, 'recited', 6, 12, 'minor_errors', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-06', 0, 'recited', 6, 15, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-08-07', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-09', 0, 'recited', 6, 10, 'perfect', 'good', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-10', 0, 'recited', 6, 12, 'needs_work', 'excellent', 'recited', 5, 'recited', 3, 5);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 224, 6, '2026-08-10', '2026-08-10', 'pass', 'Qari Ahmed', 1, 'Zabat: 42/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 10/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-11', 0, 'recited', 7, 11, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 224, '2026-08-12', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-13', 0, 'recited', 7, 12, 'minor_errors', 'average', 'recited', 6, 'recited', 4, 6);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 224, '2026-08-14', 0, 'recited', 7, 10, 'minor_errors', 'good', 'recited', 6, 'recited', 4, 6);
UPDATE hifz_enrollment 
                SET current_para = 7, 
                    current_para_lines_done = 33,
                    total_lines_memorized = 1858,
                    current_streak_days = 2,
                    longest_streak_days = 25,
                    avg_lines_30d = 9.69,
                    current_phase = 'early',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 224;

INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 226, '2026-06-15', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-16', 0, 'recited', 1, 17, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-17', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-18', 0, 'recited', 1, 15, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-19', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-21', 0, 'recited', 1, 18, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-22', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-23', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-24', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-25', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-26', 0, 'recited', 1, 12, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-28', 0, 'recited', 1, 10, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-29', 0, 'recited', 1, 17, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-06-30', 0, 'recited', 1, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-01', 0, 'recited', 1, 11, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-02', 0, 'recited', 1, 15, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-03', 0, 'recited', 1, 16, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-05', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-06', 0, 'recited', 1, 11, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-07', 0, 'recited', 1, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-08', 0, 'recited', 1, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-09', 0, 'recited', 1, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-10', 0, 'recited', 1, 10, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 226, 1, '2026-07-10', '2026-07-10', 'pass', 'Qari Uthman', 1, 'Zabat: 48/50\nTajweed: 17/20\nLehja: 10/10\nAttendance: 9/10\nTarbiyah: 10/10\nTotal: 94/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-12', 0, 'recited', 2, 12, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-13', 0, 'recited', 2, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-14', 0, 'recited', 2, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-15', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-16', 0, 'recited', 2, 11, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-17', 0, 'recited', 2, 13, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-19', 0, 'recited', 2, 10, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 226, '2026-07-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-21', 0, 'recited', 2, 12, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-22', 0, 'recited', 2, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-23', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-24', 0, 'recited', 2, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-26', 0, 'recited', 2, 14, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-27', 0, 'recited', 2, 16, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-28', 0, 'recited', 2, 18, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-29', 0, 'recited', 2, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-30', 0, 'recited', 2, 16, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-07-31', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-02', 0, 'recited', 2, 14, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-03', 0, 'recited', 2, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-04', 0, 'recited', 2, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-05', 0, 'recited', 2, 14, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-06', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 226, 2, '2026-08-06', '2026-08-06', 'pass', 'Qari Uthman', 1, 'Zabat: 49/50\nTajweed: 17/20\nLehja: 7/10\nAttendance: 8/10\nTarbiyah: 9/10\nTotal: 90/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-07', 0, 'recited', 3, 18, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-09', 0, 'recited', 3, 12, 'minor_errors', 'good', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-10', 0, 'recited', 3, 17, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-11', 0, 'recited', 3, 15, 'perfect', 'average', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-12', 0, 'recited', 3, 10, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-13', 0, 'recited', 3, 11, 'perfect', 'excellent', 'recited', 2, 'recited', 1, 2);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 226, '2026-08-14', 0, 'recited', 3, 11, 'minor_errors', 'average', 'recited', 2, 'recited', 1, 2);
UPDATE hifz_enrollment 
                SET current_para = 3, 
                    current_para_lines_done = 94,
                    total_lines_memorized = 698,
                    current_streak_days = 22,
                    longest_streak_days = 29,
                    avg_lines_30d = 13.15,
                    current_phase = 'early',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 226;

INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 228, '2026-06-30', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-01', 0, 'recited', 1, 12, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-02', 0, 'recited', 1, 10, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-03', 0, 'recited', 1, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-05', 0, 'recited', 1, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-06', 0, 'recited', 1, 11, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-07', 0, 'recited', 1, 13, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-08', 0, 'recited', 1, 17, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-09', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-10', 0, 'recited', 1, 18, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-12', 0, 'recited', 1, 15, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-13', 0, 'recited', 1, 12, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-14', 0, 'recited', 1, 12, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-15', 0, 'recited', 1, 18, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-16', 0, 'recited', 1, 17, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-17', 0, 'recited', 1, 12, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-19', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                        (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabqi_status, manzil_status) 
                        VALUES (4, 228, '2026-07-20', 1, 'not_recited', 'not_recited', 'not_recited');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-21', 0, 'recited', 1, 13, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-22', 0, 'recited', 1, 17, 'needs_work', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-23', 0, 'recited', 1, 17, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-24', 0, 'recited', 1, 18, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-26', 0, 'recited', 1, 14, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_para_completions 
                        (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self, test_notes)
                        VALUES (4, 228, 1, '2026-07-26', '2026-07-26', 'pass', 'Qari Uthman', 1, 'Zabat: 44/50\nTajweed: 15/20\nLehja: 7/10\nAttendance: 9/10\nTarbiyah: 9/10\nTotal: 84/100');
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-27', 0, 'recited', 2, 10, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-28', 0, 'recited', 2, 11, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-29', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-30', 0, 'recited', 2, 14, 'perfect', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-07-31', 0, 'recited', 2, 18, 'perfect', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-02', 0, 'recited', 2, 18, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-03', 0, 'recited', 2, 15, 'perfect', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-04', 0, 'recited', 2, 11, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-05', 0, 'recited', 2, 18, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-06', 0, 'recited', 2, 12, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-07', 0, 'recited', 2, 10, 'needs_work', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-09', 0, 'recited', 2, 15, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-10', 0, 'recited', 2, 10, 'minor_errors', 'good', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-11', 0, 'recited', 2, 14, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-12', 0, 'recited', 2, 10, 'minor_errors', 'excellent', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-13', 0, 'recited', 2, 14, 'minor_errors', 'average', 'recited', 1, 'recited', 1, 1);
INSERT INTO hifz_diary_entries 
                    (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_para, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, manzil_status, manzil_from_para, manzil_to_para) 
                    VALUES (4, 228, '2026-08-14', 0, 'recited', 2, 11, 'needs_work', 'average', 'recited', 1, 'recited', 1, 1);
UPDATE hifz_enrollment 
                SET current_para = 2, 
                    current_para_lines_done = 221,
                    total_lines_memorized = 530,
                    current_streak_days = 22,
                    longest_streak_days = 22,
                    avg_lines_30d = 13.31,
                    current_phase = 'early',
                    predicted_khatam_date = NULL
                WHERE tenant_id = 4 AND student_id = 228;

SET FOREIGN_KEY_CHECKS = 1;
