ALTER TABLE `tenants` 
ADD COLUMN `address` TEXT NULL AFTER `school_name`,
ADD COLUMN `contact_phone` VARCHAR(50) NULL AFTER `address`,
ADD COLUMN `contact_email` VARCHAR(100) NULL AFTER `contact_phone`;
