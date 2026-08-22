-- Add Gemini OCR feature toggles to tenants table
ALTER TABLE `tenants`
ADD COLUMN `feature_ocr_student` TINYINT(1) DEFAULT 0,
ADD COLUMN `feature_ocr_hifz` TINYINT(1) DEFAULT 0;

-- Create impersonation_tokens table for Super Admin impersonation
CREATE TABLE IF NOT EXISTS `impersonation_tokens` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `token` VARCHAR(255) NOT NULL UNIQUE,
    `master_admin_id` INT NOT NULL,
    `tenant_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_impersonation_master_admin` FOREIGN KEY (`master_admin_id`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_impersonation_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
