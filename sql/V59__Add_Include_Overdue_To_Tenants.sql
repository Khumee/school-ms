ALTER TABLE `tenants`
ADD COLUMN `include_overdue_in_challans` TINYINT(1) DEFAULT 1 AFTER `fee_start_year`;
