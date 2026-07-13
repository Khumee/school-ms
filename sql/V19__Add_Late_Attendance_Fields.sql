-- Migration: Add late attendance and school times configuration
ALTER TABLE `tenants` 
ADD COLUMN `school_start_time` TIME DEFAULT '08:00:00',
ADD COLUMN `school_end_time` TIME DEFAULT '14:00:00',
ADD COLUMN `late_threshold_minutes` INT DEFAULT 15;

ALTER TABLE `attendance_employees`
ADD COLUMN `arrival_time` TIME DEFAULT NULL,
ADD COLUMN `is_late` TINYINT(1) DEFAULT 0;
