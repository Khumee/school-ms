-- Migration: Add for_month to donations to track intended month independently of payment date

ALTER TABLE `donations` ADD COLUMN `for_month` VARCHAR(7);

-- Backfill existing data with the YYYY-MM of the payment date
UPDATE `donations` SET `for_month` = DATE_FORMAT(`date`, '%Y-%m');
