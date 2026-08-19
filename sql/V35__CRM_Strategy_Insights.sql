SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- Super Admin AI Strategy Advisor: business-owner feedback log
-- and generated Gemini insight snapshots, built from real CRM
-- meeting data (crm_meetings / crm_leads).
-- ============================================================

CREATE TABLE IF NOT EXISTS `crm_strategy_feedback` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `admin_id` INT NOT NULL,
  `feedback_text` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_strategy_feedback_admin` FOREIGN KEY (`admin_id`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `crm_strategy_insights` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `generated_by` INT NOT NULL,
  `meetings_analyzed` INT DEFAULT 0,
  `feedback_analyzed` INT DEFAULT 0,
  `insight_text` MEDIUMTEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_strategy_insights_admin` FOREIGN KEY (`generated_by`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
