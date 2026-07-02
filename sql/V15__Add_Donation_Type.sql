-- Migration: Add donation_type to donations table
ALTER TABLE `donations` ADD COLUMN `donation_type` ENUM('Sadqa', 'Zakat') DEFAULT 'Sadqa';
