CREATE TABLE IF NOT EXISTS crm_scraper_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requests_made INT NOT NULL,
    month_year VARCHAR(7) NOT NULL, -- Format: YYYY-MM
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
