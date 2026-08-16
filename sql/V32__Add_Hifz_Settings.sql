ALTER TABLE `tenants` 
ADD COLUMN `hifz_pages_per_para` INT DEFAULT 20,
ADD COLUMN `hifz_lines_per_page` INT DEFAULT 15,
ADD COLUMN `hifz_total_pages` INT DEFAULT 600;
