require('dotenv').config();
const mysql = require('mysql2/promise');

async function main() {
    console.log('Connecting to database...');
    const conn = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 3306,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || '',
        database: process.env.DB_NAME || 'school_db'
    });

    try {
        // 1. Find the tenant with subdomain 'mis'
        const [tenants] = await conn.execute('SELECT id, name FROM tenants WHERE subdomain = ?', ['mis']);
        if (tenants.length === 0) {
            console.error('Error: Tenant with subdomain "mis" not found.');
            await conn.end();
            process.exit(1);
        }

        const tenant = tenants[0];
        console.log(`Found Tenant: ${tenant.name} (ID: ${tenant.id})`);

        // Begin transaction
        await conn.beginTransaction();
        console.log('Beginning database transaction...');

        // Delete fee payments
        const [feeResult] = await conn.execute('DELETE FROM fee_payments WHERE tenant_id = ?', [tenant.id]);
        console.log(`Deleted ${feeResult.affectedRows} fee payments.`);

        // Delete students (triggers cascaded deletes on other tables)
        const [studentResult] = await conn.execute('DELETE FROM students WHERE tenant_id = ?', [tenant.id]);
        console.log(`Deleted ${studentResult.affectedRows} students.`);

        await conn.commit();
        console.log('Transaction committed successfully! All MIS students and their fees deleted.');
    } catch (err) {
        console.error('An error occurred. Rolling back transaction...', err);
        try {
            await conn.rollback();
        } catch (rollbackErr) {
            console.error('Rollback failed:', rollbackErr);
        }
    } finally {
        await conn.end();
    }
}

main().catch(err => {
    console.error('Fatal error:', err);
    process.exit(1);
});
