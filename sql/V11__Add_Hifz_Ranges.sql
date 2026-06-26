SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- Add Sabaq Page/Line Ranges and 3-Para Manzil Fields
-- ============================================================
ALTER TABLE hifz_diary_entries 
  ADD COLUMN sabaq_from_para TINYINT UNSIGNED NULL AFTER sabaq_status,
  ADD COLUMN sabaq_to_para   TINYINT UNSIGNED NULL AFTER sabaq_from_para,
  ADD COLUMN sabaq_from_page TINYINT UNSIGNED NULL AFTER sabaq_to_para,
  ADD COLUMN sabaq_to_page   TINYINT UNSIGNED NULL AFTER sabaq_from_page,
  ADD COLUMN sabaq_from_line TINYINT UNSIGNED NULL AFTER sabaq_to_page,
  ADD COLUMN sabaq_to_line   TINYINT UNSIGNED NULL AFTER sabaq_from_line,
  ADD COLUMN manzil_para_1   TINYINT UNSIGNED NULL AFTER manzil_status,
  ADD COLUMN manzil_para_2   TINYINT UNSIGNED NULL AFTER manzil_para_1,
  ADD COLUMN manzil_para_3   TINYINT UNSIGNED NULL AFTER manzil_para_2;

SET FOREIGN_KEY_CHECKS = 1;
