/*
 Navicat Premium Data Transfer

 Source Server         : Nukrim
 Source Server Type    : MySQL
 Source Server Version : 80046
 Source Host           : localhost:3306
 Source Schema         : sms

 Target Server Type    : MySQL
 Target Server Version : 80046
 File Encoding         : 65001

 Date: 25/07/2026 15:20:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attendance_employees
-- ----------------------------
DROP TABLE IF EXISTS `attendance_employees`;
CREATE TABLE `attendance_employees`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NULL DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','leave') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'present',
  `marked_by` int NULL DEFAULT NULL,
  `tenant_id` int NOT NULL,
  `arrival_time` time NULL DEFAULT NULL,
  `is_late` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `employee_date`(`employee_id` ASC, `date` ASC) USING BTREE,
  UNIQUE INDEX `unique_emp_date_tenant`(`tenant_id` ASC, `employee_id` ASC, `date` ASC) USING BTREE,
  INDEX `fk_attendance_employees_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_attendance_employees_marked_by`(`marked_by` ASC) USING BTREE,
  CONSTRAINT `fk_attendance_employees_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_attendance_employees_marked_by` FOREIGN KEY (`marked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_attendance_employees_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 412 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_employees
-- ----------------------------
INSERT INTO `attendance_employees` VALUES (52, 11, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (54, 8, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (56, 13, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (58, 3, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (60, 14, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (62, 19, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (64, 5, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (66, 9, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (68, 7, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (70, 12, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (72, 6, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (74, 10, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (76, 4, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (78, 2, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (80, 17, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (82, 18, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (84, 1, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (86, 15, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (88, 16, '2026-07-06', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (90, 11, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (92, 8, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (94, 13, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (96, 3, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (98, 14, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (100, 19, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (102, 5, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (104, 9, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (106, 7, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (108, 12, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (110, 6, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (112, 10, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (114, 4, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (116, 2, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (118, 17, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (120, 18, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (122, 1, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (124, 15, '2026-07-07', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (126, 16, '2026-07-07', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (128, 11, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (130, 8, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (132, 13, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (134, 3, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (136, 14, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (138, 19, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (140, 5, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (142, 9, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (144, 7, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (146, 12, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (148, 6, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (150, 10, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (152, 4, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (154, 2, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (156, 17, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (158, 18, '2026-07-08', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (160, 1, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (162, 15, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (164, 16, '2026-07-08', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (166, 11, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (168, 8, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (170, 13, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (172, 3, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (174, 14, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (176, 19, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (178, 56, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (180, 5, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (182, 9, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (184, 7, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (186, 12, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (188, 6, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (190, 10, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (192, 4, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (194, 2, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (196, 17, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (198, 18, '2026-07-09', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (200, 1, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (202, 15, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (204, 16, '2026-07-09', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (246, 11, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (248, 8, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (250, 13, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (252, 3, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (254, 14, '2026-07-11', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (256, 19, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (258, 56, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (260, 5, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (262, 9, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (264, 7, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (266, 12, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (268, 6, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (270, 10, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (272, 4, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (274, 2, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (276, 17, '2026-07-11', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (278, 18, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (280, 1, '2026-07-11', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (282, 15, '2026-07-11', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (284, 16, '2026-07-11', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (286, 11, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (288, 8, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (290, 13, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (292, 3, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (294, 14, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (296, 19, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (298, 56, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (300, 5, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (302, 9, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (304, 7, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (306, 12, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (308, 6, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (310, 10, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (312, 4, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (314, 2, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (316, 17, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (318, 18, '2026-07-13', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (320, 1, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (322, 15, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (324, 16, '2026-07-13', 'present', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (330, 11, '2026-07-14', 'leave', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (332, 3, '2026-07-15', 'present', 1, 1, '08:50:00', 1);
INSERT INTO `attendance_employees` VALUES (334, 2, '2026-07-15', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (336, 18, '2026-07-15', 'present', 1, 1, '08:40:00', 1);
INSERT INTO `attendance_employees` VALUES (338, 1, '2026-07-15', 'present', 1, 1, '06:50:00', 0);
INSERT INTO `attendance_employees` VALUES (340, 15, '2026-07-15', 'present', 1, 1, '07:58:00', 0);
INSERT INTO `attendance_employees` VALUES (342, 3, '2026-07-16', 'present', 1, 1, '07:40:00', 0);
INSERT INTO `attendance_employees` VALUES (344, 14, '2026-07-16', 'present', 1, 1, '07:51:00', 0);
INSERT INTO `attendance_employees` VALUES (346, 18, '2026-07-16', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (348, 15, '2026-07-16', 'present', 1, 1, '07:55:00', 0);
INSERT INTO `attendance_employees` VALUES (350, 3, '2026-07-17', 'present', 1, 1, '08:10:00', 0);
INSERT INTO `attendance_employees` VALUES (352, 14, '2026-07-17', 'present', 1, 1, '08:20:00', 1);
INSERT INTO `attendance_employees` VALUES (354, 18, '2026-07-17', 'present', 1, 1, '08:08:00', 0);
INSERT INTO `attendance_employees` VALUES (356, 1, '2026-07-17', 'present', 1, 1, '06:50:00', 0);
INSERT INTO `attendance_employees` VALUES (364, 3, '2026-07-20', 'present', 1, 1, '10:10:00', 1);
INSERT INTO `attendance_employees` VALUES (366, 14, '2026-07-20', 'absent', 1, 1, NULL, 0);
INSERT INTO `attendance_employees` VALUES (368, 56, '2026-07-20', 'present', 1, 1, '08:05:00', 0);
INSERT INTO `attendance_employees` VALUES (370, 18, '2026-07-20', 'present', 1, 1, '08:15:00', 0);
INSERT INTO `attendance_employees` VALUES (372, 3, '2026-07-21', 'present', 1, 1, '08:08:00', 0);
INSERT INTO `attendance_employees` VALUES (374, 14, '2026-07-21', 'present', 1, 1, '07:45:00', 0);
INSERT INTO `attendance_employees` VALUES (376, 56, '2026-07-21', 'present', 1, 1, '08:05:00', 0);
INSERT INTO `attendance_employees` VALUES (378, 17, '2026-07-21', 'present', 1, 1, '08:14:00', 0);
INSERT INTO `attendance_employees` VALUES (388, 3, '2026-07-22', 'present', 1, 1, '08:15:00', 0);
INSERT INTO `attendance_employees` VALUES (390, 14, '2026-07-22', 'present', 1, 1, '07:45:00', 0);
INSERT INTO `attendance_employees` VALUES (392, 56, '2026-07-22', 'present', 1, 1, '08:05:00', 0);
INSERT INTO `attendance_employees` VALUES (394, 16, '2026-07-22', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (396, 11, '2026-07-24', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (398, 3, '2026-07-24', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (400, 14, '2026-07-24', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (402, 56, '2026-07-24', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (404, 17, '2026-07-24', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (406, 3, '2026-07-25', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (408, 4, '2026-07-25', 'present', 1, 1, '08:00:00', 0);
INSERT INTO `attendance_employees` VALUES (410, 17, '2026-07-25', 'present', 1, 1, '08:00:00', 0);

-- ----------------------------
-- Table structure for attendance_students
-- ----------------------------
DROP TABLE IF EXISTS `attendance_students`;
CREATE TABLE `attendance_students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NULL DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','leave','online') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'present',
  `marked_by` int NULL DEFAULT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_date`(`student_id` ASC, `date` ASC) USING BTREE,
  INDEX `fk_attendance_students_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_attendance_students_marked_by`(`marked_by` ASC) USING BTREE,
  CONSTRAINT `fk_attendance_students_marked_by` FOREIGN KEY (`marked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_attendance_students_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_attendance_students_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance_students
-- ----------------------------

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `default_monthly_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `tenant_id` int NOT NULL,
  `is_hifz_class` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_classes_tenant`(`tenant_id` ASC) USING BTREE,
  CONSTRAINT `fk_classes_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (10, 'Nursery', 1500.00, 2, 0);
INSERT INTO `classes` VALUES (12, 'Class One', 2000.00, 2, 0);
INSERT INTO `classes` VALUES (14, 'Class Two', 2000.00, 2, 0);
INSERT INTO `classes` VALUES (16, 'Hifz Class', 2500.00, 2, 0);
INSERT INTO `classes` VALUES (50, 'Nursery', 1500.00, 4, 0);
INSERT INTO `classes` VALUES (52, 'Class One', 2000.00, 4, 0);
INSERT INTO `classes` VALUES (54, 'Class Two', 2000.00, 4, 0);
INSERT INTO `classes` VALUES (56, 'Hifz Class', 2500.00, 4, 0);
INSERT INTO `classes` VALUES (58, 'Nursery class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (60, 'Prep Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (62, 'One Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (64, 'Two Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (66, 'Three Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (68, 'Fourth Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (70, 'Fifth Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (72, 'Sixth Class', 2100.00, 1, 0);
INSERT INTO `classes` VALUES (74, 'Hifz Class', 2100.00, 1, 1);
INSERT INTO `classes` VALUES (78, 'Play Group', 2100.00, 1, 0);

-- ----------------------------
-- Table structure for donations
-- ----------------------------
DROP TABLE IF EXISTS `donations`;
CREATE TABLE `donations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `donor_id` int NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `date` date NOT NULL,
  `fund_category` enum('general','trust','student_support') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'general',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Cash',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `donation_type` enum('Sadqa','Zakat') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Sadqa',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_donations_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_donations_donor`(`donor_id` ASC) USING BTREE,
  CONSTRAINT `fk_donations_donor` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_donations_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1558 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donations
-- ----------------------------
INSERT INTO `donations` VALUES (258, 2, 64, 15000.00, '2026-01-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (260, 2, 66, 25000.00, '2026-01-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (262, 2, 64, 15000.00, '2026-02-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (264, 2, 66, 25000.00, '2026-02-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (266, 2, 64, 15000.00, '2026-03-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (268, 2, 66, 25000.00, '2026-03-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (270, 2, 64, 15000.00, '2026-04-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (272, 2, 66, 25000.00, '2026-04-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (274, 2, 64, 15000.00, '2026-05-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (276, 2, 66, 25000.00, '2026-05-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (278, 2, 64, 15000.00, '2026-06-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (280, 2, 66, 25000.00, '2026-06-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:14:13', 'Sadqa');
INSERT INTO `donations` VALUES (330, 4, 76, 15000.00, '2026-01-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (332, 4, 78, 25000.00, '2026-01-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (334, 4, 76, 15000.00, '2026-02-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (336, 4, 78, 25000.00, '2026-02-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (338, 4, 76, 15000.00, '2026-03-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (340, 4, 78, 25000.00, '2026-03-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (342, 4, 76, 15000.00, '2026-04-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (344, 4, 78, 25000.00, '2026-04-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (346, 4, 76, 15000.00, '2026-05-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (348, 4, 78, 25000.00, '2026-05-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (350, 4, 76, 15000.00, '2026-06-05', 'trust', 'Online', 'Monthly support sponsorship', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (352, 4, 78, 25000.00, '2026-06-12', 'general', 'Cash', 'General welfare fund donation', '2026-06-25 21:54:15', 'Sadqa');
INSERT INTO `donations` VALUES (992, 1, 3, 12000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (994, 1, 3, 12000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (996, 1, 3, 12000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (998, 1, 3, 12000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1000, 1, 3, 12000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1002, 1, 3, 12000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1004, 1, 3, 12000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1006, 1, 5, 10000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1008, 1, 5, 5000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1010, 1, 5, 100000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1012, 1, 5, 10000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1014, 1, 5, 10000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1016, 1, 6, 1000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1018, 1, 6, 1000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1020, 1, 6, 1000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1022, 1, 6, 1000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1024, 1, 6, 1000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1026, 1, 6, 1000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1028, 1, 6, 1000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1030, 1, 7, 13000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1032, 1, 7, 13000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1034, 1, 7, 13000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1036, 1, 7, 13000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1038, 1, 7, 15000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1040, 1, 7, 13000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1042, 1, 8, 12000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1044, 1, 8, 12000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1046, 1, 8, 12000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1048, 1, 8, 12000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1050, 1, 8, 12000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1052, 1, 8, 12000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1054, 1, 8, 12000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1056, 1, 10, 12000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1058, 1, 10, 12000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1060, 1, 10, 6000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1062, 1, 11, 12000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1064, 1, 11, 12000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1066, 1, 12, 60000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1068, 1, 12, 60000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1070, 1, 12, 60000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1072, 1, 12, 60000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1074, 1, 12, 70000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1076, 1, 12, 60000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1078, 1, 12, 60000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1080, 1, 13, 10000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1082, 1, 13, 10000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1084, 1, 13, 10000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1086, 1, 13, 10000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1088, 1, 13, 10000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1090, 1, 13, 10000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1092, 1, 13, 10000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1094, 1, 15, 10000.00, '2026-01-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1096, 1, 15, 10000.00, '2026-02-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1098, 1, 15, 10000.00, '2026-03-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1100, 1, 15, 10000.00, '2026-04-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1102, 1, 15, 10000.00, '2026-05-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1104, 1, 15, 10000.00, '2026-06-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1106, 1, 15, 10000.00, '2026-07-01', 'general', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1108, 1, 21, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1110, 1, 21, 4000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1112, 1, 21, 40000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1114, 1, 21, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1116, 1, 21, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1118, 1, 21, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1120, 1, 21, 3500.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1122, 1, 22, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1124, 1, 22, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1126, 1, 22, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1128, 1, 22, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1130, 1, 22, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1132, 1, 22, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1134, 1, 23, 4000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1136, 1, 23, 4000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1138, 1, 23, 4000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1140, 1, 23, 4000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1142, 1, 23, 4000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1144, 1, 23, 4000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1146, 1, 24, 10000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1148, 1, 24, 10000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1150, 1, 24, 10000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1152, 1, 24, 10000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1154, 1, 24, 10000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1156, 1, 24, 10000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1158, 1, 24, 10000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1160, 1, 25, 4000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1162, 1, 25, 4000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1164, 1, 25, 4000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1166, 1, 25, 5000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1168, 1, 25, 5000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1170, 1, 25, 5000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1172, 1, 26, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1174, 1, 26, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1176, 1, 26, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1178, 1, 26, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1180, 1, 26, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1182, 1, 26, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1184, 1, 26, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1186, 1, 27, 5000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1188, 1, 27, 5000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1190, 1, 27, 5000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1192, 1, 27, 5000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1194, 1, 27, 5000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1196, 1, 27, 5000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1198, 1, 27, 5000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1200, 1, 28, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1202, 1, 28, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1204, 1, 28, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1206, 1, 28, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1208, 1, 28, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1210, 1, 28, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1212, 1, 28, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1214, 1, 29, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1216, 1, 29, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1218, 1, 29, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1220, 1, 29, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1222, 1, 29, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1224, 1, 29, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1226, 1, 30, 10000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1228, 1, 30, 10000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1230, 1, 30, 10000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1232, 1, 30, 10000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1234, 1, 30, 10000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1236, 1, 30, 10000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1238, 1, 31, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1240, 1, 31, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1242, 1, 31, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1244, 1, 31, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1246, 1, 31, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1248, 1, 31, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1250, 1, 31, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1252, 1, 32, 4000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1254, 1, 32, 4000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1256, 1, 32, 4000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1258, 1, 32, 4000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1260, 1, 32, 4000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1262, 1, 32, 4000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1264, 1, 32, 4000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1266, 1, 33, 6000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1268, 1, 33, 6000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1270, 1, 33, 6000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1272, 1, 33, 6000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1274, 1, 33, 6000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1276, 1, 33, 6000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1278, 1, 34, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1280, 1, 34, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1282, 1, 34, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1284, 1, 34, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1286, 1, 34, 2500.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1288, 1, 34, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1290, 1, 34, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1292, 1, 35, 2500.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1294, 1, 35, 2500.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1296, 1, 35, 2500.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1298, 1, 35, 2500.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1300, 1, 35, 2500.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1302, 1, 35, 2500.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1304, 1, 35, 2500.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1306, 1, 36, 2500.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1308, 1, 36, 2500.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1310, 1, 36, 2500.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1312, 1, 37, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1314, 1, 37, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1316, 1, 37, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1318, 1, 37, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1320, 1, 37, 6000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1322, 1, 37, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1324, 1, 38, 6000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1326, 1, 38, 6000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1328, 1, 38, 6000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1330, 1, 38, 6000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1332, 1, 38, 6000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1334, 1, 38, 6000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1336, 1, 38, 6000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1338, 1, 39, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1340, 1, 39, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1342, 1, 39, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1344, 1, 39, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1346, 1, 39, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1348, 1, 39, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1350, 1, 39, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1352, 1, 40, 10000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1354, 1, 40, 5000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1356, 1, 41, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1358, 1, 41, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1360, 1, 41, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1362, 1, 41, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1364, 1, 41, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1366, 1, 41, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1368, 1, 42, 5000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1370, 1, 42, 5000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1372, 1, 42, 5000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1374, 1, 42, 5000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1376, 1, 42, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1378, 1, 42, 5000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1380, 1, 43, 24000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1382, 1, 44, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1384, 1, 44, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1386, 1, 44, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1388, 1, 45, 18000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1390, 1, 46, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1392, 1, 46, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1394, 1, 46, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1396, 1, 46, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1398, 1, 46, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1400, 1, 46, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1402, 1, 46, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1404, 1, 47, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1406, 1, 47, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1408, 1, 47, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1410, 1, 47, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1412, 1, 47, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1414, 1, 47, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1416, 1, 47, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1418, 1, 48, 10000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1420, 1, 48, 10000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1422, 1, 48, 10000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1424, 1, 48, 10000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1426, 1, 48, 10000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1428, 1, 48, 10000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1430, 1, 48, 10000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1432, 1, 49, 5000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1434, 1, 84, 5000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1436, 1, 84, 5000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1438, 1, 84, 5000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1440, 1, 84, 5000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1442, 1, 84, 5000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1444, 1, 84, 5000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1446, 1, 84, 5000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1448, 1, 51, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1450, 1, 51, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1452, 1, 51, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1454, 1, 51, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1456, 1, 51, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1458, 1, 51, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1460, 1, 51, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1462, 1, 52, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1464, 1, 52, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1466, 1, 52, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1468, 1, 52, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1470, 1, 52, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1472, 1, 52, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1474, 1, 52, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1476, 1, 34, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1478, 1, 34, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1480, 1, 34, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:40', 'Sadqa');
INSERT INTO `donations` VALUES (1482, 1, 34, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1484, 1, 34, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1486, 1, 34, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1488, 1, 34, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1490, 1, 53, 5000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1492, 1, 53, 5000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1494, 1, 53, 10000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1496, 1, 53, 5000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1498, 1, 53, 5000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1500, 1, 53, 5000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1502, 1, 54, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1504, 1, 54, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1506, 1, 54, 3000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1508, 1, 54, 3000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1510, 1, 54, 3000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1512, 1, 54, 3000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1514, 1, 54, 3000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1516, 1, 55, 2000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1518, 1, 55, 2000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1520, 1, 55, 2000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1522, 1, 55, 2000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1524, 1, 55, 2000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1526, 1, 55, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1528, 1, 55, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1530, 1, 86, 3000.00, '2026-01-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1532, 1, 86, 3000.00, '2026-02-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1534, 1, 86, 6000.00, '2026-03-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1536, 1, 86, 6000.00, '2026-04-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1538, 1, 86, 6000.00, '2026-05-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1540, 1, 86, 6000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1542, 1, 86, 6000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1544, 1, 88, 25000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1546, 1, 58, 2000.00, '2026-06-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1548, 1, 58, 2000.00, '2026-07-01', 'trust', 'Cash', NULL, '2026-07-14 11:57:41', 'Sadqa');
INSERT INTO `donations` VALUES (1550, 1, 7, 13000.00, '2026-07-15', 'general', 'Online', '[Direct: Faheem Zafar]', '2026-07-15 05:52:19', 'Sadqa');
INSERT INTO `donations` VALUES (1552, 1, 42, 2000.00, '2026-07-08', 'trust', 'Online', NULL, '2026-07-18 09:35:12', 'Sadqa');
INSERT INTO `donations` VALUES (1554, 1, 58, 2000.00, '2026-07-12', 'trust', 'Online', NULL, '2026-07-18 09:45:43', 'Sadqa');
INSERT INTO `donations` VALUES (1556, 1, 29, 2000.00, '2026-07-10', 'trust', 'Online', NULL, '2026-07-18 10:10:00', 'Sadqa');

-- ----------------------------
-- Table structure for donors
-- ----------------------------
DROP TABLE IF EXISTS `donors`;
CREATE TABLE `donors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `referred_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `monthly_commitment_amount` decimal(10, 2) NULL DEFAULT NULL,
  `monthly_commitment` tinyint(1) NULL DEFAULT 0,
  `preferred_fund_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'general',
  `preferred_payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Online',
  `preferred_member` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_donor_name_per_tenant`(`tenant_id` ASC, `name` ASC) USING BTREE,
  CONSTRAINT `fk_donors_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donors
-- ----------------------------
INSERT INTO `donors` VALUES (1, 1, '', NULL, NULL, '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (2, 1, 'Abdul ur Rafay', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (3, 1, 'Ali Irfan', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (4, 1, 'Dr Muzafar', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (5, 1, 'Fahad Shiekh', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (6, 1, 'Hafiz Nadeem Maqsood', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (7, 1, 'Hammad Mansoor', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (8, 1, 'Haroon Ahmed Cheema', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (9, 1, 'Muhaimin Technologies', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (10, 1, 'Muhammad Mateen', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (11, 1, 'Umer Naseer', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (12, 1, 'Junaid Ansari', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (13, 1, 'Sohaib Hamid', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (14, 1, 'Khawar Zafar', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (15, 1, 'Mudasir Aziz', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (16, 1, 'Noman Ahmed', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (17, 1, 'Dr Mansoor', NULL, 'Faheem Zafar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (18, 1, 'Mujahid', NULL, NULL, '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (19, 1, 'Ubaid Ur Rehman', NULL, NULL, '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (20, 1, 'Kashif Qurban', NULL, NULL, '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (21, 1, 'Abdul Moiz Jadoon', NULL, 'Hassan Khalid', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (22, 1, 'Hassan Khalid', NULL, 'Hassan Khalid', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (23, 1, 'Maj Raza', NULL, 'Hassan Khalid', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (24, 1, 'Abad Faiz Barki', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (25, 1, 'Abdul Basit Javed', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (26, 1, 'Adil Ali Raja', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (27, 1, 'Amir Naveed', NULL, 'Amir Naveed', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (28, 1, 'Cdr Abdul Rehman', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (29, 1, 'Mrs. Humaira Gul', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (30, 1, 'Ibrar Hussain', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (31, 1, 'Kamal Muhammad', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (32, 1, 'Moulana Imran Ansari', '03465100021', 'Kamal Muhammad', '2026-06-17 06:26:36', 4000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (33, 1, 'Moulana Qamar Ijaz', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (34, 1, 'Muhammad Abdullah', NULL, 'Mujahid ul Islam', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (35, 1, 'Muhammad Ali', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (36, 1, 'Muhammad Nouman', NULL, 'Mujahid ul Islam', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (37, 1, 'Syed Muhammad Osamah', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (38, 1, 'Surriya Sarwat', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (39, 1, 'Usman Farooq', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (40, 1, 'Faheem Mughal', NULL, 'Muhammad Shahryar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (41, 1, 'Muhammad Nadeem Khan', NULL, 'Muhammad Shahryar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (42, 1, 'Muhammad Shahryar', NULL, 'Muhammad Shahryar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (43, 1, 'Nouman Tariq', NULL, 'Muhammad Sharyar', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (44, 1, 'Hamza Shahid', NULL, 'Sohaib Hameed Khan', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (45, 1, 'Mrs. Shamaila Batool', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (46, 1, 'Sohaib Hameed Khan', NULL, 'Sohaib Hameed Khan', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (47, 1, 'Mrs. Ayesha Tahir', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (48, 1, 'Umer Farooq', NULL, 'Mujahid Ul Islam', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (49, 1, 'Atiq Ur Rehman', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (50, 1, 'Ikram Hussain Shah', '03459383802', 'Kamal Muhammad', '2026-06-17 06:26:36', 5000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (51, 1, 'Faran Tariq', NULL, 'Sohaib Hameed Khan', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (52, 1, 'Irfan Hafeez', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (53, 1, 'Eman Munir', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (54, 1, 'Ayesha Naveed', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (55, 1, 'Mrs Nadia Rashid', NULL, 'Kamal Muhammad', '2026-06-17 06:26:36', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (56, 1, 'Muhammad Ammar', '03365372811', 'Kamal Muhammad', '2026-06-17 06:26:36', 6000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (58, 1, 'Syed Fahad Ali', '03467532559', 'Kamal Muhammad (Baseera Group)', '2026-06-25 15:49:51', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (60, 1, 'Noufil Khalid', '03111599901', 'Kamal Muhammad', '2026-06-25 15:54:43', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (62, 1, 'Test11111', '0333529647', NULL, '2026-06-25 19:19:35', 2000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (64, 2, 'Dr. Tariq Mahmood', '03001234567', NULL, '2026-06-25 21:14:13', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (66, 2, 'Sofia Foundations', '03217654321', NULL, '2026-06-25 21:14:13', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (76, 4, 'Dr. Tariq Mahmood', '03001234567', NULL, '2026-06-25 21:54:14', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (78, 4, 'Sofia Foundations', '03217654321', NULL, '2026-06-25 21:54:14', NULL, 0, 'general', 'Online', NULL);
INSERT INTO `donors` VALUES (80, 1, 'Muhammad Abdullah (CyMax)', '03188225225', 'Kamal Muhammad', '2026-06-26 11:49:07', 2000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (82, 1, 'Faheem Akhtar', '03335224558', 'Kamal Muhammad', '2026-07-04 09:50:17', 5000.00, 1, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (84, 1, 'Mohsin Iftikhar', NULL, '', '2026-07-14 11:57:23', NULL, 0, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (86, 1, 'Ammar Nbgr', NULL, '', '2026-07-14 11:57:23', NULL, 0, 'trust', 'Online', NULL);
INSERT INTO `donors` VALUES (88, 1, 'Noufil Khaild', NULL, '', '2026-07-14 11:57:23', NULL, 0, 'trust', 'Online', NULL);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','teacher','support') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'teacher',
  `status` enum('on_payroll','volunteer','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'on_payroll',
  `date_of_joining` date NULL DEFAULT NULL,
  `default_salary` decimal(10, 2) NULL DEFAULT 0.00,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cnic_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'male',
  `qualification` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `experience_years` int NULL DEFAULT 0,
  `bank_account_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `previous_experience_years` int NULL DEFAULT 0,
  `assigned_hifz_class_id` int NULL DEFAULT NULL,
  `date_of_leaving` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_employee_name_per_tenant`(`tenant_id` ASC, `name` ASC) USING BTREE,
  INDEX `fk_employees_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_employees_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_employees_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (1, 1, 'Qari M. Usama sb', 'Qari (Male Quran Teacher)', 'teacher', 'on_payroll', '2025-05-30', 42000.00, NULL, '0317-8122761', '13503-8388833-7', 'Dhoke Kashmiriyan Rawalpindi', 'male', 'Intermediate  Aalim-e- Dars-e-Nazami 8 Year ,one year Mufti Course .', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (2, 1, 'Mrs, Alauddin', 'Principal', 'admin', 'on_payroll', '2016-12-28', 39050.00, 'mischool220@gmil.com', '03338823780', '35202-2557385-0', 'Dhoke kashmiriyan Rawlpindi', 'female', 'Masters in Arabic literature and   Islamiyat ', 0, NULL, NULL, 20, NULL, NULL);
INSERT INTO `employees` VALUES (3, 1, 'Maam Aysha Ambreen', 'Vice Principal / Coordinator', 'admin', 'on_payroll', '2025-09-18', 35000.00, 'adeel.aysha@gmil.com', '03358598759', NULL, 'House no J516-1 street no3 Dhoke Ellahi baksh Rawlpindi', 'female', 'PhD Biology ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (4, 1, 'Maam Shumaila Arshad', 'Admin / Office Staff', 'teacher', 'on_payroll', '2020-02-29', 23100.00, 'shumailaarshad12r@gmil.com', '0314893335', '37405-4827450-4', 'Dhoke Kashmiriyan Rawalpindi', 'female', 'Bachelor', 0, NULL, NULL, -8, NULL, NULL);
INSERT INTO `employees` VALUES (5, 1, 'Maam Humaira Tabasum', 'Montessori Teacher', 'teacher', 'on_payroll', '2022-09-24', 17050.00, NULL, '0331-2770734', '61101-4762223-8', 'Dhoke Kashmiriyan Rawalpindi', 'female', 'Bachelor', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (6, 1, 'Maam Malika Zahid', 'Primary School Teacher', 'teacher', 'on_payroll', '2023-08-30', 15400.00, NULL, '03116614244', '37405-6629216', 'House no DPN-76/4 Street no 4 Mohallah Sadiq Abad Rawalpindi', 'female', 'Intermediate ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (7, 1, 'Maam Kainat', 'Primary School Teacher', 'teacher', 'on_payroll', '2023-05-21', 15950.00, NULL, '0314-9305146', '37405-7803409-6', 'House No SA 813 Street no28 Mohallah Service road Sadiq Abad Rawalpindi', 'female', 'Bs  English ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (8, 1, 'Maam Amna Zeeshan', 'Montessori Teacher', 'teacher', 'on_payroll', '2018-11-05', 14850.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (9, 1, 'Maam Iqra Iqbal', 'Primary School Teacher', 'teacher', 'on_payroll', '2025-04-12', 13200.00, NULL, '03175758089', '37405848256-6', 'House no DK 530 B street no 3 mohallah dhoke Paracha Rawalpindi', 'female', 'Intermediate ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (10, 1, 'Maam Saima shouaib', 'Primary School Teacher', 'teacher', 'on_payroll', '2025-08-09', 12600.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (11, 1, 'Maam Amna Saddique', 'Primary School Teacher', 'teacher', 'on_payroll', '2025-09-28', 12600.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (12, 1, 'Maam Mahnoor Nouman', 'Montessori Teacher', 'teacher', 'on_payroll', '2025-10-06', 9450.00, NULL, '03248523913', '37405-7062934-8', 'House no dk 363 street no 27 mohallah dhoke Kasmiriyan Rawlpindi', 'female', 'Intermediate ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (13, 1, 'Maam Asma bashir', 'Primary School Teacher', 'teacher', 'on_payroll', '2026-02-22', 16000.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, '2026-05-31');
INSERT INTO `employees` VALUES (14, 1, 'Maam Barerah', 'Primary School Teacher', 'teacher', 'on_payroll', '2026-02-27', 12000.00, NULL, '03295052293', '37405-4799213-2', 'House no DK 42 Mohallah dhoke kashmiriyan Sadiq Abad Rawalpindi', 'female', 'Intermediate ', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (15, 1, 'Qaria Sumaira', 'Qaria (Female Quran Teacher)', 'teacher', 'on_payroll', '2026-04-27', 5000.00, NULL, '03151704967', '37405-1842283-6', 'Shakriyal Kuri Road', 'female', 'Primary', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (16, 1, 'Shakila Bibi', 'Aya / Nanny', 'support', 'on_payroll', '2018-08-09', 13200.00, NULL, '03420008904', '37405-0537205-2', 'House No DK-529 Street no 3 Mohallah dhoke paracha Rawalpindi', 'female', 'Matric', 0, NULL, NULL, 8, NULL, NULL);
INSERT INTO `employees` VALUES (17, 1, 'Nagina Bibi', 'Cleaner / Support Staff', 'support', 'on_payroll', '2018-08-18', 13200.00, NULL, '03045674464', '37405-5107299-8', 'Dhoke Paracha Rawalpindi', 'female', 'Primary', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (18, 1, 'Nusrat bibi', 'Aya / Nanny', 'support', 'on_payroll', '2026-02-02', 8000.00, NULL, '03315488322', '37405-2063821-4', 'Dhoke Kashmiriyan Rawalpindi', 'female', 'Primary', 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (19, 1, 'Maam Farina Abbasi', 'Course Coordinator', 'teacher', 'on_payroll', NULL, 0.00, NULL, NULL, NULL, NULL, 'male', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (20, 2, 'Qari Muhammad Ahmad', 'Qari (Male Quran Teacher)', 'teacher', 'on_payroll', '2024-03-01', 28000.00, NULL, NULL, NULL, NULL, 'male', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (22, 2, 'Ayesha Bibi', 'Primary School Teacher', 'teacher', 'on_payroll', '2024-03-01', 22000.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (24, 2, 'Zainab Fatima', 'Montessori Teacher', 'teacher', 'on_payroll', '2024-03-01', 24000.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (50, 4, 'Qari Muhammad Ahmad', 'Qari (Male Quran Teacher)', 'teacher', 'on_payroll', '2024-03-01', 28000.00, NULL, NULL, NULL, NULL, 'male', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (52, 4, 'Ayesha Bibi', 'Primary School Teacher', 'teacher', 'on_payroll', '2024-03-01', 22000.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (54, 4, 'Zainab Fatima', 'Montessori Teacher', 'teacher', 'on_payroll', '2024-03-01', 24000.00, NULL, NULL, NULL, NULL, 'female', NULL, 0, NULL, NULL, 0, NULL, NULL);
INSERT INTO `employees` VALUES (56, 1, 'Maam Hina Naaz', 'Primary School Teacher', 'teacher', 'on_payroll', '2026-06-05', 12000.00, NULL, '03140831332', '37405-1815592-2', 'House no DK-875 Mohallah Dhoke Kashmiriyan Farooq Azam Road Rawalpindi', 'female', 'Bachelor', 0, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `date` date NOT NULL,
  `item` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `category` enum('rent','utility','salary','office','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'other',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_expenses_tenant`(`tenant_id` ASC) USING BTREE,
  CONSTRAINT `fk_expenses_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 450 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expenses
-- ----------------------------
INSERT INTO `expenses` VALUES (280, 2, '2026-01-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (282, 2, '2026-01-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (284, 2, '2026-02-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (286, 2, '2026-02-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (288, 2, '2026-03-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (290, 2, '2026-03-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (292, 2, '2026-04-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (294, 2, '2026-04-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (296, 2, '2026-05-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (298, 2, '2026-05-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (300, 2, '2026-06-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (302, 2, '2026-06-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:14:13');
INSERT INTO `expenses` VALUES (352, 4, '2026-01-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (354, 4, '2026-01-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (356, 4, '2026-02-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (358, 4, '2026-02-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (360, 4, '2026-03-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (362, 4, '2026-03-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (364, 4, '2026-04-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (366, 4, '2026-04-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (368, 4, '2026-05-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (370, 4, '2026-05-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (372, 4, '2026-06-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (374, 4, '2026-06-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill', '2026-06-25 21:54:16');
INSERT INTO `expenses` VALUES (408, 4, '2026-07-13', 'Tea', 100.00, 'other', NULL, '2026-07-13 19:44:12');
INSERT INTO `expenses` VALUES (410, 1, '2026-01-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (412, 1, '2026-01-01', 'Utility Bill', 4350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (414, 1, '2026-01-01', 'Office Expense', 49400.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (416, 1, '2026-02-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (418, 1, '2026-02-01', 'Utility Bill', 24350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (420, 1, '2026-02-01', 'Office Expense', 55385.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (422, 1, '2026-03-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (424, 1, '2026-03-01', 'Utility Bill', 4350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (426, 1, '2026-03-01', 'Office Expense', 80240.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (428, 1, '2026-04-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (430, 1, '2026-04-01', 'Utility Bill', 4350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (432, 1, '2026-04-01', 'Office Expense', 42324.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (434, 1, '2026-05-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (436, 1, '2026-05-01', 'Utility Bill', 31450.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (438, 1, '2026-05-01', 'Office Expense', 32801.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (440, 1, '2026-06-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (442, 1, '2026-06-01', 'Utility Bill', 4350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (444, 1, '2026-06-01', 'Office Expense', 63250.00, 'office', 'Office Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (446, 1, '2026-07-01', 'Rent', 120000.00, 'rent', 'Rent Expense', '2026-07-14 12:00:47');
INSERT INTO `expenses` VALUES (448, 1, '2026-07-01', 'Utility Bill', 4350.00, 'utility', 'Utility Bill', '2026-07-14 12:00:47');

-- ----------------------------
-- Table structure for fee_payments
-- ----------------------------
DROP TABLE IF EXISTS `fee_payments`;
CREATE TABLE `fee_payments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `student_id` int NOT NULL,
  `month` tinyint NOT NULL,
  `year` int NOT NULL,
  `amount_paid` decimal(10, 2) NOT NULL,
  `payment_date` date NOT NULL,
  `recorded_by` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fine_amount` decimal(10, 2) NULL DEFAULT 0.00,
  `fine_waived` tinyint(1) NULL DEFAULT 0,
  `additional_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `additional_fee_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_payment_per_student_month`(`tenant_id` ASC, `student_id` ASC, `month` ASC, `year` ASC) USING BTREE,
  INDEX `fk_fee_payments_student`(`student_id` ASC) USING BTREE,
  INDEX `fk_fee_payments_recorded_by`(`recorded_by` ASC) USING BTREE,
  CONSTRAINT `fk_fee_payments_recorded_by` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_fee_payments_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_fee_payments_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11410 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fee_payments
-- ----------------------------
INSERT INTO `fee_payments` VALUES (354, 2, 158, 1, 2026, 2000.00, '2026-01-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (356, 2, 160, 1, 2026, 1200.00, '2026-01-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (358, 2, 162, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (360, 2, 164, 1, 2026, 1000.00, '2026-01-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (362, 2, 158, 2, 2026, 2000.00, '2026-02-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (364, 2, 160, 2, 2026, 1200.00, '2026-02-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (366, 2, 162, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (368, 2, 164, 2, 2026, 1000.00, '2026-02-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (370, 2, 158, 3, 2026, 2000.00, '2026-03-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (372, 2, 160, 3, 2026, 1200.00, '2026-03-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (374, 2, 162, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (376, 2, 164, 3, 2026, 1000.00, '2026-03-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (378, 2, 158, 4, 2026, 2000.00, '2026-04-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (380, 2, 160, 4, 2026, 1200.00, '2026-04-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (382, 2, 162, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (384, 2, 164, 4, 2026, 1000.00, '2026-04-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (386, 2, 158, 5, 2026, 2000.00, '2026-05-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (388, 2, 160, 5, 2026, 1200.00, '2026-05-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (390, 2, 162, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (392, 2, 164, 5, 2026, 1000.00, '2026-05-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (394, 2, 160, 6, 2026, 1200.00, '2026-06-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (396, 2, 162, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (398, 2, 164, 6, 2026, 1000.00, '2026-06-10', NULL, '2026-06-25 21:14:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (586, 4, 210, 1, 2026, 2000.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (588, 4, 212, 1, 2026, 1200.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (590, 4, 214, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (592, 4, 216, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (594, 4, 218, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (596, 4, 220, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (598, 4, 222, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (600, 4, 224, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (602, 4, 226, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (604, 4, 228, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (606, 4, 230, 1, 2026, 1000.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (608, 4, 232, 1, 2026, 2500.00, '2026-01-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (610, 4, 210, 2, 2026, 2000.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (612, 4, 212, 2, 2026, 1200.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (614, 4, 214, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (616, 4, 216, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (618, 4, 218, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (620, 4, 220, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (622, 4, 222, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (624, 4, 224, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (626, 4, 226, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (628, 4, 228, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (630, 4, 230, 2, 2026, 1000.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (632, 4, 232, 2, 2026, 2500.00, '2026-02-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (634, 4, 210, 3, 2026, 2000.00, '2026-03-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (636, 4, 212, 3, 2026, 1200.00, '2026-03-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (638, 4, 214, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (640, 4, 216, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (642, 4, 218, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:13', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (644, 4, 220, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (646, 4, 222, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (648, 4, 224, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (650, 4, 226, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (652, 4, 228, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (654, 4, 230, 3, 2026, 1000.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (656, 4, 232, 3, 2026, 2500.00, '2026-03-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (658, 4, 210, 4, 2026, 2000.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (660, 4, 212, 4, 2026, 1200.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (662, 4, 214, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (664, 4, 216, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (666, 4, 218, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (668, 4, 220, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (670, 4, 222, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (672, 4, 224, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (674, 4, 226, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (676, 4, 228, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (678, 4, 230, 4, 2026, 1000.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (680, 4, 232, 4, 2026, 2500.00, '2026-04-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (682, 4, 210, 5, 2026, 2000.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (684, 4, 212, 5, 2026, 1200.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (686, 4, 214, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (688, 4, 216, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (690, 4, 218, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (692, 4, 220, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (694, 4, 222, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (696, 4, 224, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (698, 4, 226, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (700, 4, 228, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (702, 4, 230, 5, 2026, 1000.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (704, 4, 232, 5, 2026, 2500.00, '2026-05-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (706, 4, 212, 6, 2026, 1200.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (708, 4, 214, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (710, 4, 216, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (712, 4, 218, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (714, 4, 220, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (716, 4, 222, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (718, 4, 224, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (720, 4, 226, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (722, 4, 228, 6, 2026, 2500.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (724, 4, 230, 6, 2026, 1000.00, '2026-06-10', NULL, '2026-06-25 21:54:14', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (2740, 4, 210, 7, 2026, 2000.00, '2026-07-13', 12, '2026-07-13 19:43:42', 60.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10490, 1, 1030, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10492, 1, 1032, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10494, 1, 1032, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10496, 1, 1034, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10498, 1, 1034, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10500, 1, 1036, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10502, 1, 1036, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10504, 1, 1036, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10506, 1, 1040, 1, 2026, 500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10508, 1, 1040, 2, 2026, 500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10510, 1, 1040, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10512, 1, 1042, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10514, 1, 1042, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10516, 1, 1042, 4, 2026, 600.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10518, 1, 1044, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10520, 1, 1044, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10522, 1, 1044, 3, 2026, 2100.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10524, 1, 1044, 4, 2026, 2100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10526, 1, 1044, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10528, 1, 1044, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10530, 1, 1044, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10532, 1, 1046, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10534, 1, 1046, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10536, 1, 1046, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10538, 1, 1046, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10540, 1, 1046, 5, 2026, 1500.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10542, 1, 1046, 6, 2026, 1500.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10544, 1, 1046, 7, 2026, 1500.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10546, 1, 1048, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10548, 1, 1048, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10550, 1, 1050, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10552, 1, 1052, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10554, 1, 1052, 3, 2026, 3000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10556, 1, 1054, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10558, 1, 1054, 3, 2026, 4000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10560, 1, 1056, 1, 2026, 3000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10562, 1, 1056, 6, 2026, 3000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10564, 1, 1058, 1, 2026, 4000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10566, 1, 1058, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10568, 1, 1060, 3, 2026, 2100.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10570, 1, 1060, 4, 2026, 2100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10572, 1, 1060, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10574, 1, 1060, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10576, 1, 1060, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10578, 1, 1062, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10580, 1, 1062, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10582, 1, 1062, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10584, 1, 1064, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10586, 1, 1066, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10588, 1, 1066, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10590, 1, 1066, 5, 2026, 2000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10592, 1, 1066, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10594, 1, 1068, 4, 2026, 2100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10596, 1, 1068, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10598, 1, 1070, 1, 2026, 750.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10600, 1, 1070, 4, 2026, 750.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10602, 1, 1070, 5, 2026, 750.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10604, 1, 1072, 4, 2026, 600.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10606, 1, 1072, 5, 2026, 600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10608, 1, 1074, 4, 2026, 500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10610, 1, 1076, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10612, 1, 1076, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10614, 1, 1078, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10616, 1, 1080, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10618, 1, 1084, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10620, 1, 1084, 5, 2026, 2000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10622, 1, 1086, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10624, 1, 1086, 4, 2026, 500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10626, 1, 1086, 5, 2026, 1500.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10628, 1, 1088, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10630, 1, 1088, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10632, 1, 1088, 5, 2026, 2000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10634, 1, 1090, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10636, 1, 1090, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10638, 1, 1090, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10640, 1, 1090, 4, 2026, 1100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10642, 1, 1090, 6, 2026, 2200.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10644, 1, 1092, 1, 2026, 500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10646, 1, 1092, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10648, 1, 1092, 4, 2026, 1100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10650, 1, 1092, 5, 2026, 2400.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10652, 1, 1094, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10654, 1, 1096, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10656, 1, 1098, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10658, 1, 1098, 3, 2026, 5000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10660, 1, 1100, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10662, 1, 1100, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10664, 1, 1102, 3, 2026, 1200.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10666, 1, 1102, 6, 2026, 1200.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10668, 1, 1102, 7, 2026, 1200.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10670, 1, 1108, 4, 2026, 6200.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10672, 1, 1108, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10674, 1, 1108, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10676, 1, 1110, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10678, 1, 1112, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10680, 1, 1112, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10682, 1, 1114, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10684, 1, 1114, 3, 2026, 6000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10686, 1, 1114, 5, 2026, 4000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10688, 1, 1114, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10690, 1, 1116, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10692, 1, 1116, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10694, 1, 1116, 4, 2026, 600.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10696, 1, 1116, 5, 2026, 1200.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10698, 1, 1118, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10700, 1, 1118, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10702, 1, 1118, 4, 2026, 1600.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10704, 1, 1118, 5, 2026, 1600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10706, 1, 1118, 6, 2026, 1600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10708, 1, 1118, 7, 2026, 1600.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10710, 1, 1120, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10712, 1, 1120, 2, 2026, 3000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10714, 1, 1120, 5, 2026, 4500.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10716, 1, 1122, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10718, 1, 1122, 2, 2026, 1200.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10720, 1, 1122, 3, 2026, 1300.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10722, 1, 1122, 4, 2026, 1300.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10724, 1, 1122, 5, 2026, 1300.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10726, 1, 1122, 6, 2026, 1300.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10728, 1, 1124, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10730, 1, 1124, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10732, 1, 1124, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10734, 1, 1124, 5, 2026, 2000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10736, 1, 1124, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10738, 1, 1124, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10740, 1, 1126, 1, 2026, 3400.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10742, 1, 1126, 2, 2026, 1700.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10744, 1, 1126, 3, 2026, 1800.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10746, 1, 1126, 4, 2026, 1800.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10748, 1, 1126, 5, 2026, 1800.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10750, 1, 1128, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10752, 1, 1128, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10754, 1, 1128, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10756, 1, 1128, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10758, 1, 1128, 5, 2026, 1100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10760, 1, 1128, 6, 2026, 1100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10762, 1, 1128, 7, 2026, 1100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10764, 1, 1130, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10766, 1, 1130, 3, 2026, 500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10768, 1, 1130, 4, 2026, 500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10770, 1, 1130, 5, 2026, 600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10772, 1, 1130, 6, 2026, 600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10774, 1, 1132, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10776, 1, 1134, 1, 2026, 4500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10778, 1, 1134, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10780, 1, 1134, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10782, 1, 1136, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10784, 1, 1136, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10786, 1, 1136, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10788, 1, 1138, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10790, 1, 1138, 5, 2026, 11400.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10792, 1, 1140, 1, 2026, 3000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10794, 1, 1140, 2, 2026, 3000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10796, 1, 1140, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10798, 1, 1142, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10800, 1, 1142, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10802, 1, 1144, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10804, 1, 1144, 4, 2026, 6000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10806, 1, 1144, 6, 2026, 6000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10808, 1, 1146, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10810, 1, 1146, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10812, 1, 1148, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10814, 1, 1150, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10816, 1, 1150, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10818, 1, 1150, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10820, 1, 1150, 4, 2026, 3200.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10822, 1, 1150, 6, 2026, 1600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10824, 1, 1150, 7, 2026, 1600.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10826, 1, 1152, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10828, 1, 1152, 3, 2026, 500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10830, 1, 1152, 4, 2026, 500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10832, 1, 1152, 5, 2026, 600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10834, 1, 1152, 6, 2026, 600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10836, 1, 1154, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10838, 1, 1154, 2, 2026, 3000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10840, 1, 1154, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10842, 1, 1154, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10844, 1, 1154, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10846, 1, 1154, 6, 2026, 1000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10848, 1, 1156, 2, 2026, 4000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10850, 1, 1156, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10852, 1, 1156, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10854, 1, 1156, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10856, 1, 1158, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10858, 1, 1160, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10860, 1, 1160, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10862, 1, 1162, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10864, 1, 1162, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10866, 1, 1162, 4, 2026, 1200.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10868, 1, 1162, 5, 2026, 600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10870, 1, 1162, 6, 2026, 600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10872, 1, 1164, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10874, 1, 1166, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10876, 1, 1166, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10878, 1, 1166, 4, 2026, 500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10880, 1, 1168, 1, 2026, 4500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10882, 1, 1168, 2, 2026, 3000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10884, 1, 1168, 6, 2026, 1000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10886, 1, 1170, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10888, 1, 1170, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10890, 1, 1170, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10892, 1, 1172, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10894, 1, 1172, 4, 2026, 4000.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10896, 1, 1172, 6, 2026, 3000.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10898, 1, 1174, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10900, 1, 1174, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10902, 1, 1174, 3, 2026, 2100.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10904, 1, 1174, 4, 2026, 2100.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10906, 1, 1174, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10908, 1, 1174, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10910, 1, 1174, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10912, 1, 1176, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10914, 1, 1176, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10916, 1, 1176, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10918, 1, 1176, 4, 2026, 3200.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10920, 1, 1176, 6, 2026, 1600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10922, 1, 1176, 7, 2026, 1600.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10924, 1, 1178, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10926, 1, 1178, 3, 2026, 4200.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10928, 1, 1178, 5, 2026, 9000.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10930, 1, 1180, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10932, 1, 1180, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10934, 1, 1180, 3, 2026, 1600.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10936, 1, 1180, 4, 2026, 1600.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10938, 1, 1180, 5, 2026, 1600.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10940, 1, 1180, 6, 2026, 1600.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10942, 1, 1182, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10944, 1, 1182, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10946, 1, 1182, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10948, 1, 1182, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10950, 1, 1182, 5, 2026, 1500.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10952, 1, 1182, 6, 2026, 1500.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10954, 1, 1184, 1, 2026, 500.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10956, 1, 1184, 2, 2026, 500.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10958, 1, 1184, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10960, 1, 1186, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10962, 1, 1186, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10964, 1, 1186, 4, 2026, 2200.00, '2026-04-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10966, 1, 1186, 5, 2026, 1100.00, '2026-05-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10968, 1, 1186, 6, 2026, 1100.00, '2026-06-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10970, 1, 1186, 7, 2026, 1100.00, '2026-07-10', 1, '2026-07-14 13:01:57', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10972, 1, 1188, 1, 2026, 1400.00, '2026-01-10', 1, '2026-07-14 13:01:57', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10974, 1, 1188, 4, 2026, 1400.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10976, 1, 1188, 5, 2026, 1400.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10978, 1, 1190, 1, 2026, 1200.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10980, 1, 1190, 4, 2026, 2400.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10982, 1, 1190, 6, 2026, 1500.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10984, 1, 1192, 1, 2026, 2400.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10986, 1, 1192, 3, 2026, 3600.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10988, 1, 1198, 2, 2026, 200.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10990, 1, 1200, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (10992, 1, 1200, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10994, 1, 1200, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10996, 1, 1200, 4, 2026, 2100.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (10998, 1, 1200, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11000, 1, 1202, 1, 2026, 3400.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11002, 1, 1202, 2, 2026, 1700.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11004, 1, 1202, 3, 2026, 1800.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11006, 1, 1202, 4, 2026, 1800.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11008, 1, 1202, 5, 2026, 1800.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11010, 1, 1204, 1, 2026, 750.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11012, 1, 1204, 4, 2026, 750.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11014, 1, 1204, 5, 2026, 750.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11016, 1, 1206, 2, 2026, 0.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11018, 1, 1208, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11020, 1, 1208, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11022, 1, 1208, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11024, 1, 1210, 2, 2026, 0.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11026, 1, 1210, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11028, 1, 1212, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11030, 1, 1212, 2, 2026, 14000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11032, 1, 1212, 4, 2026, 4000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11034, 1, 1212, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11036, 1, 1214, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11038, 1, 1214, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11040, 1, 1214, 3, 2026, 1500.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11042, 1, 1214, 4, 2026, 1500.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11044, 1, 1214, 5, 2026, 1500.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11046, 1, 1216, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11048, 1, 1218, 1, 2026, 1500.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11050, 1, 1218, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11052, 1, 1218, 3, 2026, 1600.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11054, 1, 1218, 4, 2026, 1600.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11056, 1, 1218, 5, 2026, 1600.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11058, 1, 1218, 6, 2026, 1600.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11060, 1, 1220, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11062, 1, 1220, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11064, 1, 1220, 4, 2026, 4000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11066, 1, 1220, 5, 2026, 4000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11068, 1, 1222, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11070, 1, 1222, 2, 2026, 1400.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11072, 1, 1222, 4, 2026, 1400.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11074, 1, 1224, 2, 2026, 1700.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11076, 1, 1224, 3, 2026, 2100.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11078, 1, 1224, 6, 2026, 4900.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11080, 1, 1226, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11082, 1, 1226, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11084, 1, 1226, 4, 2026, 2200.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11086, 1, 1226, 5, 2026, 1100.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11088, 1, 1226, 6, 2026, 1100.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11090, 1, 1226, 7, 2026, 1100.00, '2026-07-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11092, 1, 1228, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11094, 1, 1228, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11096, 1, 1228, 4, 2026, 4200.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11098, 1, 1228, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11100, 1, 1228, 6, 2026, 2100.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11102, 1, 1228, 7, 2026, 2100.00, '2026-07-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11104, 1, 1230, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11106, 1, 1230, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11108, 1, 1230, 5, 2026, 4000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11114, 1, 1234, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11116, 1, 1236, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11118, 1, 1236, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11120, 1, 1238, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11122, 1, 1240, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11124, 1, 1242, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11126, 1, 1242, 6, 2026, 1000.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11128, 1, 1244, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11130, 1, 1244, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11132, 1, 1244, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11134, 1, 1246, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11136, 1, 1248, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11138, 1, 1248, 2, 2026, 4000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11142, 1, 1250, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11144, 1, 1252, 1, 2026, 3000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11146, 1, 1252, 2, 2026, 5000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11148, 1, 1252, 4, 2026, 2200.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11150, 1, 1252, 5, 2026, 1100.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11152, 1, 1252, 6, 2026, 1100.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11154, 1, 1254, 1, 2026, 2400.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11156, 1, 1254, 3, 2026, 2400.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11158, 1, 1256, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11160, 1, 1258, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11162, 1, 1260, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11164, 1, 1262, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11166, 1, 1264, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11168, 1, 1264, 3, 2026, 10800.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11170, 1, 1264, 5, 2026, 3600.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11172, 1, 1266, 1, 2026, 1700.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11174, 1, 1266, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11176, 1, 1266, 4, 2026, 3450.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11178, 1, 1266, 5, 2026, 1700.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11180, 1, 1266, 7, 2026, 3500.00, '2026-07-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11182, 1, 1268, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11184, 1, 1270, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11186, 1, 1270, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11188, 1, 1270, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11190, 1, 1272, 4, 2026, 1600.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11192, 1, 1272, 5, 2026, 1600.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11194, 1, 1274, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11196, 1, 1274, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11198, 1, 1274, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11200, 1, 1276, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11202, 1, 1278, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11204, 1, 1280, 2, 2026, 0.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11206, 1, 1282, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11208, 1, 1282, 2, 2026, 300.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11210, 1, 1286, 1, 2026, 1000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11212, 1, 1286, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11214, 1, 1286, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11216, 1, 1288, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11218, 1, 1290, 1, 2026, 300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11220, 1, 1292, 1, 2026, 0.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11222, 1, 1292, 4, 2026, 1000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11224, 1, 1292, 5, 2026, 1000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11226, 1, 1294, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 300.00, 'Exam Fee');
INSERT INTO `fee_payments` VALUES (11228, 1, 1294, 5, 2026, 2100.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11230, 1, 1310, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11232, 1, 1312, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11234, 1, 1314, 3, 2026, 1000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11236, 1, 1316, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11238, 1, 1318, 3, 2026, 2000.00, '2026-03-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11240, 1, 1320, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11242, 1, 1322, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11244, 1, 1324, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11246, 1, 1326, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11248, 1, 1328, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11250, 1, 1330, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11252, 1, 1332, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11254, 1, 1334, 4, 2026, 2000.00, '2026-04-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11256, 1, 1336, 5, 2026, 2000.00, '2026-05-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11258, 1, 1338, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11260, 1, 1340, 6, 2026, 2000.00, '2026-06-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11262, 1, 1384, 1, 2026, 1800.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11264, 1, 1384, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11266, 1, 1386, 1, 2026, 1800.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11268, 1, 1386, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11270, 1, 1388, 1, 2026, 2300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11272, 1, 1388, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11274, 1, 1390, 1, 2026, 1300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11276, 1, 1390, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11278, 1, 1392, 1, 2026, 300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11280, 1, 1322, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11282, 1, 1322, 2, 2026, 2300.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11284, 1, 1394, 1, 2026, 2300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11286, 1, 1394, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11288, 1, 1396, 1, 2026, 300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11290, 1, 1396, 2, 2026, 4000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11292, 1, 1398, 1, 2026, 1300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11294, 1, 1402, 1, 2026, 5300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11296, 1, 1402, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11298, 1, 1404, 1, 2026, 1300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11300, 1, 1404, 2, 2026, 1000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11302, 1, 1406, 1, 2026, 1800.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11304, 1, 1406, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11306, 1, 1408, 1, 2026, 3300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11308, 1, 1410, 1, 2026, 2300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11310, 1, 1410, 2, 2026, 2000.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11312, 1, 1412, 2, 2026, 4300.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11314, 1, 1414, 1, 2026, 6300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11316, 1, 1416, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11318, 1, 1416, 2, 2026, 300.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11320, 1, 1418, 1, 2026, 2000.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11322, 1, 1418, 2, 2026, 300.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11324, 1, 1420, 1, 2026, 2300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11326, 1, 1400, 1, 2026, 4800.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11328, 1, 1400, 2, 2026, 1500.00, '2026-02-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11330, 1, 1422, 1, 2026, 300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11332, 1, 1424, 1, 2026, 300.00, '2026-01-10', 1, '2026-07-14 13:01:58', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11346, 1, 1200, 7, 2026, 2100.00, '2026-07-15', 1, '2026-07-15 06:09:38', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11354, 1, 1214, 7, 2026, 1500.00, '2026-07-15', 1, '2026-07-15 09:17:27', 100.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11356, 1, 1066, 7, 2026, 2000.00, '2026-07-15', 1, '2026-07-15 09:41:55', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11358, 1, 1066, 8, 2026, 2000.00, '2026-07-15', 1, '2026-07-15 09:42:50', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11362, 1, 1248, 6, 2026, 1000.00, '2026-07-15', 1, '2026-07-15 09:45:37', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11366, 1, 1042, 7, 2026, 600.00, '2026-07-16', 1, '2026-07-16 05:24:52', 120.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11368, 1, 1042, 6, 2026, 600.00, '2026-07-16', 1, '2026-07-16 05:26:27', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11370, 1, 1042, 5, 2026, 600.00, '2026-07-16', 1, '2026-07-16 05:27:22', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11372, 1, 1248, 7, 2026, 1000.00, '2026-07-16', 1, '2026-07-16 06:54:40', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11374, 1, 1232, 1, 2026, 1500.00, '2026-07-16', 1, '2026-07-16 07:24:32', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11376, 1, 1232, 3, 2026, 1500.00, '2026-07-16', 1, '2026-07-16 07:26:32', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11378, 1, 1232, 4, 2026, 1500.00, '2026-07-16', 1, '2026-07-16 07:26:59', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11382, 1, 1232, 2, 2026, 1500.00, '2026-07-16', 1, '2026-07-16 07:29:08', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11388, 1, 1076, 6, 2026, 1000.00, '2026-07-16', 1, '2026-07-16 07:43:52', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11390, 1, 1076, 7, 2026, 1000.00, '2026-07-16', 1, '2026-07-16 07:44:22', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11394, 1, 1218, 7, 2026, 1600.00, '2026-07-20', 1, '2026-07-20 09:34:02', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11398, 1, 1122, 7, 2026, 1300.00, '2026-07-20', 1, '2026-07-20 09:35:38', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11400, 1, 1180, 7, 2026, 1600.00, '2026-07-20', 1, '2026-07-20 09:37:19', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11402, 1, 1140, 4, 2026, 1000.00, '2026-07-20', 1, '2026-07-20 09:43:06', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11404, 1, 1056, 2, 2026, 1000.00, '2026-07-20', 1, '2026-07-20 09:44:00', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11406, 1, 1208, 7, 2026, 1000.00, '2026-07-22', 1, '2026-07-22 08:37:00', 0.00, 0, 0.00, NULL);
INSERT INTO `fee_payments` VALUES (11408, 1, 1208, 6, 2026, 1000.00, '2026-07-22', 1, '2026-07-22 08:37:30', 0.00, 0, 0.00, NULL);

-- ----------------------------
-- Table structure for hifz_diary_entries
-- ----------------------------
DROP TABLE IF EXISTS `hifz_diary_entries`;
CREATE TABLE `hifz_diary_entries`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `student_id` int NOT NULL,
  `entry_date` date NOT NULL,
  `is_absent` tinyint(1) NULL DEFAULT 0,
  `sabaq_status` enum('recited','not_recited','leave') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'recited',
  `sabaq_from_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_to_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_from_page` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_to_page` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_from_line` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_to_line` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_lines` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabaq_quality` enum('excellent','good','average','weak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sabaq_tajweed` enum('perfect','minor_errors','needs_work','poor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tajweed_mistakes` json NULL,
  `sabqi_status` enum('recited','not_recited','leave') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'recited',
  `sabqi_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabqi_para_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `sabqi_quality` enum('excellent','good','average','weak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `manzil_status` enum('recited','not_recited','leave') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'recited',
  `manzil_para_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `manzil_para_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `manzil_para_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `manzil_from_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `manzil_to_para` tinyint UNSIGNED NULL DEFAULT NULL,
  `manzil_quality` enum('excellent','good','average','weak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `teacher_remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `marked_by` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_entry`(`tenant_id` ASC, `student_id` ASC, `entry_date` ASC) USING BTREE,
  INDEX `fk_hifz_diary_student`(`student_id` ASC) USING BTREE,
  CONSTRAINT `fk_hifz_diary_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_hifz_diary_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hifz_diary_entries
-- ----------------------------
INSERT INTO `hifz_diary_entries` VALUES (170, 4, 214, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (172, 4, 214, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (174, 4, 214, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (176, 4, 214, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (178, 4, 214, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (180, 4, 214, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, 'excellent', NULL, NULL, 'recited', 11, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 11, 'good', NULL, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_diary_entries` VALUES (182, 4, 216, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (184, 4, 216, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (186, 4, 216, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (188, 4, 216, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (190, 4, 216, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (192, 4, 216, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 15, 22, 'excellent', NULL, NULL, 'recited', 21, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 21, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (194, 4, 218, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (196, 4, 218, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (198, 4, 218, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (200, 4, 218, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (202, 4, 218, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (204, 4, 218, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 'average', NULL, NULL, 'recited', 3, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 3, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (206, 4, 220, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (208, 4, 220, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (210, 4, 220, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (212, 4, 220, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (214, 4, 220, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (216, 4, 220, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 6, 'average', NULL, NULL, 'recited', 5, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 5, 'good', NULL, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_diary_entries` VALUES (218, 4, 222, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (220, 4, 222, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (222, 4, 222, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (224, 4, 222, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (226, 4, 222, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (228, 4, 222, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 8, 'average', NULL, NULL, 'recited', 7, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 7, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (230, 4, 224, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (232, 4, 224, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (234, 4, 224, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (236, 4, 224, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (238, 4, 224, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (240, 4, 224, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'average', NULL, NULL, 'recited', 8, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 8, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (242, 4, 226, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (244, 4, 226, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (246, 4, 226, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (248, 4, 226, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (250, 4, 226, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (252, 4, 226, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'average', NULL, NULL, 'recited', 2, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 2, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (254, 4, 228, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (256, 4, 228, '2026-06-20', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (258, 4, 228, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (260, 4, 228, '2026-06-23', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (262, 4, 228, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (264, 4, 228, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 7, 5, 'average', NULL, NULL, 'recited', 4, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 4, 'good', NULL, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_diary_entries` VALUES (266, 4, 230, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (268, 4, 230, '2026-06-20', 1, 'not_recited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'recited', NULL, NULL, 'good', 'recited', NULL, NULL, NULL, 1, NULL, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (270, 4, 230, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (272, 4, 230, '2026-06-23', 1, 'not_recited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'recited', NULL, NULL, 'good', 'recited', NULL, NULL, NULL, 1, NULL, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (274, 4, 230, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (276, 4, 230, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (278, 4, 232, '2026-06-19', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (280, 4, 232, '2026-06-20', 1, 'not_recited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'recited', NULL, NULL, 'good', 'recited', NULL, NULL, NULL, 1, NULL, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (282, 4, 232, '2026-06-22', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (284, 4, 232, '2026-06-23', 1, 'not_recited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'recited', NULL, NULL, 'good', 'recited', NULL, NULL, NULL, 1, NULL, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (286, 4, 232, '2026-06-24', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_diary_entries` VALUES (288, 4, 232, '2026-06-25', 0, 'recited', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'weak', NULL, NULL, 'recited', 1, NULL, 'good', 'recited', NULL, NULL, NULL, 1, 1, 'good', NULL, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');

-- ----------------------------
-- Table structure for hifz_enrollment
-- ----------------------------
DROP TABLE IF EXISTS `hifz_enrollment`;
CREATE TABLE `hifz_enrollment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `enrolled_date` date NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'active',
  `current_phase` enum('tajweed_correction','early','mid','advanced','waqaf_5','waqaf_15','waqaf_25','final_revision','complete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'tajweed_correction',
  `current_para` tinyint UNSIGNED NULL DEFAULT 1,
  `current_para_lines_done` smallint UNSIGNED NULL DEFAULT 0,
  `waqaf_cycles_done` tinyint UNSIGNED NULL DEFAULT 0,
  `total_lines_memorized` int UNSIGNED NULL DEFAULT 0,
  `avg_lines_30d` decimal(5, 2) NULL DEFAULT NULL,
  `predicted_khatam_date` date NULL DEFAULT NULL,
  `current_streak_days` int NULL DEFAULT 0,
  `longest_streak_days` int NULL DEFAULT 0,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_enrollment`(`tenant_id` ASC, `student_id` ASC) USING BTREE,
  INDEX `fk_hifz_enrollment_student`(`student_id` ASC) USING BTREE,
  INDEX `fk_hifz_enrollment_class`(`class_id` ASC) USING BTREE,
  CONSTRAINT `fk_hifz_enrollment_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hifz_enrollment_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_hifz_enrollment_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hifz_enrollment
-- ----------------------------
INSERT INTO `hifz_enrollment` VALUES (2, 2, 162, 16, '2025-01-15', 'active', 'tajweed_correction', 1, 0, 0, 0, NULL, NULL, 0, 0, NULL, '2026-06-25 21:14:13', '2026-06-25 21:14:13');
INSERT INTO `hifz_enrollment` VALUES (4, 2, 164, 16, '2025-01-15', 'active', 'tajweed_correction', 1, 0, 0, 0, NULL, NULL, 0, 0, NULL, '2026-06-25 21:14:13', '2026-06-25 21:14:13');
INSERT INTO `hifz_enrollment` VALUES (34, 4, 214, 56, '2025-01-15', 'active', 'mid', 12, 0, 0, 180, NULL, NULL, 15, 0, NULL, '2026-06-25 21:54:10', '2026-06-25 21:54:10');
INSERT INTO `hifz_enrollment` VALUES (36, 4, 216, 56, '2025-01-15', 'active', 'advanced', 22, 0, 0, 330, NULL, NULL, 20, 0, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_enrollment` VALUES (38, 4, 218, 56, '2025-01-15', 'active', 'early', 4, 0, 0, 60, NULL, NULL, 8, 0, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_enrollment` VALUES (40, 4, 220, 56, '2025-01-15', 'active', 'early', 6, 0, 0, 90, NULL, NULL, 5, 0, NULL, '2026-06-25 21:54:11', '2026-06-25 21:54:11');
INSERT INTO `hifz_enrollment` VALUES (42, 4, 222, 56, '2025-01-15', 'active', 'mid', 8, 0, 0, 120, NULL, NULL, 12, 0, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_enrollment` VALUES (44, 4, 224, 56, '2025-01-15', 'active', 'mid', 9, 0, 0, 135, NULL, NULL, 9, 0, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_enrollment` VALUES (46, 4, 226, 56, '2025-01-15', 'active', 'early', 3, 0, 0, 45, NULL, NULL, 7, 0, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_enrollment` VALUES (48, 4, 228, 56, '2025-01-15', 'active', 'early', 5, 0, 0, 75, NULL, NULL, 4, 0, NULL, '2026-06-25 21:54:12', '2026-06-25 21:54:12');
INSERT INTO `hifz_enrollment` VALUES (50, 4, 230, 56, '2025-01-15', 'active', 'tajweed_correction', 1, 0, 0, 10, NULL, NULL, 0, 0, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');
INSERT INTO `hifz_enrollment` VALUES (52, 4, 232, 56, '2025-01-15', 'active', 'tajweed_correction', 2, 0, 0, 15, NULL, NULL, 0, 0, NULL, '2026-06-25 21:54:13', '2026-06-25 21:54:13');

-- ----------------------------
-- Table structure for hifz_para_completions
-- ----------------------------
DROP TABLE IF EXISTS `hifz_para_completions`;
CREATE TABLE `hifz_para_completions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `student_id` int NOT NULL,
  `para_no` tinyint UNSIGNED NOT NULL,
  `completed_date` date NOT NULL,
  `test_date` date NULL DEFAULT NULL,
  `test_result` enum('pass','fail','conditional_pass','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'pending',
  `test_evaluator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `evaluated_by_self` tinyint(1) NULL DEFAULT 0,
  `test_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_para_completion`(`tenant_id` ASC, `student_id` ASC, `para_no` ASC) USING BTREE,
  INDEX `fk_hifz_para_student`(`student_id` ASC) USING BTREE,
  CONSTRAINT `fk_hifz_para_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_hifz_para_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hifz_para_completions
-- ----------------------------
INSERT INTO `hifz_para_completions` VALUES (126, 4, 214, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (128, 4, 214, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (130, 4, 214, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (132, 4, 214, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (134, 4, 214, 5, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (136, 4, 214, 6, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:10');
INSERT INTO `hifz_para_completions` VALUES (138, 4, 214, 7, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (140, 4, 214, 8, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (142, 4, 214, 9, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (144, 4, 214, 10, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (146, 4, 214, 11, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (148, 4, 216, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (150, 4, 216, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (152, 4, 216, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (154, 4, 216, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (156, 4, 216, 5, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (158, 4, 216, 6, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (160, 4, 216, 7, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (162, 4, 216, 8, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (164, 4, 216, 9, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (166, 4, 216, 10, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (168, 4, 216, 11, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (170, 4, 216, 12, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (172, 4, 216, 13, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (174, 4, 216, 14, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (176, 4, 216, 15, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (178, 4, 216, 16, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (180, 4, 216, 17, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (182, 4, 216, 18, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (184, 4, 216, 19, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (186, 4, 216, 20, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (188, 4, 216, 21, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (190, 4, 218, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (192, 4, 218, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (194, 4, 218, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (196, 4, 220, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (198, 4, 220, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (200, 4, 220, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:11');
INSERT INTO `hifz_para_completions` VALUES (202, 4, 220, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (204, 4, 220, 5, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (206, 4, 222, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (208, 4, 222, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (210, 4, 222, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (212, 4, 222, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (214, 4, 222, 5, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (216, 4, 222, 6, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (218, 4, 222, 7, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (220, 4, 224, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (222, 4, 224, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (224, 4, 224, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (226, 4, 224, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (228, 4, 224, 5, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (230, 4, 224, 6, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (232, 4, 224, 7, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (234, 4, 224, 8, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (236, 4, 226, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (238, 4, 226, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (240, 4, 228, 1, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (242, 4, 228, 2, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (244, 4, 228, 3, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:12');
INSERT INTO `hifz_para_completions` VALUES (246, 4, 228, 4, '2025-11-20', '2025-11-25', 'pass', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:13');
INSERT INTO `hifz_para_completions` VALUES (248, 4, 232, 1, '2025-11-20', '2025-11-25', 'fail', 'Qari Muhammad Ahmad', 0, NULL, '2026-06-25 21:54:13');

-- ----------------------------
-- Table structure for hifz_school_holidays
-- ----------------------------
DROP TABLE IF EXISTS `hifz_school_holidays`;
CREATE TABLE `hifz_school_holidays`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `holiday_date` date NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_holiday`(`tenant_id` ASC, `holiday_date` ASC) USING BTREE,
  CONSTRAINT `fk_hifz_holiday_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hifz_school_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for hifz_waqaf_periods
-- ----------------------------
DROP TABLE IF EXISTS `hifz_waqaf_periods`;
CREATE TABLE `hifz_waqaf_periods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `student_id` int NOT NULL,
  `waqaf_type` enum('waqaf_5','waqaf_15','waqaf_25','final_revision') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `started_date` date NOT NULL,
  `completed_date` date NULL DEFAULT NULL,
  `status` enum('active','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'active',
  `paras_retested` json NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_hifz_waqaf_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_hifz_waqaf_student`(`student_id` ASC) USING BTREE,
  CONSTRAINT `fk_hifz_waqaf_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_hifz_waqaf_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hifz_waqaf_periods
-- ----------------------------

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `date` date NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_holiday_date`(`tenant_id` ASC, `date` ASC) USING BTREE,
  CONSTRAINT `fk_holidays_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holidays
-- ----------------------------

-- ----------------------------
-- Table structure for master_admins
-- ----------------------------
DROP TABLE IF EXISTS `master_admins`;
CREATE TABLE `master_admins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_admins
-- ----------------------------
INSERT INTO `master_admins` VALUES (1, 'superadmin', '$2b$10$hVb7RR5XTz2/Qk5aH7Zy1OmJCmJsSHVXgkJ4NqvVCw04y7esRf57C', NULL, '2026-06-17 06:32:03');

-- ----------------------------
-- Table structure for periods
-- ----------------------------
DROP TABLE IF EXISTS `periods`;
CREATE TABLE `periods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NULL DEFAULT NULL,
  `class_id` int NULL DEFAULT NULL,
  `day_of_week` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` time NULL DEFAULT NULL,
  `end_time` time NULL DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `period_number` int NULL DEFAULT NULL,
  `session_id` int NULL DEFAULT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_periods_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_periods_employee`(`employee_id` ASC) USING BTREE,
  INDEX `fk_periods_class`(`class_id` ASC) USING BTREE,
  INDEX `fk_periods_session`(`session_id` ASC) USING BTREE,
  CONSTRAINT `fk_periods_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_periods_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_periods_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_periods_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of periods
-- ----------------------------

-- ----------------------------
-- Table structure for quran_paras
-- ----------------------------
DROP TABLE IF EXISTS `quran_paras`;
CREATE TABLE `quran_paras`  (
  `id` tinyint UNSIGNED NOT NULL,
  `name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approx_pages` tinyint UNSIGNED NULL DEFAULT 20,
  `approx_lines` smallint UNSIGNED NULL DEFAULT 300,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quran_paras
-- ----------------------------
INSERT INTO `quran_paras` VALUES (1, 'الم', 'Alif Lam Meem', 20, 300);
INSERT INTO `quran_paras` VALUES (2, 'سَيَقُولُ', 'Sayaqool', 20, 300);
INSERT INTO `quran_paras` VALUES (3, 'تِلْكَ الرُّسُلُ', 'Tilkar Rusul', 20, 300);
INSERT INTO `quran_paras` VALUES (4, 'لَنْ تَنَالُوا', 'Lan Tanaloo', 20, 300);
INSERT INTO `quran_paras` VALUES (5, 'وَالْمُحْصَنَاتُ', 'Wal Mohsanat', 20, 300);
INSERT INTO `quran_paras` VALUES (6, 'لَا يُحِبُّ اللَّهُ', 'La Yuhibbullah', 20, 300);
INSERT INTO `quran_paras` VALUES (7, 'وَإِذَا سَمِعُوا', 'Wa Iza Samiu', 20, 300);
INSERT INTO `quran_paras` VALUES (8, 'وَلَوْ أَنَّنَا', 'Wa Lau Annana', 20, 300);
INSERT INTO `quran_paras` VALUES (9, 'قَالَ الْمَلَأُ', 'Qalal Malao', 20, 300);
INSERT INTO `quran_paras` VALUES (10, 'وَاعْلَمُوا', 'Wa Alamu', 20, 300);
INSERT INTO `quran_paras` VALUES (11, 'يَعْتَذِرُونَ', 'Yaetaziroon', 20, 300);
INSERT INTO `quran_paras` VALUES (12, 'وَمَا مِنْ دَابَّةٍ', 'Wa Ma Min Dabbah', 20, 300);
INSERT INTO `quran_paras` VALUES (13, 'وَمَا أُبَرِّئُ', 'Wa Ma Ubrioo', 20, 300);
INSERT INTO `quran_paras` VALUES (14, 'رُبَمَا', 'Rubama', 20, 300);
INSERT INTO `quran_paras` VALUES (15, 'سُبْحَانَ الَّذِي', 'Subhanallazi', 20, 300);
INSERT INTO `quran_paras` VALUES (16, 'قَالَ أَلَمْ', 'Qal Alam', 20, 300);
INSERT INTO `quran_paras` VALUES (17, 'اقْتَرَبَ لِلنَّاسِ', 'Aqtarabo', 20, 300);
INSERT INTO `quran_paras` VALUES (18, 'قَدْ أَفْلَحَ', 'Qad Aflaha', 20, 300);
INSERT INTO `quran_paras` VALUES (19, 'وَقَالَ الَّذِينَ', 'Wa Qalallazina', 20, 300);
INSERT INTO `quran_paras` VALUES (20, 'أَمَّنْ خَلَقَ', 'Amman Khalaq', 20, 300);
INSERT INTO `quran_paras` VALUES (21, 'اتْلُ مَا أُوحِيَ', 'Otlu Ma Oohi', 20, 300);
INSERT INTO `quran_paras` VALUES (22, 'وَمَنْ يَقْنُتْ', 'Wa Man Yaqnut', 20, 300);
INSERT INTO `quran_paras` VALUES (23, 'وَمَا لِيَ', 'Wa Mali', 20, 300);
INSERT INTO `quran_paras` VALUES (24, 'فَمَنْ أَظْلَمُ', 'Faman Azlam', 20, 300);
INSERT INTO `quran_paras` VALUES (25, 'إِلَيْهِ يُرَدُّ', 'Ilaihi Yuraddu', 20, 300);
INSERT INTO `quran_paras` VALUES (26, 'حم', 'Ha Meem', 20, 300);
INSERT INTO `quran_paras` VALUES (27, 'قَالَ فَمَا خَطْبُكُمْ', 'Qala Fama Khatbukum', 20, 300);
INSERT INTO `quran_paras` VALUES (28, 'قَدْ سَمِعَ اللَّهُ', 'Qad Samia Allah', 20, 300);
INSERT INTO `quran_paras` VALUES (29, 'تَبَارَكَ الَّذِي', 'Tabarakallazi', 20, 300);
INSERT INTO `quran_paras` VALUES (30, 'عَمَّ', 'Amma', 20, 300);

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `function_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allowed` tinyint(1) NULL DEFAULT 0,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_role_function_per_tenant`(`tenant_id` ASC, `role` ASC, `function_name` ASC) USING BTREE,
  CONSTRAINT `fk_role_permissions_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for salaries
-- ----------------------------
DROP TABLE IF EXISTS `salaries`;
CREATE TABLE `salaries`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `month` tinyint NOT NULL,
  `year` int NOT NULL,
  `basic_salary` decimal(10, 2) NOT NULL,
  `bonus` decimal(10, 2) NULL DEFAULT 0.00,
  `bonus_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paid_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deduction` decimal(10, 2) NULL DEFAULT 0.00,
  `deduction_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `waived_late_count` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_salary_per_employee_month`(`tenant_id` ASC, `employee_id` ASC, `month` ASC, `year` ASC) USING BTREE,
  INDEX `fk_salaries_employee`(`employee_id` ASC) USING BTREE,
  CONSTRAINT `fk_salaries_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_salaries_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 626 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salaries
-- ----------------------------
INSERT INTO `salaries` VALUES (84, 2, 20, 1, 2026, 28000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (86, 2, 22, 1, 2026, 22000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (88, 2, 24, 1, 2026, 24000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (90, 2, 20, 2, 2026, 28000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (92, 2, 22, 2, 2026, 22000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (94, 2, 24, 2, 2026, 24000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (96, 2, 20, 3, 2026, 28000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (98, 2, 22, 3, 2026, 22000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (100, 2, 24, 3, 2026, 24000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (102, 2, 20, 4, 2026, 28000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (104, 2, 22, 4, 2026, 22000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (106, 2, 24, 4, 2026, 24000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (108, 2, 20, 5, 2026, 28000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (110, 2, 22, 5, 2026, 22000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (112, 2, 24, 5, 2026, 24000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (114, 2, 20, 6, 2026, 28000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (116, 2, 22, 6, 2026, 22000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (118, 2, 24, 6, 2026, 24000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:14:13', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (192, 4, 50, 1, 2026, 28000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (194, 4, 52, 1, 2026, 22000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (196, 4, 54, 1, 2026, 24000.00, 0.00, NULL, '2026-01-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (198, 4, 50, 2, 2026, 28000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (200, 4, 52, 2, 2026, 22000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (202, 4, 54, 2, 2026, 24000.00, 0.00, NULL, '2026-02-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (204, 4, 50, 3, 2026, 28000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (206, 4, 52, 3, 2026, 22000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (208, 4, 54, 3, 2026, 24000.00, 0.00, NULL, '2026-03-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (210, 4, 50, 4, 2026, 28000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (212, 4, 52, 4, 2026, 22000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (214, 4, 54, 4, 2026, 24000.00, 0.00, NULL, '2026-04-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (216, 4, 50, 5, 2026, 28000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (218, 4, 52, 5, 2026, 22000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (220, 4, 54, 5, 2026, 24000.00, 0.00, NULL, '2026-05-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (222, 4, 50, 6, 2026, 28000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:54:15', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (224, 4, 52, 6, 2026, 22000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:54:16', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (226, 4, 54, 6, 2026, 24000.00, 0.00, NULL, '2026-06-01', '2026-06-25 21:54:16', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (426, 1, 1, 1, 2026, 40000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (428, 1, 1, 2, 2026, 40000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (430, 1, 1, 3, 2026, 43000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (432, 1, 1, 4, 2026, 42000.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (434, 1, 1, 5, 2026, 42000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (436, 1, 1, 6, 2026, 42000.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (438, 1, 2, 1, 2026, 35500.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (440, 1, 2, 2, 2026, 35500.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (442, 1, 2, 3, 2026, 38500.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (444, 1, 2, 4, 2026, 39050.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (446, 1, 2, 5, 2026, 39050.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (448, 1, 2, 6, 2026, 39050.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (450, 1, 3, 1, 2026, 12000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (452, 1, 3, 2, 2026, 12000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (454, 1, 3, 3, 2026, 15000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (456, 1, 3, 4, 2026, 35000.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (458, 1, 3, 5, 2026, 35000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (460, 1, 3, 6, 2026, 35000.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (462, 1, 4, 1, 2026, 21000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (464, 1, 4, 2, 2026, 21000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (466, 1, 4, 3, 2026, 24000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (468, 1, 4, 4, 2026, 23100.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (470, 1, 4, 5, 2026, 23100.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (472, 1, 4, 6, 2026, 23100.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (474, 1, 5, 1, 2026, 15500.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (476, 1, 5, 2, 2026, 15500.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (478, 1, 5, 3, 2026, 18500.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (480, 1, 5, 4, 2026, 17050.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (482, 1, 5, 5, 2026, 17050.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (484, 1, 5, 6, 2026, 17050.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (486, 1, 6, 1, 2026, 14000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (488, 1, 6, 2, 2026, 14000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (490, 1, 6, 3, 2026, 17000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (492, 1, 6, 4, 2026, 15400.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (494, 1, 6, 5, 2026, 15400.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (496, 1, 6, 6, 2026, 15400.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (498, 1, 7, 1, 2026, 14500.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (500, 1, 7, 2, 2026, 14500.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (502, 1, 7, 3, 2026, 17500.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (504, 1, 7, 4, 2026, 15950.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (506, 1, 7, 5, 2026, 15950.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (508, 1, 7, 6, 2026, 15950.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (510, 1, 8, 1, 2026, 13500.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (512, 1, 8, 2, 2026, 13500.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (514, 1, 8, 3, 2026, 16500.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (516, 1, 8, 4, 2026, 14850.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (518, 1, 8, 5, 2026, 14850.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (520, 1, 8, 6, 2026, 14850.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (522, 1, 9, 1, 2026, 12000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (524, 1, 9, 2, 2026, 12000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (526, 1, 9, 3, 2026, 15000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (528, 1, 9, 4, 2026, 13200.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (530, 1, 9, 5, 2026, 13200.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (532, 1, 9, 6, 2026, 12760.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (534, 1, 10, 1, 2026, 10000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (536, 1, 10, 2, 2026, 11000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (538, 1, 10, 3, 2026, 15000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (540, 1, 10, 4, 2026, 12600.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (542, 1, 10, 5, 2026, 12600.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (544, 1, 10, 6, 2026, 12180.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (546, 1, 11, 1, 2026, 10000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (548, 1, 11, 2, 2026, 10000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (550, 1, 11, 3, 2026, 13000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (552, 1, 11, 4, 2026, 12600.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (554, 1, 11, 5, 2026, 12600.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (556, 1, 11, 6, 2026, 11760.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (558, 1, 12, 1, 2026, 7100.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (560, 1, 12, 2, 2026, 8000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (562, 1, 12, 3, 2026, 11000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (564, 1, 12, 4, 2026, 8450.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (566, 1, 12, 5, 2026, 8450.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (568, 1, 12, 6, 2026, 9135.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (570, 1, 13, 2, 2026, 1600.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (572, 1, 13, 3, 2026, 13000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (574, 1, 13, 4, 2026, 10000.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (576, 1, 13, 5, 2026, 16000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (578, 1, 14, 3, 2026, 12100.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (580, 1, 14, 4, 2026, 10000.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (582, 1, 14, 5, 2026, 10000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (584, 1, 14, 6, 2026, 8800.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (586, 1, 56, 6, 2026, 8400.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (588, 1, 15, 5, 2026, 5000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (590, 1, 15, 6, 2026, 5000.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (592, 1, 16, 1, 2026, 12000.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (594, 1, 16, 2, 2026, 12000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (596, 1, 16, 3, 2026, 15000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (598, 1, 16, 4, 2026, 13200.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (600, 1, 16, 5, 2026, 13200.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (602, 1, 16, 6, 2026, 13200.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (604, 1, 17, 1, 2026, 11500.00, 0.00, NULL, '2026-01-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (606, 1, 17, 2, 2026, 11500.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (608, 1, 17, 3, 2026, 14500.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (610, 1, 17, 4, 2026, 13200.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (612, 1, 17, 5, 2026, 13200.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (614, 1, 17, 6, 2026, 13200.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (616, 1, 18, 2, 2026, 8000.00, 0.00, NULL, '2026-02-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (618, 1, 18, 3, 2026, 11000.00, 0.00, NULL, '2026-03-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (620, 1, 18, 4, 2026, 8000.00, 0.00, NULL, '2026-04-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (622, 1, 18, 5, 2026, 8000.00, 0.00, NULL, '2026-05-10', '2026-07-14 11:57:40', 0.00, NULL, 0);
INSERT INTO `salaries` VALUES (624, 1, 18, 6, 2026, 7750.00, 0.00, NULL, '2026-06-10', '2026-07-14 11:57:40', 0.00, NULL, 0);

-- ----------------------------
-- Table structure for schema_history
-- ----------------------------
DROP TABLE IF EXISTS `schema_history`;
CREATE TABLE `schema_history`  (
  `version` int NOT NULL,
  `script_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schema_history
-- ----------------------------
INSERT INTO `schema_history` VALUES (1, 'V1__Schema.sql', '2026-06-17 06:26:32');
INSERT INTO `schema_history` VALUES (2, 'V2__Add_Concession_Reason.sql', '2026-06-25 15:38:19');
INSERT INTO `schema_history` VALUES (3, 'V3__Add_Previous_Experience.sql', '2026-06-25 15:50:04');
INSERT INTO `schema_history` VALUES (4, 'V4__Create_Holidays.sql', '2026-06-25 15:52:50');
INSERT INTO `schema_history` VALUES (5, 'V5__Add_Donor_Monthly_Commitment.sql', '2026-06-25 16:23:12');
INSERT INTO `schema_history` VALUES (6, 'V6__Add_Donor_Preferences.sql', '2026-06-25 16:23:12');
INSERT INTO `schema_history` VALUES (7, 'V7__Add_Donor_Preferred_Member.sql', '2026-06-25 17:49:10');
INSERT INTO `schema_history` VALUES (8, 'V8__Add_Fee_Payment_Fines.sql', '2026-06-25 18:16:33');
INSERT INTO `schema_history` VALUES (9, 'V9__Add_Donor_Monthly_Commitment_Amount.sql', '2026-06-25 18:16:33');
INSERT INTO `schema_history` VALUES (10, 'V10__Hifz_Module.sql', '2026-06-25 21:10:12');
INSERT INTO `schema_history` VALUES (11, 'V11__Add_Hifz_Ranges.sql', '2026-06-25 21:52:42');
INSERT INTO `schema_history` VALUES (12, 'V12__Add_Leave_To_Status_Enums.sql', '2026-06-25 22:08:04');
INSERT INTO `schema_history` VALUES (13, 'V13__Add_Sabqi_Para_2.sql', '2026-06-25 22:16:17');
INSERT INTO `schema_history` VALUES (15, 'V15__Add_Donation_Type.sql', '2026-07-02 13:47:45');
INSERT INTO `schema_history` VALUES (16, 'V16__Add_Deductions_And_Additional_Fees.sql', '2026-07-03 21:29:14');
INSERT INTO `schema_history` VALUES (17, 'V17__Add_Date_Of_Leaving_To_Employees.sql', '2026-07-07 02:46:14');
INSERT INTO `schema_history` VALUES (18, 'V18__Add_Admission_Fee.sql', '2026-07-08 06:51:36');
INSERT INTO `schema_history` VALUES (19, 'V19__Add_Late_Attendance_Fields.sql', '2026-07-13 09:28:51');
INSERT INTO `schema_history` VALUES (20, 'V20__Add_Late_Waive_Fields.sql', '2026-07-13 09:28:51');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NULL DEFAULT 0,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_sessions_tenant`(`tenant_id` ASC) USING BTREE,
  CONSTRAINT `fk_sessions_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES (1, '2026', 1, 1);
INSERT INTO `sessions` VALUES (2, '2026', 1, 2);
INSERT INTO `sessions` VALUES (4, '2026', 1, 4);

-- ----------------------------
-- Table structure for student_enrollments
-- ----------------------------
DROP TABLE IF EXISTS `student_enrollments`;
CREATE TABLE `student_enrollments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `session_id` int NOT NULL,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_session`(`student_id` ASC, `session_id` ASC) USING BTREE,
  INDEX `fk_student_enrollments_tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `fk_enrollments_class`(`class_id` ASC) USING BTREE,
  INDEX `fk_enrollments_session`(`session_id` ASC) USING BTREE,
  CONSTRAINT `fk_enrollments_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollments_session` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollments_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_student_enrollments_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_enrollments
-- ----------------------------

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class_id` int NULL DEFAULT NULL,
  `custom_monthly_fee` decimal(10, 2) NULL DEFAULT NULL,
  `has_concession` tinyint(1) NULL DEFAULT 0,
  `concession_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `father_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `father_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emergency_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'male',
  `date_of_admission` date NULL DEFAULT NULL,
  `status` enum('active','left','graduated') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'active',
  `previous_school_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `blood_group` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` int NOT NULL,
  `concession_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admission_fee` decimal(10, 2) NULL DEFAULT 0.00,
  `admission_fee_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'unpaid',
  `admission_fee_payment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_reg_no_per_tenant`(`tenant_id` ASC, `reg_no` ASC) USING BTREE,
  INDEX `fk_students_class`(`class_id` ASC) USING BTREE,
  CONSTRAINT `fk_students_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `fk_students_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (158, 'REG-101', 'Muhammad Ali', 12, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 2, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (160, 'REG-102', 'Fatima Zahra', 14, 800.00, 1, 'Orphan Concession', NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 2, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (162, 'REG-103', 'Hamza Yusuf', 16, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 2, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (164, 'REG-104', 'Bilal Khan', 16, 1500.00, 1, 'Sibling Discount', NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 2, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (210, 'REG-101', 'Muhammad Ali', 52, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (212, 'REG-102', 'Fatima Zahra', 54, 800.00, 1, 'Orphan Concession', NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (214, 'REG-103', 'Hamza Yusuf', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (216, 'REG-104', 'Omar Farooq', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (218, 'REG-105', 'Zubair Ibn Awwam', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (220, 'REG-106', 'Talha Ubaidullah', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (222, 'REG-107', 'Saad Abi Waqas', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (224, 'REG-108', 'Abdur Rahman Awf', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (226, 'REG-109', 'Saeed Zaid', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (228, 'REG-110', 'Abu Ubaidah Jarrah', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (230, 'REG-111', 'Bilal Khan', 56, 1500.00, 1, 'Sibling Discount', NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (232, 'REG-112', 'Anas Malik', 56, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-01-15', 'active', NULL, NULL, 4, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1030, 'MIS-188', 'Anaya Arshad', 78, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1032, 'MIS-260', 'Zara Abbasi', 78, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1034, 'MIS-259', 'Zain Abbasi', 78, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1036, 'MIS-258', 'Hadir Mohaudin', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1038, 'MIS-253', 'Sahrash Alam', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1040, 'MIS-251', 'M.Zohan', 78, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1042, 'MIS-247', 'M.Asim Bashir', 78, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1044, 'MIS-246', 'M.Ismail Hassan', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1046, 'MIS-244', 'M.Adil', 78, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1048, 'MIS-239', 'Fatima Allah Ditta', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1050, 'MIs-218', 'M.Abubakar', 78, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1052, 'MIs-222', 'Ramzan Awan', 78, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1054, 'MIS-223', 'Zunaira awan', 78, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1056, 'MIS-232', 'M-Rohan', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1058, 'MIS-262', 'Sajjad Ali', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1060, 'Mis-268', 'Saif ullah', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1062, 'Mis-267', 'M.Arshamaan', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1064, 'Mis-265', 'Amina Qamar', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1066, 'MIs-264', 'Ansaar Ahmed', 78, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1068, 'MIS-269', 'Fatima Shahid', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1070, 'MIS-257', 'M.Arman', 78, 1350.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1072, 'MIS-277', 'Irtaza Ali', 78, 1500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1074, 'MIs-279', 'Zarish Abbasi', 78, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1076, 'MIS-281', 'Muskan Sanawar', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1078, 'MIS-282', 'Sumiya Noor', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1080, 'MIS-272', 'Urwa kamran', 78, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1082, 'MIS-283', 'Zunaira', 78, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1084, 'MIs-275', 'Abdul wahab', 78, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1086, 'MIS-201', 'M.Areez Irfan', 58, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1088, 'MIS-211', 'Muhammad Ahmad', 58, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1090, 'MIS-209', 'M.Usman Sabeel', 58, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1092, 'MIS-195', 'M.Mustafa', 58, 1300.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1094, 'MIS-202', 'Abdul Rafy Sheraz', 58, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1096, 'MIS-245', 'Hamad', 58, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1098, 'MIS-221', 'Eshal Malik', 58, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1100, 'MIS-215', 'Hassan naveed', 58, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1102, 'MIS-263', 'M.Taha', 58, 900.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1104, 'MIS-127', 'Ismail', 58, 2100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1106, 'MIS-280', 'Shahzaib Abbasi', 58, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1108, 'MIS-270', 'Abbas Khan', 58, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1110, 'MIS-273', 'Hurain Kamran', 58, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1112, 'MIS-274', 'Horia Qadir', 58, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1114, 'MIS-234', 'Hadia nadeem balouch', 60, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1116, 'MIS-190', 'Muhammad Ahmad Ali', 60, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1118, 'MIS-180', 'Hafsa Rafaqat', 60, 500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1120, 'MIS-181', 'Umme Salmah', 60, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1122, 'MIS-182', 'Abdul Ahad', 60, 800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1124, 'MIS-173', 'Ibraheem Abid', 60, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1126, 'MIS-169', 'Aimal Sahar', 60, 300.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1128, 'MIS-172', 'M.Qasim', 60, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1130, 'MIS-165', 'Insha Javed', 60, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1132, 'MIS-142', 'Jalal Nazakat', 60, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1134, 'MIS-204', 'Rameen Fatima', 60, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1136, 'MIS-255', 'khansa', 60, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1138, 'MIS-162', 'Abdul wahab Nadeem', 60, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1140, 'MIS-233', 'Anaya Zubair', 60, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1142, 'MIS-227', 'Ali Hassan', 60, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1144, 'MIS-225', 'M.Murtaza', 60, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1146, 'MIS-TEMP-59', 'Fariya Qadir', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1148, 'MIS-191', 'Muhammad Ammar', 62, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1150, 'MIS-186', 'M.Arham', 62, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1152, 'MIS-166', 'Bisma Javed', 62, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1154, 'MIS-177', 'Arahm zeeshan', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1156, 'MIS-098', 'Meesam Abbas', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1158, 'MIS-161', 'Ubaid Ullah', 62, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1160, 'MIS-119', 'Reham Gull', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1162, 'MIS-081', 'Tayyab', 62, 1500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1164, 'MIS-094', 'Sumaya Gull', 62, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1166, 'MIS-082', 'Tayyaba Naveed', 62, 1500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1168, 'MIS-203', 'Hareem Fatima', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1170, 'MIs-254', 'Khulood', 62, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1172, 'MIS-196', 'Zara amin', 64, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1174, 'MIS-200', 'Muhammad Yahya', 64, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1176, 'MIS-185', 'M.Azan', 64, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1178, 'MIS-156', 'Fahad Nadeem', 64, 300.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1180, 'MIS-155', 'Noor Zahra', 64, 500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1182, 'MIS-159', 'Samiullah', 64, 500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1184, 'MIS-115', 'Aiman Nazakat', 64, 1600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1186, 'MIS-105', 'Azab Shahzad', 64, 1000.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1188, 'MIS-112', 'Hadir Ali', 64, 700.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1190, 'MIS-134', 'M.Farhan', 64, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1192, 'MIS-100', 'Nayab Fatima', 64, 1100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1194, 'MIS-096', 'Sila', 64, 2100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-30', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1196, 'MIS-124', 'Muqadas', 64, 2100.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'waived', NULL);
INSERT INTO `students` VALUES (1198, 'MIS-125', 'Rabia', 64, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1200, 'MIS-124-2', 'Fabiha Fatima', 64, 0.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1202, 'MIS-126', 'Ayat Zahra', 64, 300.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1204, 'MIS-256', 'Alishba', 64, 1350.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1206, 'MIS-216', 'Hadir Ali', 64, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1208, 'MIs-261', 'Fariha Gull', 64, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1210, 'MIS-248', 'Shahzain', 64, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1212, 'MIS-224', 'Abdul Hadi Mir', 64, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1214, 'MIS-217', 'Aysha Abbas', 66, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1216, 'MIS-189', 'Sulman Arshad', 66, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1218, 'MIS-104', 'M.Hussain', 66, 500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1220, 'MIS-091', 'Arham Abbasi', 66, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1222, 'MIS-500', 'Minahil Naveed', 66, 700.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1224, 'MIS-067', 'Ayat Noor', 66, 400.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1226, 'MIS-102', 'Tehzeeb Shakir', 66, 1000.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1228, 'MIS-103', 'Haya Shakir', 66, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1230, 'MIS-084', 'Abdul Rafay', 66, 0.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1232, 'MIS-078', 'Huzefa Nawaz', 66, 600.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1234, 'MIS-075', 'Mohsin Ali', 66, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1236, 'MIS-079', 'wahib Ali', 66, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1238, 'MIS-041', 'Aysha Gull', 66, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1240, 'MIS-117', 'Mubashir', 66, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1242, 'MIs-278', 'Saima', 66, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1244, 'MIS-130', 'Abdullah', 66, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1246, 'MIS-065', 'Abdul Hanan', 66, 800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1248, 'MIS-230', 'M.Sufiyan', 68, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1250, 'MIS-192', 'Afia', 68, 1800.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1252, 'MIS-080', 'Zainab Noor', 68, 1000.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1254, 'MIS-099', 'Arooj Fatima', 68, 1100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-28', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1256, 'MIS-093', 'Alisbah', 68, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1258, 'MIS-131', 'Hassam', 68, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1260, 'MIS-054', 'Isra', 68, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1262, 'MIS-023', 'Hadiya bibi', 70, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1264, 'MIS-158', 'Hadia Nadeem', 70, 300.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-30', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1266, 'MIS-068', 'M.Anwar', 70, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1268, 'MIS-030', 'Ariba Nazakat', 70, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1270, 'MIS-074', 'Fizza Saleem', 70, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1272, 'MIS-271', 'Aliza Arshad', 70, 500.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1274, 'MIS-130-2', 'Ali Raza', 70, 1100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1276, 'MIS-113', 'M.Ahmed Raz', 70, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1278, 'MIS-116', 'Aafia Bibi', 72, 2100.00, 1, 'Scholarship/Concession support\r\nThe father work as a cook and live in a rented house with 6 children. I cannot afford the full fee.', 'Khan Waiz', '0313-4741852', '0313-4741852', '2015-07-03', 'House No DK-739 Street no 16 Dhoke Kashmirian', 'female', '2022-08-12', 'active', 'Govt.Girls Primary School Nalotha', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1280, 'MIS-022', 'Maira Afzal', 72, 2100.00, 1, 'Scholarship/Concession support\r\nHer father is a daily wage worker and mother works as a housemaid. They live in a rented house and have 5 school-going children. Due to their low income, they are unable to pay the school fee. Therefore, she studies free of cost.', 'Muhammad Afzal', '03465902855', '03045674464', '2014-06-10', 'Dhoke Kashmirian,  Rawalpindi', 'female', '2019-03-28', 'active', 'None', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1282, 'MIS-020', 'Tayyaba Faial', 72, 2100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-30', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1284, 'MIS-97', 'Hijab Zahra', 72, 2100.00, 0, 'He income is very limited as he works on daily wages. His mother is a housewife and they live in a rented house. With five children to support, they were unable to pay the fees due to high household expenses.\"', 'Atif Hussain', '0341-5786938', '0344-5517259', '2014-08-13', 'House No B-133 Rehman street no 04 Dhoke Kashmirian Rawalpindi', 'female', '2022-03-13', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1286, 'MIS-129', 'Tayyaba Fatima', 72, 1100.00, 1, 'Scholarship/Concession support\r\nHer father is a shopkeeper and her mother is a housewife. They are a family of five siblings. Their household income is very low. Because of this, it is difficult for them to pay the full school fees for their daughter.', 'Qamar Zaman', '0321-5067327', '0317-3030800', '2013-03-27', 'DK 363 Dhpke Kashmiriyan Rawalpindi', 'female', '2023-06-09', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1288, 'MIS-029', 'Amna Nazakat', 72, 2100.00, 1, 'Scholarship/Concession support\r\nThey have Seven children with them. The house is rented. The husband does labor work and the mother works in other people\'s houses. Household expenses are very high, which is why they are unable to pay the children\'s fees.', 'Nazakat Khan', '0319-8045209', '0319-8045209', '2014-12-13', 'Dhoke Kashmirian Rawalpindi', 'female', '2019-10-16', 'active', 'None', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1290, 'MIs-146', 'Nayab Ali', 72, 2100.00, 0, 'The girl is an orphan and she has no other siblings. Her mother has remarried someone else. Because of this, the girl lives with a relative, and that relative is not financially strong enough to afford her school fees. Therefore, the girl\'s fees have been waived.\"', 'Ali Abbas', '0345-6002213', '0334-6007730', '2014-11-27', 'Dhok Kala Khan Rawalpindi ', 'female', '2023-01-13', 'active', 'Danish Montessori School Kot Addu', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1292, 'MIS-050', 'Ayesha Qadar', 72, 1100.00, 1, 'Scholarship/Concession support\r\nFather is employed in a private job and They live in a rented house. They have five daughters and her mother is a housewife. Their income is very low, therefore They are unable to pay the full school fee and need concession \r\n\"', 'Abdul Qadir', '0314-5353970', '0316-5368430', '2015-07-23', 'Street No 291 Mohala Dhoke Kala Khan Rawalpindi', 'female', '2021-08-11', 'active', 'None', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1294, 'MIS-028', 'Hoorum Batool', 72, 0.00, 0, NULL, 'Iftikhar Ali', '0308-5121410', '0309-5419736', '2015-07-06', 'House No 734 Dhoke Kashmirian Rawalpindi', 'female', '2019-03-14', 'active', 'None', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1296, 'MIS-012', 'Muhammad Sadique', 74, 0.00, 0, NULL, 'Shakir Ramzan', '0332-5272331', '0334-5258845', '2013-08-24', 'DK 530 Street 3 Mohalla Dhoke Paracha Rawalpindi', 'male', '2024-03-10', 'active', 'Muhimian islamic school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1298, 'MIS-021', 'Muhammad Umer', 74, 0.00, 0, NULL, NULL, NULL, NULL, NULL, 'House No 1', 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1300, 'MIS-026', 'Abdullah Saleem', 74, 0.00, 0, NULL, 'Saleem Akhtar', '0331-5466712', '0314-7424072', '2014-02-25', 'Dhoke Kashmirian Rawalpindi', 'male', '2024-04-20', 'active', 'Muhimian islamic school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1302, 'MIs-028-2', 'Muhammad Rayan Atif', 74, 0.00, 0, NULL, 'Mohammad Atif Shahzad', '0335-9808320', '0347-5177579', '2012-09-26', 'House No Dk -260  Street no 07 Dhoke Kashmirian', 'male', '2024-08-06', 'active', 'New Muslim School Rawalpindi', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1304, 'MIS-035', 'Abad Khan', 74, 0.00, 0, NULL, 'Sareel Khan', '0300-5439412', '0307-8344448', '2012-04-22', 'Street no 19 Dhoke Kasmirian Rawalpindi', 'male', '2025-07-31', 'active', 'Light House School Dhoke Kashmirian', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1306, 'MIS-037', 'Hasnain Ali', 74, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1308, 'MIs-039', 'Adil Khanviz', 74, 0.00, 0, NULL, 'Khanvaiz', '0313-4741852', '0313-4741852', '2011-04-01', 'House no DK-839 Mohallah Dhoke Kashmirian Rawalpindi', 'male', '2025-12-03', 'active', 'Govt Primary School Distt Abata abad', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1310, 'Mis-041-2', 'Mukaram', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1312, 'MIs-042', 'Rahmat ali Shah', 74, 100.00, 1, 'Scholarship/Concession support', 'Matloob Hussain Shah', '0317-5783105', '0312-5678174', '2014-08-10', 'House no DP 734 Mohallah  ALLAH Dad Paracha Sat light Town Rawalpindi', 'male', '2026-03-06', 'active', 'Muhimian islamic school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1314, 'MIs-043', 'Abdul Manan', 74, 1100.00, 1, 'Scholarship/Concession support', 'Sheraz Ahmed Saddique', '0345-5211201', '0341-2178727', '2014-08-13', 'House No AD 146 Yousifi Masjid near Street Aliya Abad Dhoke Kashmirian', 'male', '2026-03-05', 'active', 'Muhimian islamic school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1316, 'MIS-044', 'M.Ahmed Nisar', 74, 100.00, 1, 'Scholarship/Concession support', 'Mohammad Nisar', '0331-7602942', '0333-9930357', '2016-10-10', 'House No D-242 Sat light Town D-Block Rawalpindi', 'male', '2026-04-14', 'active', 'The Prep School ', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1318, 'MIS-045', 'M.Azaan Nisar', 74, 100.00, 1, 'Scholarship/Concession support', 'Mohammad Nisar', '0331-7602942', '0333-9930357', '2015-10-01', 'House No D-242 D Block Sat light Town Rawalpindi ', 'male', '2026-04-14', 'active', 'The Prep School ', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1320, 'MIS-046', 'M.Ali', 74, 100.00, 1, 'Scholarship/Concession support', 'Assad Mehmood', '0333-5103359', '0322-5103359', '2015-11-20', 'House No DK-688 Dhoke Paracha Rawalpindi', 'male', '2026-04-14', 'active', 'Muhimian islamic school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1322, 'MIS-047', 'M.Shahzain', 74, 100.00, 1, 'Scholarship/Concession support', 'Raja Meer Afzal', '0314-1595840', '0311-5483277', '2015-04-10', 'House No 337 Mohallah Dhoke Kashmirian Rawalpindi', 'male', '2026-04-17', 'active', 'Govt,Boys High School Zarai Form Rawalpindi', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1324, 'MIS-048', 'Roman Ahmed', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1326, 'MIs-049', 'Wahaj Ahmed', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1328, 'MIS-050-2', 'M.Mujtaba', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1330, 'MIS-051', 'Ahsan Rizwan', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2025-12-31', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1332, 'MIs-052', 'M.Azan', 74, 100.00, 1, 'Scholarship/Concession support', 'Aroungzaib', '0370-9536532', '0370-9536532', '2015-09-08', 'House no DK 299 D Street no 14,Dhoke Kashmirian Rawalpindi', 'male', '2026-04-20', 'active', 'The Ideal Secondary School', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1334, 'MIs-053', 'Abdul Ghani', 74, 100.00, 1, 'Scholarship/Concession support', 'Wasif', '0311-5865173', '0332-5162133', '2016-09-10', 'House no AD 62 Mohallah Aliya Abad Dhoke Kashmiriyan', 'male', '2026-04-14', 'active', 'Assand international school', NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1336, 'MIS-054-2', 'Muhammad', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1338, 'MIS-055', 'Abdul hadi', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1340, 'MIS-056', 'Saalar', 74, 100.00, 1, 'Scholarship/Concession support', NULL, NULL, NULL, NULL, NULL, 'male', '2026-01-01', 'active', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1384, 'MIS-171', 'Ibraheem Hasan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1386, 'MIS-132', 'Safa Sabeel', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1388, 'MIS-122', 'Umair Ch.', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1390, 'MIS-235', 'Rahmat Ali', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1392, 'MIS-193', 'Muhammad Saad', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1394, 'MIS-121', 'Ahmad Hassan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1396, 'MIS-062', 'Mukarram Khan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1398, 'MIS-066', 'Abdul Mannan', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1400, 'MIS-040', 'Saim', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1402, 'MIS-213', 'Shifa Zahra', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1404, 'MIS-226', 'M.Abubaker tanveer', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1406, 'MIS-005', 'Usman Ghani', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1408, 'MIS-184', 'Eshal Mustafa', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1410, 'MIS-128', 'Urwah Ali', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1412, 'MIS-059', 'Hareem Zahra', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1414, 'MIS-249', 'Eshal Fatima', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1416, 'MIS-228', 'Eshal Fatima', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1418, 'MIS-229', 'Mahnoor Fatima', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1420, 'MIS-183', 'Arham Mustafa', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1422, 'MIS-120', 'Shumaila', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);
INSERT INTO `students` VALUES (1424, 'MIS-143', 'M.Sohail', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, 'left', NULL, NULL, 1, NULL, 0.00, 'unpaid', NULL);

-- ----------------------------
-- Table structure for tenants
-- ----------------------------
DROP TABLE IF EXISTS `tenants`;
CREATE TABLE `tenants`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subdomain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `custom_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('active','suspended','maintenance') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'active',
  `plan_tier` enum('free','pro','enterprise') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'free',
  `max_students` int NULL DEFAULT 200,
  `max_employees` int NULL DEFAULT 30,
  `max_classes` int NULL DEFAULT 15,
  `enable_custom_branding` tinyint(1) NULL DEFAULT 0,
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/images/default_logo.png',
  `school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `primary_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#3b82f6',
  `secondary_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#1d4ed8',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enable_donations_module` tinyint(1) NULL DEFAULT 1,
  `enable_hifz_module` tinyint(1) NULL DEFAULT 0,
  `school_start_time` time NULL DEFAULT '08:00:00',
  `school_end_time` time NULL DEFAULT '14:00:00',
  `late_threshold_minutes` int NULL DEFAULT 15,
  `late_days_deduction_trigger` int NULL DEFAULT 4,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subdomain`(`subdomain` ASC) USING BTREE,
  UNIQUE INDEX `custom_domain`(`custom_domain` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenants
-- ----------------------------
INSERT INTO `tenants` VALUES (1, 'Muhaimin Islamic School', 'mis', NULL, 'active', 'pro', 200, 30, 15, 0, '/images/logos/tenant-1-1781675102446.png', 'Muhaimin Islamic School Rawalpindi', '#3b82f6', '#1d4ed8', '2026-06-17 06:26:34', '2026-06-17 07:45:02', 1, 0, '08:00:00', '14:00:00', 15, 4);
INSERT INTO `tenants` VALUES (2, 'Demo Academy', 'smsdemo', NULL, 'active', 'pro', 200, 30, 15, 0, '/images/default_logo.png', 'Demo Islamic Academy Rawalpindi', '#0f766e', '#0d9488', '2026-06-25 21:14:13', '2026-06-25 21:14:13', 1, 1, '08:00:00', '14:00:00', 15, 4);
INSERT INTO `tenants` VALUES (4, 'Demo Academy', 'school-ms', NULL, 'active', 'pro', 200, 30, 15, 0, '/images/default_logo.png', 'My Islamic School (Demo)', '#0f766e', '#0d9488', '2026-06-25 21:25:20', '2026-06-25 21:47:22', 1, 1, '08:00:00', '14:00:00', 15, 4);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'employee',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tenant_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username_per_tenant`(`tenant_id` ASC, `username` ASC) USING BTREE,
  CONSTRAINT `fk_users_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2b$10$M1IY6qBDG9A.L4gJ7GCDIuy8PSEGuTZ.pcm6pg.WhUJpkZkI0UfCC', 'admin', '2026-06-17 06:26:34', 1);
INSERT INTO `users` VALUES (2, 'admin', '$2b$10$kg1Oe5tW0sieo5u6CTwyPOVvRzZdp5MUEFugw0CQREOAJD0zDDGJ2', 'admin', '2026-06-25 21:14:13', 2);
INSERT INTO `users` VALUES (12, 'admin', '$2b$10$iLVMUjFl90Oof.rpNJUTnefhTGsdoPhhmYZnJKLZTgoDyuOrl/nL2', 'admin', '2026-06-25 21:54:09', 4);

SET FOREIGN_KEY_CHECKS = 1;
