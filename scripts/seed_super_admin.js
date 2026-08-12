require('dotenv').config();
const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');

const USERNAME = process.env.SUPER_ADMIN_USERNAME || 'superadmin';
const PASSWORD = process.env.SUPER_ADMIN_PASSWORD || 'super1234';
const EMAIL = process.env.SUPER_ADMIN_EMAIL || null;

(async () => {
    const conn = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 3306,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || 'admin',
        database: process.env.DB_NAME || 'school_db'
    });

    const [existing] = await conn.execute('SELECT id FROM master_admins WHERE username = ?', [USERNAME]);
    if (existing.length > 0) {
        console.log(`Master admin "${USERNAME}" already exists. Skipping.`);
    } else {
        const hash = await bcrypt.hash(PASSWORD, 10);
        await conn.execute(
            'INSERT INTO master_admins (username, password, email) VALUES (?, ?, ?)',
            [USERNAME, hash, EMAIL]
        );
        console.log(`Created master admin "${USERNAME}" with password "${PASSWORD}".`);
    }

    await conn.end();
})();
