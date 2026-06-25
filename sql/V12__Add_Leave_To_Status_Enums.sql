SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- Add 'leave' to status ENUMs in hifz_diary_entries
-- ============================================================
ALTER TABLE hifz_diary_entries 
  MODIFY COLUMN sabaq_status ENUM('recited', 'not_recited', 'leave') DEFAULT 'recited',
  MODIFY COLUMN sabqi_status ENUM('recited', 'not_recited', 'leave') DEFAULT 'recited',
  MODIFY COLUMN manzil_status ENUM('recited', 'not_recited', 'leave') DEFAULT 'recited';

SET FOREIGN_KEY_CHECKS = 1;
