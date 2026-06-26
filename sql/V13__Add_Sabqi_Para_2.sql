SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- Add sabqi_para_2 to allow multiple recent paras in Sabqi
-- ============================================================
ALTER TABLE hifz_diary_entries 
  ADD COLUMN sabqi_para_2 TINYINT UNSIGNED NULL AFTER sabqi_para;

SET FOREIGN_KEY_CHECKS = 1;
