ALTER TABLE `tenants`
ADD COLUMN `easypaisa_number` VARCHAR(100) NULL AFTER `fee_account_number`,
ADD COLUMN `jazzcash_number` VARCHAR(100) NULL AFTER `easypaisa_number`;
