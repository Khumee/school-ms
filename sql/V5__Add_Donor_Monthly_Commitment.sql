-- Migration: Add monthly_commitment column to donors
ALTER TABLE `donors` ADD COLUMN `monthly_commitment` TINYINT(1) DEFAULT 0;
