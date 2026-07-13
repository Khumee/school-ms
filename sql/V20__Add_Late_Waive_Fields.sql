-- Migration: Add late days deduction trigger and waived late count
ALTER TABLE `tenants`
ADD COLUMN `late_days_deduction_trigger` INT DEFAULT 4;

ALTER TABLE `salaries`
ADD COLUMN `waived_late_count` INT DEFAULT 0;
