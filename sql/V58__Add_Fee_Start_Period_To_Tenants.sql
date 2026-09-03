ALTER TABLE `tenants`
ADD COLUMN `fee_start_month` INT DEFAULT 8 AFTER `fixed_late_fee_amount`,
ADD COLUMN `fee_start_year` INT DEFAULT 2026 AFTER `fee_start_month`;
