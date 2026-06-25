ALTER TABLE `employees` ADD COLUMN `previous_experience_years` INT DEFAULT 0;
UPDATE `employees` SET `previous_experience_years` = `experience_years`;
