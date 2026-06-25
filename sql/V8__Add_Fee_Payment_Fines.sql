-- Migration: Add fine columns to fee_payments table
ALTER TABLE `fee_payments` 
ADD COLUMN `fine_amount` DECIMAL(10,2) DEFAULT 0.00,
ADD COLUMN `fine_waived` TINYINT(1) DEFAULT 0;
