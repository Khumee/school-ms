require('dotenv').config();
const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');

const TENANT_SUBDOMAIN = 'school-ms';
const SESSION_YEAR = '2026';

(async () => {
    console.log('Connecting to database...');
    const conn = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        port: process.env.DB_PORT || 3306,
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || 'admin',
        database: process.env.DB_NAME || 'school_db'
    });

    try {
        // 1. Create or Reset Demo Tenant
        console.log(`Setting up Tenant: ${TENANT_SUBDOMAIN}...`);
        const [tenantRows] = await conn.execute('SELECT id FROM tenants WHERE subdomain = ?', [TENANT_SUBDOMAIN]);
        let tenantId;
        if (tenantRows.length > 0) {
            tenantId = tenantRows[0].id;
            console.log(`Tenant "${TENANT_SUBDOMAIN}" already exists (ID: ${tenantId}). Cleaning up old demo data...`);
            // Clean up to make seeding idempotent and clean
            await conn.execute('DELETE FROM fee_payments WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM students WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM classes WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM donations WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM donors WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM salaries WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM employees WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM expenses WHERE tenant_id = ?', [tenantId]);
            await conn.execute('DELETE FROM users WHERE tenant_id = ?', [tenantId]);
        } else {
            const [result] = await conn.execute(
                `INSERT INTO tenants (name, subdomain, school_name, status, plan_tier, enable_donations_module, primary_color, secondary_color) 
                 VALUES (?, ?, ?, ?, ?, 1, ?, ?)` ,
                ['Demo Academy', TENANT_SUBDOMAIN, 'Demo Islamic Academy Rawalpindi', 'active', 'pro', '#0f766e', '#0d9488']
            );
            tenantId = result.insertId;
        }

        // 2. Create default session
        const [sessionRows] = await conn.execute('SELECT id FROM sessions WHERE name = ? AND tenant_id = ?', [SESSION_YEAR, tenantId]);
        if (sessionRows.length === 0) {
            await conn.execute('INSERT INTO sessions (name, is_active, tenant_id) VALUES (?, 1, ?)', [SESSION_YEAR, tenantId]);
        }

        // 3. Create Admin User (1234)
        console.log('Seeding user account...');
        const bcryptHash = await bcrypt.hash('1234', 10);
        await conn.execute(
            'INSERT INTO users (username, password, role, tenant_id) VALUES (?, ?, ?, ?)',
            ['admin', bcryptHash, 'admin', tenantId]
        );

        // 4. Create Classes
        console.log('Seeding classes...');
        const classNames = [
            { name: 'Nursery', fee: 1500.00 },
            { name: 'Class One', fee: 2000.00 },
            { name: 'Class Two', fee: 2000.00 },
            { name: 'Hifz Class', fee: 2500.00 }
        ];
        const classMap = {};
        for (const c of classNames) {
            const [res] = await conn.execute(
                'INSERT INTO classes (name, default_monthly_fee, tenant_id) VALUES (?, ?, ?)',
                [c.name, c.fee, tenantId]
            );
            classMap[c.name] = res.insertId;
        }

        // 5. Create Employees (Qari, Teachers)
        console.log('Seeding employees & salaries...');
        const employees = [
            { name: 'Qari Muhammad Ahmad', designation: 'Qari (Male Quran Teacher)', salary: 28000.00 },
            { name: 'Ayesha Bibi', designation: 'Primary School Teacher', salary: 22000.00 },
            { name: 'Zainab Fatima', designation: 'Montessori Teacher', salary: 24000.00 }
        ];
        const employeeIds = [];
        for (const emp of employees) {
            const [res] = await conn.execute(
                `INSERT INTO employees (tenant_id, name, designation, role, status, date_of_joining, default_salary, gender)
                 VALUES (?, ?, ?, 'teacher', 'on_payroll', '2024-03-01', ?, ?)`,
                [tenantId, emp.name, emp.designation, emp.salary, emp.name.includes('Muhammad') ? 'male' : 'female']
            );
            employeeIds.push({ id: res.insertId, salary: emp.salary });
        }

        console.log('Seeding students & concessions...');
        const students = [
            { name: 'Muhammad Ali', class: 'Class One', reg: 'REG-101', fee: null, concession: 0, notes: null },
            { name: 'Fatima Zahra', class: 'Class Two', reg: 'REG-102', fee: 1200.00, concession: 1, notes: 'Orphan Concession' }
        ];

        const studentMap = {};
        for (const s of students) {
            const classId = classMap[s.class];
            const [res] = await conn.execute(
                `INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission) 
                 VALUES (?, ?, ?, ?, ?, ?, 'active', ?, '2025-01-15')`,
                [s.reg, s.name, classId, s.fee, s.concession, s.notes, tenantId]
            );
            studentMap[s.name] = res.insertId;
        }

        // 7. Seed Fee Payments (January to June)
        console.log('Seeding fee payments...');
        const months = [1, 2, 3, 4, 5, 6];
        for (const m of months) {
            for (const s of students) {
                const sId = studentMap[s.name];
                let payAmt = s.fee;
                if (payAmt === null) {
                    payAmt = s.class === 'Class One' ? 2000.00 : 2500.00;
                }
                // Skip June payments randomly to simulate unpaid slots
                if (m === 6 && (s.name === 'Muhammad Ali' || s.name === 'Anas Malik')) continue;

                await conn.execute(
                    `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date)
                     VALUES (?, ?, ?, 2026, ?, ?)`,
                    [tenantId, sId, m, payAmt, `2026-0${m}-10`]
                );
            }
        }

        // 8. Seed Donors & Donations
        console.log('Seeding donations...');
        const donors = [
            { name: 'Dr. Tariq Mahmood', contact: '03001234567' },
            { name: 'Sofia Foundations', contact: '03217654321' }
        ];
        const donorIds = [];
        for (const d of donors) {
            const [res] = await conn.execute(
                'INSERT INTO donors (tenant_id, name, contact_no) VALUES (?, ?, ?)',
                [tenantId, d.name, d.contact]
            );
            donorIds.push(res.insertId);
        }

        // Add monthly donations
        for (const m of months) {
            await conn.execute(
                `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes)
                 VALUES (?, ?, ?, ?, 'trust', 'Online', 'Monthly support sponsorship')`,
                [tenantId, donorIds[0], 15000.00, `2026-0` + m + `-05`]
            );
            await conn.execute(
                `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes)
                 VALUES (?, ?, ?, ?, 'general', 'Cash', 'General welfare fund donation')`,
                [tenantId, donorIds[1], 25000.00, `2026-0` + m + `-12`]
            );
        }

        // 9. Seed Payroll Salaries Paid (January to June)
        console.log('Seeding payroll payouts...');
        for (const m of months) {
            for (const emp of employeeIds) {
                await conn.execute(
                    `INSERT INTO salaries (tenant_id, employee_id, month, year, basic_salary, bonus, paid_date)
                     VALUES (?, ?, ?, 2026, ?, 0, ?)`,
                    [tenantId, emp.id, m, emp.salary, `2026-0` + m + `-01`]
                );
            }
        }

        // 10. Seed Expenses (Rent & Utilities from January to June)
        console.log('Seeding operational overheads...');
        for (const m of months) {
            await conn.execute(
                `INSERT INTO expenses (tenant_id, date, item, amount, category, description)
                 VALUES (?, ?, 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment')`,
                [tenantId, `2026-0` + m + `-02`]
            );
            await conn.execute(
                `INSERT INTO expenses (tenant_id, date, item, amount, category, description)
                 VALUES (?, ?, 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill')`,
                [tenantId, `2026-0` + m + `-15`]
            );
        }

        console.log('================================================================');
        console.log(`✅ Demo Tenant Seeding Complete!`);
        console.log(`Subdomain: ${TENANT_SUBDOMAIN}`);
        console.log(`Login Username: admin`);
        console.log(`Login Password: 1234`);
        console.log(`Local Access URL: http://${TENANT_SUBDOMAIN}.localhost:3000`);
        console.log('================================================================');

    } catch (e) {
        console.error('Seeding encountered an error:', e);
    } finally {
        await conn.end();
    }
})();
