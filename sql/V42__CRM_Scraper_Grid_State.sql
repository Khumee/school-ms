CREATE TABLE IF NOT EXISTS crm_scraper_grid_state (
    city VARCHAR(100) PRIMARY KEY,
    center_lat DECIMAL(10, 8) NOT NULL,
    center_lng DECIMAL(11, 8) NOT NULL,
    spiral_index INT DEFAULT 0,
    max_radius INT DEFAULT 20000,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
