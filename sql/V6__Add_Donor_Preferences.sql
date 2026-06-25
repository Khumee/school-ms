-- Migration: Add preferred_fund_category and preferred_payment_method to donors table
ALTER TABLE `donors` 
ADD COLUMN `preferred_fund_category` VARCHAR(50) DEFAULT 'general',
ADD COLUMN `preferred_payment_method` VARCHAR(50) DEFAULT 'Online';
