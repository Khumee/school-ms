-- Add tiered billing columns to tenant_contracts
ALTER TABLE `tenant_contracts`
ADD COLUMN `base_students_threshold` INT NOT NULL DEFAULT 100,
ADD COLUMN `base_amount` DECIMAL(10, 2) NOT NULL DEFAULT 1000.00,
ADD COLUMN `extra_student_rate` DECIMAL(10, 2) NOT NULL DEFAULT 5.00;

-- Add tiered billing columns to crm_leads
ALTER TABLE `crm_leads`
ADD COLUMN `agreed_base_students_threshold` INT NOT NULL DEFAULT 100,
ADD COLUMN `agreed_base_amount` DECIMAL(10, 2) NOT NULL DEFAULT 1000.00,
ADD COLUMN `agreed_extra_student_rate` DECIMAL(10, 2) NOT NULL DEFAULT 5.00;
