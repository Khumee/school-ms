CREATE TABLE IF NOT EXISTS `holidays` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `tenant_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    UNIQUE KEY `unique_holiday_date` (`tenant_id`, `date`),
    CONSTRAINT `fk_holidays_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
