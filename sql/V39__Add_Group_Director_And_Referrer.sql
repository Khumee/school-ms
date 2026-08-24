-- V39__Add_Group_Director_And_Referrer.sql

ALTER TABLE `crm_leads` 
ADD COLUMN `group_director` VARCHAR(255) NULL,
ADD COLUMN `referred_by_contact` VARCHAR(255) NULL;
