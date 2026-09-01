CREATE TABLE IF NOT EXISTS fee_campaigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    fee_type VARCHAR(100) NOT NULL, -- e.g., 'Exam Fee', 'Sports Fee'
    default_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    month INT NOT NULL DEFAULT 13, -- The month to record it under
    year INT NOT NULL,
    applicable_to_all BOOLEAN NOT NULL DEFAULT TRUE,
    class_id INT NULL,
    applicable_to_class_all BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS fee_campaign_students (
    campaign_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (campaign_id, student_id),
    FOREIGN KEY (campaign_id) REFERENCES fee_campaigns(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

ALTER TABLE fee_payments ADD COLUMN campaign_id INT NULL;
ALTER TABLE fee_payments ADD CONSTRAINT fk_fee_payments_campaign FOREIGN KEY (campaign_id) REFERENCES fee_campaigns(id) ON DELETE SET NULL;
