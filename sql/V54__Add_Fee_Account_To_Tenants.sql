ALTER TABLE `tenants` 
ADD COLUMN `fee_account_number` VARCHAR(100) NULL AFTER `contact_email`,
ADD COLUMN `fee_account_title` VARCHAR(100) NULL AFTER `fee_account_number`;
