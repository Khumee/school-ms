-- Support Ticketing: tenants log issues (with an optional screenshot), Super Admin support staff respond

ALTER TABLE `master_admins`
  MODIFY COLUMN `role` ENUM('super_admin', 'sales_rep', 'support_agent') NOT NULL DEFAULT 'super_admin';

CREATE TABLE IF NOT EXISTS `support_tickets` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `screenshot_path` VARCHAR(500) NULL,
  `priority` ENUM('low', 'medium', 'high') NOT NULL DEFAULT 'medium',
  `status` ENUM('open', 'in_progress', 'resolved', 'closed') NOT NULL DEFAULT 'open',
  `created_by` INT NOT NULL,
  `created_by_name` VARCHAR(150) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_support_tickets_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `support_ticket_messages` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ticket_id` INT NOT NULL,
  `sender_role` ENUM('tenant', 'support') NOT NULL,
  `sender_name` VARCHAR(150) NULL,
  `message` TEXT NULL,
  `screenshot_path` VARCHAR(500) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_support_messages_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Grant every tenant's existing Admin role access to the new Support function
INSERT INTO `role_permissions` (`role_id`, `function_name`, `allowed`, `tenant_id`)
SELECT r.id, 'Support', 1, r.tenant_id
FROM `roles` r
WHERE r.name = 'Admin'
AND NOT EXISTS (
  SELECT 1 FROM `role_permissions` rp WHERE rp.role_id = r.id AND rp.function_name = 'Support'
);
