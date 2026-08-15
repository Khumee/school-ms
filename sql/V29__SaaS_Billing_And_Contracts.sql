CREATE TABLE IF NOT EXISTS `tenant_contracts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `rate_per_student` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  `contract_start_date` DATE NOT NULL,
  `free_trial_start` DATE NULL,
  `free_trial_end` DATE NULL,
  `billing_start_date` DATE NOT NULL,
  `max_students_allowed` INT DEFAULT 500,
  `support_sla` VARCHAR(50) DEFAULT 'Standard 24h',
  `cancellation_notice_days` INT DEFAULT 30,
  `data_retention_days` INT DEFAULT 30,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`tenant_id`) REFERENCES `tenants`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `tenant_invoices` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `invoice_number` VARCHAR(50) NOT NULL UNIQUE,
  `billing_period_start` DATE NOT NULL,
  `billing_period_end` DATE NOT NULL,
  `issue_date` DATE NOT NULL,
  `due_date` DATE NOT NULL,
  `total_students_billed` INT NOT NULL DEFAULT 0,
  `subtotal` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
  `discount` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
  `total_amount_pkr` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
  `status` ENUM('Draft', 'Sent', 'Paid', 'Overdue', 'Cancelled') DEFAULT 'Draft',
  `notes` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`tenant_id`) REFERENCES `tenants`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `tenant_payments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `payment_date` DATE NOT NULL,
  `amount_paid` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
  `payment_method` VARCHAR(50) NOT NULL,
  `reference_number` VARCHAR(100) NULL,
  `notes` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`tenant_id`) REFERENCES `tenants`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`invoice_id`) REFERENCES `tenant_invoices`(`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
