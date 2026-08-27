ALTER TABLE `tenants` 
ADD COLUMN `enable_timetable_module` BOOLEAN DEFAULT FALSE,
ADD COLUMN `enable_exams_module` BOOLEAN DEFAULT FALSE;
