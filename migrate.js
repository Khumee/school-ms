require('dotenv').config();
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');

async function migrate() {
    console.log('Starting migrations...');

    // 1. Connect without database to ensure it exists
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 3306,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD
    });
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${process.env.DB_NAME || 'school_db'}\``);
    await connection.end();

    const db = require('./db');
    
    // Create schema history table
    await db.execute(`
        CREATE TABLE IF NOT EXISTS schema_history (
            version INT PRIMARY KEY,
            script_name VARCHAR(255),
            applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    `);

    const sqlDir = path.join(__dirname, 'sql');
    const files = fs.readdirSync(sqlDir).filter(f => f.endsWith('.sql')).sort();

    for (const file of files) {
        const versionMatch = file.match(/^V(\d+)__/);
        if (!versionMatch) continue;
        
        const version = parseInt(versionMatch[1]);
        
        // Check if migration already applied
        const [rows] = await db.execute('SELECT * FROM schema_history WHERE version = ?', [version]);
        if (rows.length === 0) {
            console.log(`Applying migration: ${file}`);
            const sql = fs.readFileSync(path.join(sqlDir, file), 'utf8');
            
            // Clean up and split by semicolon (a very simple sql splitter)
            // Remove comments and lines that are empty
            const statements = sql
                .split(';')
                .map(s => s.trim())
                .filter(s => s !== '' && !s.startsWith('--'));
            
            for (let statement of statements) {
                if (!statement) continue;
                console.log(`Executing statement: ${statement.substring(0, 50)}...`);
                try {
                    await db.query(statement);
                } catch (statementErr) {
                    const isIgnorable = 
                        statementErr.code === 'ER_DUP_FIELDNAME' || 
                        statementErr.code === 'ER_DUP_KEYNAME' || 
                        statementErr.code === 'ER_CANT_DROP_FIELD_OR_KEY' ||
                        statementErr.message.includes('Duplicate column') ||
                        statementErr.message.includes('Duplicate key') ||
                        statementErr.message.includes('already exists');
                    
                    if (isIgnorable) {
                        console.log(`[Warning] Ignored statement: ${statementErr.message}`);
                    } else {
                        throw statementErr;
                    }
                }
            }
            
            await db.execute('INSERT INTO schema_history (version, script_name) VALUES (?, ?)', [version, file]);
            console.log(`Successfully applied: ${file}`);
        } else {
            console.log(`Skipping already applied: ${file}`);
        }
    }
    
    console.log('Migrations completed.');
    if (require.main === module) {
        process.exit(0);
    }
}

if (require.main === module) {
    migrate().catch(err => {
        console.error('Migration failed:', err);
        process.exit(1);
    });
} else {
    module.exports = migrate;
}
