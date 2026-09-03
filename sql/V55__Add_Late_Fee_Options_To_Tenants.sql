ALTER TABLE `tenants`
ADD COLUMN `default_late_fee_type` ENUM('fixed', 'per_day') DEFAULT 'fixed' AFTER `fine_amount_per_day`,
ADD COLUMN `fixed_late_fee_amount` DECIMAL(10, 2) DEFAULT 250.00 AFTER `default_late_fee_type`;
