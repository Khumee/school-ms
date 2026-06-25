-- Migration: Add monthly_commitment_amount to donors table
ALTER TABLE `donors` ADD COLUMN `monthly_commitment_amount` DECIMAL(10,2) DEFAULT NULL;
