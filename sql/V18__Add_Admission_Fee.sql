-- Migration: Add Admission Fee fields to students table
ALTER TABLE `students` ADD COLUMN `admission_fee` DECIMAL(10,2) DEFAULT 0.00;
ALTER TABLE `students` ADD COLUMN `admission_fee_status` VARCHAR(20) DEFAULT 'unpaid';
ALTER TABLE `students` ADD COLUMN `admission_fee_payment_date` DATE DEFAULT NULL;
