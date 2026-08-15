-- Fix the unique constraint on role_permissions to include role_id
-- Previously it only constrained (tenant_id, function_name) which prevented multiple roles from having the same permission.

ALTER TABLE `role_permissions` DROP FOREIGN KEY `fk_role_permissions_tenant`;
ALTER TABLE `role_permissions` DROP INDEX `unique_role_function_per_tenant`;
ALTER TABLE `role_permissions` ADD UNIQUE INDEX `unique_role_function_per_tenant` (`tenant_id`, `role_id`, `function_name`);
ALTER TABLE `role_permissions` ADD CONSTRAINT `fk_role_permissions_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE;
