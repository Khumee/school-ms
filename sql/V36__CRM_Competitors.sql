SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- Competitor tracking for the CRM Strategy Advisor: lets sales
-- reps and the super admin log what competing products they run
-- into in the field, so it can feed AI marketing/costing analysis.
-- ============================================================

CREATE TABLE IF NOT EXISTS `crm_competitors` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `product_name` VARCHAR(150) NOT NULL,
  `website` VARCHAR(255) NULL,
  `price_offering` TEXT NULL,
  `user_base` VARCHAR(255) NULL,
  `strengths` TEXT NULL,
  `weaknesses` TEXT NULL,
  `notes` TEXT NULL,
  `added_by` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_competitors_admin` FOREIGN KEY (`added_by`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
