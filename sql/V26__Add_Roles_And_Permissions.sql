-- 1. Create Roles Table
CREATE TABLE `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `tenant_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_roles_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 2. Add 'Admin' role to all existing tenants
INSERT INTO `roles` (`name`, `tenant_id`)
SELECT 'Admin', `id` FROM `tenants`;

-- 3. Modify Users Table
ALTER TABLE `users` ADD COLUMN `role_id` INT DEFAULT NULL;

-- 4. Map existing users to the 'Admin' role if their role was 'admin'
UPDATE `users` u
JOIN `roles` r ON u.tenant_id = r.tenant_id AND r.name = 'Admin'
SET u.role_id = r.id
WHERE u.role = 'admin';

-- Map other users to 'Admin' temporarily if they have no role (safeguard) or leave them. Let's create a Default 'Staff' role for non-admins if any exist.
INSERT INTO `roles` (`name`, `tenant_id`)
SELECT DISTINCT 'Staff', u.`tenant_id` FROM `users` u WHERE u.`role` != 'admin' AND u.`role_id` IS NULL;

UPDATE `users` u
JOIN `roles` r ON u.tenant_id = r.tenant_id AND r.name = 'Staff'
SET u.role_id = r.id
WHERE u.role_id IS NULL;

-- Now safe to add FK and drop old role column
ALTER TABLE `users` ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
ALTER TABLE `users` DROP COLUMN `role`;

-- 5. Update role_permissions Table
ALTER TABLE `role_permissions` ADD COLUMN `role_id` INT DEFAULT NULL;
ALTER TABLE `role_permissions` ADD CONSTRAINT `fk_role_permissions_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

-- If there are existing permissions, we could map them, but it's likely empty or sparse. 
-- Just in case, let's map by name.
UPDATE `role_permissions` rp
JOIN `roles` r ON rp.tenant_id = r.tenant_id AND rp.role = r.name
SET rp.role_id = r.id;

-- Drop old role column from role_permissions
ALTER TABLE `role_permissions` DROP COLUMN `role`;

-- 6. Insert full permissions for 'Admin' roles
INSERT INTO `role_permissions` (`role_id`, `function_name`, `allowed`, `tenant_id`)
SELECT r.id, p.perm, 1, r.tenant_id
FROM `roles` r
CROSS JOIN (
    SELECT 'Dashboard' AS perm UNION ALL
    SELECT 'Students' UNION ALL
    SELECT 'Employees' UNION ALL
    SELECT 'Fees' UNION ALL
    SELECT 'Donations' UNION ALL
    SELECT 'Attendance' UNION ALL
    SELECT 'Ledgers' UNION ALL
    SELECT 'Hifz' UNION ALL
    SELECT 'Settings'
) p
WHERE r.name = 'Admin';
