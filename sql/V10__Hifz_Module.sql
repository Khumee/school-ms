SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 1. Tenant Module Flags (safe — checked in migrate.js)
-- ============================================================
ALTER TABLE tenants ADD COLUMN enable_donations_module TINYINT(1) DEFAULT 1;
ALTER TABLE tenants ADD COLUMN enable_hifz_module      TINYINT(1) DEFAULT 0;

-- ============================================================
-- 2. Hifz Class Flag on Classes Table
-- ============================================================
ALTER TABLE classes   ADD COLUMN is_hifz_class             TINYINT(1) DEFAULT 0;
ALTER TABLE employees ADD COLUMN assigned_hifz_class_id    INT        DEFAULT NULL;

-- ============================================================
-- 4. Quran Para Reference (30 rows — static)
-- ============================================================
CREATE TABLE IF NOT EXISTS `quran_paras` (
  `id`            TINYINT UNSIGNED NOT NULL,
  `name_ar`       VARCHAR(100) NOT NULL,
  `name_en`       VARCHAR(100) NOT NULL,
  `approx_pages`  TINYINT UNSIGNED DEFAULT 20,
  `approx_lines`  SMALLINT UNSIGNED DEFAULT 300,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `quran_paras` (`id`, `name_ar`, `name_en`) VALUES
(1,  'الم',              'Alif Lam Meem'),
(2,  'سَيَقُولُ',         'Sayaqool'),
(3,  'تِلْكَ الرُّسُلُ', 'Tilkar Rusul'),
(4,  'لَنْ تَنَالُوا',   'Lan Tanaloo'),
(5,  'وَالْمُحْصَنَاتُ', 'Wal Mohsanat'),
(6,  'لَا يُحِبُّ اللَّهُ', 'La Yuhibbullah'),
(7,  'وَإِذَا سَمِعُوا', 'Wa Iza Samiu'),
(8,  'وَلَوْ أَنَّنَا',  'Wa Lau Annana'),
(9,  'قَالَ الْمَلَأُ',  'Qalal Malao'),
(10, 'وَاعْلَمُوا',      'Wa Alamu'),
(11, 'يَعْتَذِرُونَ',    'Yaetaziroon'),
(12, 'وَمَا مِنْ دَابَّةٍ', 'Wa Ma Min Dabbah'),
(13, 'وَمَا أُبَرِّئُ',  'Wa Ma Ubrioo'),
(14, 'رُبَمَا',           'Rubama'),
(15, 'سُبْحَانَ الَّذِي', 'Subhanallazi'),
(16, 'قَالَ أَلَمْ',     'Qal Alam'),
(17, 'اقْتَرَبَ لِلنَّاسِ', 'Aqtarabo'),
(18, 'قَدْ أَفْلَحَ',    'Qad Aflaha'),
(19, 'وَقَالَ الَّذِينَ', 'Wa Qalallazina'),
(20, 'أَمَّنْ خَلَقَ',   'Amman Khalaq'),
(21, 'اتْلُ مَا أُوحِيَ', 'Otlu Ma Oohi'),
(22, 'وَمَنْ يَقْنُتْ',  'Wa Man Yaqnut'),
(23, 'وَمَا لِيَ',       'Wa Mali'),
(24, 'فَمَنْ أَظْلَمُ',  'Faman Azlam'),
(25, 'إِلَيْهِ يُرَدُّ', 'Ilaihi Yuraddu'),
(26, 'حم',               'Ha Meem'),
(27, 'قَالَ فَمَا خَطْبُكُمْ', 'Qala Fama Khatbukum'),
(28, 'قَدْ سَمِعَ اللَّهُ', 'Qad Samia Allah'),
(29, 'تَبَارَكَ الَّذِي', 'Tabarakallazi'),
(30, 'عَمَّ',             'Amma');

-- ============================================================
-- 5. Hifz Enrollment (one row per student)
-- ============================================================
CREATE TABLE IF NOT EXISTS `hifz_enrollment` (
  `id`                      INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id`               INT NOT NULL,
  `student_id`              INT NOT NULL,
  `class_id`                INT NOT NULL,
  `enrolled_date`           DATE NOT NULL,
  `status`                  ENUM('active','inactive') DEFAULT 'active',
  `current_phase`           ENUM('tajweed_correction','early','mid','advanced',
                                 'waqaf_5','waqaf_15','waqaf_25',
                                 'final_revision','complete') DEFAULT 'tajweed_correction',
  `current_para`            TINYINT UNSIGNED DEFAULT 1,
  `current_para_lines_done` SMALLINT UNSIGNED DEFAULT 0,
  `waqaf_cycles_done`       TINYINT UNSIGNED DEFAULT 0,
  `total_lines_memorized`   INT UNSIGNED DEFAULT 0,
  `avg_lines_30d`           DECIMAL(5,2) DEFAULT NULL,
  `predicted_khatam_date`   DATE DEFAULT NULL,
  `current_streak_days`     INT DEFAULT 0,
  `longest_streak_days`     INT DEFAULT 0,
  `notes`                   TEXT DEFAULT NULL,
  `created_at`              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at`              TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_enrollment` (`tenant_id`, `student_id`),
  CONSTRAINT `fk_hifz_enrollment_tenant`  FOREIGN KEY (`tenant_id`)  REFERENCES `tenants`(`id`)  ON DELETE CASCADE,
  CONSTRAINT `fk_hifz_enrollment_student` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hifz_enrollment_class`   FOREIGN KEY (`class_id`)   REFERENCES `classes`(`id`)  ON DELETE RESTRICT
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 6. Hifz Daily Diary Entries
-- ============================================================
CREATE TABLE IF NOT EXISTS `hifz_diary_entries` (
  `id`               INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id`        INT NOT NULL,
  `student_id`       INT NOT NULL,
  `entry_date`       DATE NOT NULL,
  `is_absent`        TINYINT(1) DEFAULT 0,

  -- Sabaq (سبق)
  `sabaq_status`     ENUM('recited','not_recited') DEFAULT 'recited',
  `sabaq_lines`      TINYINT UNSIGNED NULL,
  `sabaq_para`       TINYINT UNSIGNED NULL,
  `sabaq_quality`    ENUM('excellent','good','average','weak') NULL,
  `sabaq_tajweed`    ENUM('perfect','minor_errors','needs_work','poor') NULL,
  `tajweed_mistakes` JSON NULL,

  -- Sabqi (سبقی)
  `sabqi_status`     ENUM('recited','not_recited') DEFAULT 'recited',
  `sabqi_para`       TINYINT UNSIGNED NULL,
  `sabqi_quality`    ENUM('excellent','good','average','weak') NULL,

  -- Manzil (منزل)
  `manzil_status`    ENUM('recited','not_recited') DEFAULT 'recited',
  `manzil_from_para` TINYINT UNSIGNED NULL,
  `manzil_to_para`   TINYINT UNSIGNED NULL,
  `manzil_quality`   ENUM('excellent','good','average','weak') NULL,

  `teacher_remarks`  TEXT NULL,
  `marked_by`        INT NULL,
  `created_at`       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at`       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  UNIQUE KEY `unique_entry` (`tenant_id`, `student_id`, `entry_date`),
  CONSTRAINT `fk_hifz_diary_tenant`  FOREIGN KEY (`tenant_id`)  REFERENCES `tenants`(`id`)  ON DELETE CASCADE,
  CONSTRAINT `fk_hifz_diary_student` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 7. Para Completions & Tests
-- ============================================================
CREATE TABLE IF NOT EXISTS `hifz_para_completions` (
  `id`                  INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id`           INT NOT NULL,
  `student_id`          INT NOT NULL,
  `para_no`             TINYINT UNSIGNED NOT NULL,
  `completed_date`      DATE NOT NULL,
  `test_date`           DATE NULL,
  `test_result`         ENUM('pass','fail','conditional_pass','pending') DEFAULT 'pending',
  `test_evaluator_name` VARCHAR(100) NULL,
  `evaluated_by_self`   TINYINT(1) DEFAULT 0,
  `test_notes`          TEXT NULL,
  `created_at`          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_para_completion` (`tenant_id`, `student_id`, `para_no`),
  CONSTRAINT `fk_hifz_para_tenant`  FOREIGN KEY (`tenant_id`)  REFERENCES `tenants`(`id`)  ON DELETE CASCADE,
  CONSTRAINT `fk_hifz_para_student` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 8. Waqaf Periods
-- ============================================================
CREATE TABLE IF NOT EXISTS `hifz_waqaf_periods` (
  `id`             INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id`      INT NOT NULL,
  `student_id`     INT NOT NULL,
  `waqaf_type`     ENUM('waqaf_5','waqaf_15','waqaf_25','final_revision') NOT NULL,
  `started_date`   DATE NOT NULL,
  `completed_date` DATE NULL,
  `status`         ENUM('active','completed') DEFAULT 'active',
  `paras_retested` JSON NULL,
  `created_at`     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_hifz_waqaf_tenant`  FOREIGN KEY (`tenant_id`)  REFERENCES `tenants`(`id`)  ON DELETE CASCADE,
  CONSTRAINT `fk_hifz_waqaf_student` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- 9. School Holidays (for alarm engine)
-- ============================================================
CREATE TABLE IF NOT EXISTS `hifz_school_holidays` (
  `id`           INT AUTO_INCREMENT PRIMARY KEY,
  `tenant_id`    INT NOT NULL,
  `holiday_date` DATE NOT NULL,
  `description`  VARCHAR(150) NULL,
  `created_at`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_holiday` (`tenant_id`, `holiday_date`),
  CONSTRAINT `fk_hifz_holiday_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenants`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
