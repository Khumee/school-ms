SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Tenants Table
DROP TABLE IF EXISTS `tenants`;
CREATE TABLE `tenants` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `subdomain` VARCHAR(100) NOT NULL UNIQUE,
  `custom_domain` VARCHAR(255) UNIQUE,
  `status` ENUM('active', 'suspended', 'maintenance') DEFAULT 'active',
  `plan_tier` ENUM('free', 'pro', 'enterprise') DEFAULT 'free',
  `max_students` INT DEFAULT 200,
  `max_employees` INT DEFAULT 30,
  `max_classes` INT DEFAULT 15,
  `enable_custom_branding` TINYINT(1) DEFAULT 0,
  `logo_url` VARCHAR(255) DEFAULT '/images/default_logo.png',
  `school_name` VARCHAR(255) NOT NULL,
  `primary_color` VARCHAR(7) DEFAULT '#3b82f6',
  `secondary_color` VARCHAR(7) DEFAULT '#1d4ed8',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 2. Master Admins Table
DROP TABLE IF EXISTS `master_admins`;
CREATE TABLE `master_admins` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) UNIQUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 3. Sessions Table
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `is_active` TINYINT(1) DEFAULT 0,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sessions_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 4. Classes Table
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `default_monthly_fee` DECIMAL(10,2) DEFAULT 0.00,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_classes_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 5. Users Table
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(50) DEFAULT 'employee',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username_per_tenant` (`tenant_id`, `username`),
  CONSTRAINT `fk_users_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 6. Employees Table
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `designation` VARCHAR(100) NOT NULL,
  `role` ENUM('admin', 'teacher', 'support') DEFAULT 'teacher',
  `status` ENUM('on_payroll', 'volunteer', 'inactive') DEFAULT 'on_payroll',
  `date_of_joining` DATE DEFAULT NULL,
  `default_salary` DECIMAL(10,2) DEFAULT 0.00,
  `email` VARCHAR(100) DEFAULT NULL,
  `phone` VARCHAR(50) DEFAULT NULL,
  `cnic_number` VARCHAR(20) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `gender` ENUM('male', 'female', 'other') DEFAULT 'male',
  `qualification` VARCHAR(150) DEFAULT NULL,
  `experience_years` INT DEFAULT 0,
  `bank_account_info` VARCHAR(255) DEFAULT NULL,
  `user_id` INT DEFAULT NULL,
  UNIQUE KEY `unique_employee_name_per_tenant` (`tenant_id`, `name`),
  CONSTRAINT `fk_employees_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_employees_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 7. Students Table
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reg_no` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `class_id` INT DEFAULT NULL,
  `custom_monthly_fee` DECIMAL(10,2) DEFAULT NULL,
  `has_concession` TINYINT(1) DEFAULT 0,
  `concession_notes` TEXT DEFAULT NULL,
  `father_name` VARCHAR(100) DEFAULT NULL,
  `father_phone` VARCHAR(50) DEFAULT NULL,
  `emergency_contact` VARCHAR(50) DEFAULT NULL,
  `date_of_birth` DATE DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `gender` ENUM('male', 'female', 'other') DEFAULT 'male',
  `date_of_admission` DATE DEFAULT NULL,
  `status` ENUM('active', 'left', 'graduated') DEFAULT 'active',
  `previous_school_info` VARCHAR(255) DEFAULT NULL,
  `blood_group` VARCHAR(5) DEFAULT NULL,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_reg_no_per_tenant` (`tenant_id`, `reg_no`),
  CONSTRAINT `fk_students_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_students_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 8. Student Fee Payments (Monthly Ledger)
DROP TABLE IF EXISTS `fee_payments`;
CREATE TABLE `fee_payments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `month` TINYINT NOT NULL,
  `year` INT NOT NULL,
  `amount_paid` DECIMAL(10,2) NOT NULL,
  `payment_date` DATE NOT NULL,
  `recorded_by` INT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_payment_per_student_month` (`tenant_id`, `student_id`, `month`, `year`),
  CONSTRAINT `fk_fee_payments_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fee_payments_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fee_payments_recorded_by` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 9. Donors Registry
DROP TABLE IF EXISTS `donors`;
CREATE TABLE `donors` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `contact_no` VARCHAR(50) DEFAULT NULL,
  `referred_by` VARCHAR(100) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_donor_name_per_tenant` (`tenant_id`, `name`),
  CONSTRAINT `fk_donors_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 10. Donation Payments
DROP TABLE IF EXISTS `donations`;
CREATE TABLE `donations` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `donor_id` INT NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `date` DATE NOT NULL,
  `fund_category` ENUM('general', 'trust', 'student_support') DEFAULT 'general',
  `payment_method` VARCHAR(50) DEFAULT 'Cash',
  `notes` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_donations_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_donations_donor` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 11. Salaries Table (Payroll Tracking)
DROP TABLE IF EXISTS `salaries`;
CREATE TABLE `salaries` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `month` TINYINT NOT NULL,
  `year` INT NOT NULL,
  `basic_salary` DECIMAL(10,2) NOT NULL,
  `bonus` DECIMAL(10,2) DEFAULT 0.00,
  `bonus_description` VARCHAR(255) DEFAULT NULL,
  `paid_date` DATE NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_salary_per_employee_month` (`tenant_id`, `employee_id`, `month`, `year`),
  CONSTRAINT `fk_salaries_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_salaries_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 12. General Expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `item` VARCHAR(150) NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `category` ENUM('rent', 'utility', 'salary', 'office', 'other') DEFAULT 'other',
  `description` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_expenses_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 13. Student Attendance Table
DROP TABLE IF EXISTS `attendance_students`;
CREATE TABLE `attendance_students` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `student_id` INT,
  `date` DATE NOT NULL,
  `status` ENUM('present', 'absent', 'leave', 'online') DEFAULT 'present',
  `marked_by` INT,
  `tenant_id` INT NOT NULL,
  UNIQUE KEY `student_date` (`student_id`, `date`),
  CONSTRAINT `fk_attendance_students_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_students_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_students_marked_by` FOREIGN KEY (`marked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 14. Employee Attendance Table
DROP TABLE IF EXISTS `attendance_employees`;
CREATE TABLE `attendance_employees` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `employee_id` INT,
  `date` DATE NOT NULL,
  `status` ENUM('present', 'absent', 'leave') DEFAULT 'present',
  `marked_by` INT,
  `tenant_id` INT NOT NULL,
  UNIQUE KEY `employee_date` (`employee_id`, `date`),
  CONSTRAINT `fk_attendance_employees_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_employees_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_employees_marked_by` FOREIGN KEY (`marked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 15. Periods Table (Timetable Slots)
DROP TABLE IF EXISTS `periods`;
CREATE TABLE `periods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT DEFAULT NULL,
  `class_id` INT DEFAULT NULL,
  `day_of_week` ENUM('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `start_time` TIME DEFAULT NULL,
  `end_time` TIME DEFAULT NULL,
  `subject` VARCHAR(100) DEFAULT NULL,
  `period_number` INT DEFAULT NULL,
  `session_id` INT DEFAULT NULL,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_periods_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_periods_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_periods_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_periods_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 16. Student Enrollments Table
DROP TABLE IF EXISTS `student_enrollments`;
CREATE TABLE `student_enrollments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `session_id` INT NOT NULL,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `student_session` (`student_id` ASC, `session_id` ASC),
  CONSTRAINT `fk_student_enrollments_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_enrollments_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_enrollments_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_enrollments_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 17. Role Permissions Table
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(50) NOT NULL,
  `function_name` VARCHAR(100) NOT NULL,
  `allowed` TINYINT(1) DEFAULT 0,
  `tenant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unique_role_function_per_tenant` (`tenant_id`, `role`, `function_name`),
  CONSTRAINT `fk_role_permissions_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
