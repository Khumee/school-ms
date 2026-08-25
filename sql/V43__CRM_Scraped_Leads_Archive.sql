-- V43__CRM_Scraped_Leads_Archive.sql

ALTER TABLE `crm_scraped_leads` 
MODIFY COLUMN `status` ENUM('pending', 'converted', 'rejected', 'archived') DEFAULT 'pending';
