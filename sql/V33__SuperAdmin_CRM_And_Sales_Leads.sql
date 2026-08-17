-- V33__SuperAdmin_CRM_And_Sales_Leads.sql

-- 1. Master Admins Table Enhancements (Roles & Rep Profiles)
ALTER TABLE `master_admins`
ADD COLUMN `role` ENUM('super_admin', 'sales_rep') NOT NULL DEFAULT 'super_admin',
ADD COLUMN `name` VARCHAR(150) NULL,
ADD COLUMN `phone` VARCHAR(50) NULL,
ADD COLUMN `is_active` TINYINT(1) DEFAULT 1,
ADD COLUMN `commission_rate` DECIMAL(5,2) DEFAULT 0.00;

-- 2. CRM Leads Table
CREATE TABLE IF NOT EXISTS `crm_leads` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `school_name` VARCHAR(255) NOT NULL,
  `contact_person` VARCHAR(150) NOT NULL,
  `designation` VARCHAR(100) NULL,
  `phone` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NULL,
  `address` TEXT NULL,
  `city` VARCHAR(100) NULL,
  `est_students` INT DEFAULT 0,
  `current_system` VARCHAR(150) NULL,
  `assigned_to` INT NULL,
  `status` ENUM('new', 'contacted', 'meeting_scheduled', 'demo_given', 'negotiation', 'won', 'lost') DEFAULT 'new',
  `lead_source` VARCHAR(100) NULL,
  `agreed_setup_fee` DECIMAL(10,2) DEFAULT 0.00,
  `agreed_monthly_rate` DECIMAL(10,2) DEFAULT 0.00,
  `agreed_rate_per_student` DECIMAL(10,2) DEFAULT 0.00,
  `rep_commission_pct` DECIMAL(5,2) DEFAULT 0.00,
  `rep_commission_flat` DECIMAL(10,2) DEFAULT 0.00,
  `converted_tenant_id` INT NULL,
  `notes` TEXT NULL,
  `next_meeting_date` DATETIME NULL,
  `next_meeting_agenda` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_leads_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `master_admins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_crm_leads_converted_tenant` FOREIGN KEY (`converted_tenant_id`) REFERENCES `tenants` (`id`) ON DELETE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 3. CRM Meetings & Customer Feedback Table
CREATE TABLE IF NOT EXISTS `crm_meetings` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `lead_id` INT NOT NULL,
  `rep_id` INT NOT NULL,
  `meeting_date` DATETIME NOT NULL,
  `meeting_type` ENUM('in_person_visit', 'phone_call', 'video_demo', 'follow_up') DEFAULT 'in_person_visit',
  `person_met` VARCHAR(150) NULL,
  `discussion_notes` TEXT NOT NULL,
  `client_demands` TEXT NULL,
  `outcome` ENUM('positive', 'neutral', 'requires_followup', 'demo_requested', 'deal_closed', 'rejected') DEFAULT 'requires_followup',
  `next_meeting_date` DATETIME NULL,
  `next_meeting_agenda` VARCHAR(255) NULL,
  `expense_amount` DECIMAL(10,2) DEFAULT 0.00,
  `expense_notes` VARCHAR(255) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_meetings_lead` FOREIGN KEY (`lead_id`) REFERENCES `crm_leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_crm_meetings_rep` FOREIGN KEY (`rep_id`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- 4. CRM Rep Financial Ledger (Funds & Expenses)
CREATE TABLE IF NOT EXISTS `crm_rep_finances` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `rep_id` INT NOT NULL,
  `transaction_type` ENUM('disbursement', 'expense_claim', 'commission_payout') NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `transaction_date` DATE NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `receipt_url` VARCHAR(255) NULL,
  `created_by` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_crm_finances_rep` FOREIGN KEY (`rep_id`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_crm_finances_created_by` FOREIGN KEY (`created_by`) REFERENCES `master_admins` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
