ALTER TABLE `students` 
ADD COLUMN `family_members` INT DEFAULT NULL,
ADD COLUMN `siblings` INT DEFAULT NULL,
ADD COLUMN `school_going_siblings` INT DEFAULT NULL,
ADD COLUMN `monthly_income` VARCHAR(100) DEFAULT NULL;
