ALTER TABLE tenants ADD COLUMN fine_start_days INT DEFAULT 10;
ALTER TABLE tenants ADD COLUMN fine_amount_per_day DECIMAL(10, 2) DEFAULT 20.00;
