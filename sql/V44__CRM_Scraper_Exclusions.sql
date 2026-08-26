CREATE TABLE IF NOT EXISTS crm_scraper_exclusions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    keyword VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT IGNORE INTO crm_scraper_exclusions (keyword) VALUES
    ('govt'), ('government'), ('municipal'), ('beaconhouse'),
    ('city school'), ('roots'), ('lgs'), ('lahore grammar'),
    ('aps'), ('army public'), ('educators'), ('smart school'),
    ('dar-e-arqam'), ('allied school'), ('kips'), ('divisional public'),
    ('dps'), ('lacas'), ('froebel'), ('headstart'), ('choueifat'), ('aitchison');
