-- Migration: Add preferred_member column to donors table
ALTER TABLE `donors` ADD COLUMN `preferred_member` VARCHAR(100) DEFAULT NULL;
