ALTER TABLE `tenant_contracts` ADD COLUMN `status` ENUM('Draft', 'Finalized') DEFAULT 'Draft' AFTER `tenant_id`;
