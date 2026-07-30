const db = require('../db');

async function run() {
    try {
        console.log('Adding donor_references table...');
        await db.query(`
            CREATE TABLE IF NOT EXISTS \`donor_references\` (
                \`id\` INT AUTO_INCREMENT PRIMARY KEY,
                \`tenant_id\` INT NOT NULL,
                \`name\` VARCHAR(100) NOT NULL,
                \`created_at\` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                UNIQUE KEY \`unique_ref_name_per_tenant\` (\`tenant_id\`, \`name\`),
                CONSTRAINT \`fk_donor_ref_tenant\` FOREIGN KEY (\`tenant_id\`) REFERENCES \`tenants\` (\`id\`) ON DELETE CASCADE
            ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
        `);
        console.log('Table created successfully.');
        
        // Seed 'mis' tenant
        const [tenants] = await db.query('SELECT id FROM tenants WHERE subdomain = "mis"');
        if (tenants.length > 0) {
            const tenantId = tenants[0].id;
            const names = ['Faheem Zafar', 'Kamal Muhammad', 'Khurram Shahzad'];
            for (const name of names) {
                await db.query('INSERT IGNORE INTO donor_references (tenant_id, name) VALUES (?, ?)', [tenantId, name]);
            }
            console.log('Seeded "mis" tenant with default references.');
        } else {
            console.log('Tenant "mis" not found. Skipping seeding.');
        }
        
    } catch (err) {
        console.error('Error:', err);
    } finally {
        process.exit();
    }
}

run();
