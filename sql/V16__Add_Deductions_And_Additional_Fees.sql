-- Migration: Add Deductions to salaries, Additional Fees to fee_payments, and convert students.custom_monthly_fee to concession amount

-- 1. Add additional fee fields to fee_payments
ALTER TABLE `fee_payments` ADD COLUMN `additional_fee` DECIMAL(10,2) DEFAULT 0.00;
ALTER TABLE `fee_payments` ADD COLUMN `additional_fee_description` VARCHAR(255) DEFAULT NULL;

-- 2. Add deduction fields to salaries
ALTER TABLE `salaries` ADD COLUMN `deduction` DECIMAL(10,2) DEFAULT 0.00;
ALTER TABLE `salaries` ADD COLUMN `deduction_description` VARCHAR(255) DEFAULT NULL;

-- 3. Convert existing custom_monthly_fee from net fee to concession amount for students who have concession
UPDATE students s
JOIN classes c ON s.class_id = c.id
SET s.custom_monthly_fee = CASE 
    WHEN s.custom_monthly_fee IS NOT NULL AND c.default_monthly_fee > s.custom_monthly_fee THEN c.default_monthly_fee - s.custom_monthly_fee
    ELSE 0.00
END
WHERE s.custom_monthly_fee IS NOT NULL;
