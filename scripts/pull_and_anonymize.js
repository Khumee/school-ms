const mysql = require('mysql2/promise');
const fs = require('fs');

(async () => {
    const db = await mysql.createConnection({
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASSWORD || 'admin',
        database: 'sms'
    });

    const sourceTenant = 1;
    const targetTenant = 4;

    console.log(`Pulling data from sms database, tenant ${sourceTenant}...`);

    let sql = `
-- ==========================================
-- Exhaustive Demo Tenant Seeding SQL Script
-- (Generated from production data)
-- ==========================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

SET @tenant_id = ${targetTenant};

-- Clean up old demo data
DELETE FROM fee_payments WHERE tenant_id = @tenant_id;
DELETE FROM hifz_school_holidays WHERE tenant_id = @tenant_id;
DELETE FROM hifz_para_completions WHERE tenant_id = @tenant_id;
DELETE FROM hifz_waqaf_periods WHERE tenant_id = @tenant_id;
DELETE FROM hifz_diary_entries WHERE tenant_id = @tenant_id;
DELETE FROM hifz_enrollment WHERE tenant_id = @tenant_id;
DELETE FROM attendance_employees WHERE tenant_id = @tenant_id;
DELETE FROM attendance_students WHERE tenant_id = @tenant_id;
DELETE FROM students WHERE tenant_id = @tenant_id;
DELETE FROM classes WHERE tenant_id = @tenant_id;
DELETE FROM donations WHERE tenant_id = @tenant_id;
DELETE FROM donors WHERE tenant_id = @tenant_id;
DELETE FROM salaries WHERE tenant_id = @tenant_id;
DELETE FROM employees WHERE tenant_id = @tenant_id;
DELETE FROM expenses WHERE tenant_id = @tenant_id;

`;

    const escapeSql = (str) => {
        if (str === null || str === undefined) return 'NULL';
        if (typeof str !== 'string') return `'${str}'`;
        return `'${str.replace(/'/g, "''")}'`;
    };
    
    const val = (v) => {
        if (v === null || v === undefined) return 'NULL';
        if (typeof v === 'number') return v;
        if (v instanceof Date) {
            if (isNaN(v)) return 'NULL';
            return `'${v.toISOString().slice(0, 19).replace('T', ' ')}'`;
        }
        return escapeSql(v);
    };

    const rInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
    const getRandomName = (genderHint, usedNamesSet = null) => {
        const maleFirst = ['Muhammad', 'Ali', 'Omar', 'Ahmad', 'Hassan', 'Hussain', 'Zaid', 'Saad', 'Bilal', 'Tariq', 'Hamza', 'Talha', 'Zubair', 'Anas', 'Usman', 'Abu Bakr'];
        const femaleFirst = ['Fatima', 'Ayesha', 'Khadija', 'Zainab', 'Maryam', 'Amna', 'Hafsa', 'Ruqayyah', 'Sumayya', 'Sara', 'Safa', 'Marwa'];
        const lastNames = ['Khan', 'Ali', 'Ahmad', 'Mahmood', 'Iqbal', 'Qureshi', 'Shaikh', 'Farooq', 'Raza', 'Malik'];
        const isMale = genderHint === 'female' ? false : (genderHint === 'male' ? true : Math.random() > 0.5);
        
        let attempts = 0;
        while (attempts < 100) {
            const first = isMale ? maleFirst[rInt(0, maleFirst.length - 1)] : femaleFirst[rInt(0, femaleFirst.length - 1)];
            const last = lastNames[rInt(0, lastNames.length - 1)];
            const fullName = `${first} ${last}`;
            
            if (usedNamesSet) {
                if (!usedNamesSet.has(fullName)) {
                    usedNamesSet.add(fullName);
                    return fullName;
                }
            } else {
                return fullName;
            }
            attempts++;
        }
        return `Staff ${Date.now()}`;
    };

    const getRandomPhone = () => '03' + rInt(10, 49) + rInt(1000000, 9999999);

    const classMap = {};
    const empMap = {};
    const stuMap = {};
    const donorMap = {};
    const usedEmployeeNames = new Set();
    const usedStudentNames = new Set();
    const usedDonorNames = new Set();

    const generateInsert = (tableName, row, pkVarName = null, pkVarMap = null) => {
        // Exclude ID and generated/unnecessary columns
        const excluded = ['id', 'created_at', 'updated_at', 'tenant_id'];
        const columns = Object.keys(row).filter(k => !excluded.includes(k));
        
        // Prepare values
        const values = columns.map(k => {
            // Check for specific foreign key overrides based on maps
            if (k === 'class_id' && row[k] !== null && classMap[row[k]]) return classMap[row[k]];
            if (k === 'employee_id' && row[k] !== null && empMap[row[k]]) return empMap[row[k]];
            if (k === 'student_id' && row[k] !== null && stuMap[row[k]]) return stuMap[row[k]];
            if (k === 'donor_id' && row[k] !== null && donorMap[row[k]]) return donorMap[row[k]];
            
            return val(row[k]);
        });

        // Prepend tenant_id which is dynamically set via @tenant_id
        columns.unshift('tenant_id');
        values.unshift('@tenant_id');

        let statement = `INSERT INTO ${tableName} (${columns.join(', ')}) VALUES (${values.join(', ')});\n`;
        if (pkVarName && pkVarMap) {
            statement += `SET ${pkVarName} = LAST_INSERT_ID();\n`;
            pkVarMap[row.id] = pkVarName;
        }
        return statement;
    };

    console.log('Fetching classes...');
    const [classes] = await db.query('SELECT * FROM classes WHERE tenant_id = ?', [sourceTenant]);
    sql += '-- Classes\n';
    for (const c of classes) {
        sql += generateInsert('classes', c, `@class_${c.id}`, classMap);
    }

    console.log('Fetching employees...');
    const [employees] = await db.query('SELECT * FROM employees WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Employees\n';
    for (const e of employees) {
        e.name = getRandomName(e.gender, usedEmployeeNames);
        if (e.phone) e.phone = getRandomPhone();
        if (e.email) e.email = null; // anonymize email
        sql += generateInsert('employees', e, `@emp_${e.id}`, empMap);
    }

    console.log('Fetching students...');
    const [students] = await db.query('SELECT * FROM students WHERE tenant_id = ?', [sourceTenant]);
    
    const studentsWithConcession = students.filter(s => s.has_concession);
    studentsWithConcession.sort(() => 0.5 - Math.random());
    const keepConcessionIds = new Set(studentsWithConcession.slice(0, 15).map(s => s.id));

    sql += '\n-- Students\n';
    for (const s of students) {
        s.name = getRandomName(s.gender, usedStudentNames);
        if (s.father_name) s.father_name = getRandomName('male');
        if (s.father_phone) s.father_phone = getRandomPhone();
        if (s.emergency_contact) s.emergency_contact = getRandomPhone();
        
        if (s.has_concession && !keepConcessionIds.has(s.id)) {
            s.has_concession = 0;
            s.custom_monthly_fee = null;
            s.concession_notes = null;
            if ('concession_reason' in s) s.concession_reason = null;
        }

        sql += generateInsert('students', s, `@stu_${s.id}`, stuMap);
    }

    console.log('Fetching donors...');
    const [donors] = await db.query('SELECT * FROM donors WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Donors\n';
    for (const d of donors) {
        d.name = getRandomName(null, usedDonorNames);
        if (d.contact_no) d.contact_no = getRandomPhone();
        // Remove email/address if they happen to exist in schema
        if ('email' in d) d.email = null;
        if ('address' in d) d.address = null;
        sql += generateInsert('donors', d, `@donor_${d.id}`, donorMap);
    }

    console.log('Fetching salaries...');
    const [salaries] = await db.query('SELECT * FROM salaries WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Salaries\n';
    for (const s of salaries) {
        if (!empMap[s.employee_id]) continue;
        sql += generateInsert('salaries', s);
    }

    console.log('Fetching fee payments...');
    const [fees] = await db.query('SELECT * FROM fee_payments WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Fee Payments\n';
    for (const f of fees) {
        if (!stuMap[f.student_id]) continue;
        
        // Find the student to check if their concession was revoked
        const student = students.find(s => s.id === f.student_id);
        if (student && student.has_concession === 0 && !keepConcessionIds.has(student.id)) {
            // Find class default fee
            const classObj = classes.find(c => c.id === student.class_id);
            if (classObj && classObj.default_monthly_fee) {
                // If they originally had a concession that we removed, 
                // we should scale up their amount_paid to the full default_monthly_fee 
                // to avoid massive artificial arrears.
                f.amount_paid = classObj.default_monthly_fee;
            }
        }
        
        sql += generateInsert('fee_payments', f);
    }

    console.log('Fetching expenses...');
    const [expenses] = await db.query('SELECT * FROM expenses WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Expenses\n';
    for (const e of expenses) {
        sql += generateInsert('expenses', e);
    }

    console.log('Fetching donations...');
    const [donations] = await db.query('SELECT * FROM donations WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Donations\n';
    for (const d of donations) {
        if (!donorMap[d.donor_id]) continue;
        sql += generateInsert('donations', d);
    }

    console.log('Fetching attendance_employees...');
    const [attEmp] = await db.query('SELECT * FROM attendance_employees WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Attendance Employees\n';
    for (const a of attEmp) {
        if (!empMap[a.employee_id]) continue;
        sql += generateInsert('attendance_employees', a);
    }

    console.log('Fetching attendance_students...');
    const [attStu] = await db.query('SELECT * FROM attendance_students WHERE tenant_id = ?', [sourceTenant]);
    sql += '\n-- Attendance Students\n';
    for (const a of attStu) {
        if (!stuMap[a.student_id]) continue;
        sql += generateInsert('attendance_students', a);
    }

    console.log('Fetching Hifz records...');
    const [hifzEnrollments] = await db.query('SELECT * FROM hifz_enrollment WHERE tenant_id = ?', [sourceTenant]);
    
    if (hifzEnrollments.length === 0) {
        console.log('No Hifz records found in source tenant. Synthesizing Hifz data for 15 random students...');
        sql += '\n-- Synthesized Hifz Records (Source tenant had none)\n';
        
        const hifzStudents = students.slice(0, 15);
        for (let i = 0; i < hifzStudents.length; i++) {
            const stu = hifzStudents[i];
            const stuVar = stuMap[stu.id];
            
            let current_para = rInt(1, 30);
            let pace = (i < 5) ? 'fast' : (i < 12 ? 'average' : 'slow');
            let streak = pace === 'fast' ? rInt(10, 30) : (pace === 'average' ? rInt(3, 10) : rInt(0, 2));
            let phase = current_para < 5 ? 'early' : (current_para < 15 ? 'mid' : 'advanced');
            let avgLines = pace === 'fast' ? 14.5 : (pace === 'average' ? 7.5 : 3.5);
            let linesMemo = (current_para - 1) * 300 + rInt(0, 250);

            sql += `INSERT INTO hifz_enrollment (tenant_id, student_id, class_id, current_phase, current_para, total_lines_memorized, avg_lines_30d, current_streak_days, status, enrolled_date) VALUES (@tenant_id, ${stuVar}, ${classMap[stu.class_id] || 'NULL'}, '${phase}', ${current_para}, ${linesMemo}, ${avgLines}, ${streak}, 'active', '2024-03-01');\n`;

            const today = new Date();
            for (let dIndex = 30; dIndex >= 0; dIndex--) {
                const entryDate = new Date();
                entryDate.setDate(today.getDate() - dIndex);
                if (entryDate.getDay() === 0) continue;
                
                const dateString = entryDate.toISOString().split('T')[0];
                let is_absent = 0;
                let sabaq_status = 'recited';
                if (pace === 'slow' && Math.random() < 0.2) { is_absent = 1; sabaq_status = 'not_recited'; }
                else if (pace === 'average' && Math.random() < 0.05) { sabaq_status = 'leave'; }
                else if (Math.random() < 0.05) { is_absent = 1; }

                let valCurrentPara = is_absent ? 'NULL' : current_para;
                let sabqi_status = sabaq_status;
                let manzil_status = sabaq_status;
                let tajweed = pace === 'slow' ? 'poor' : 'perfect';

                sql += `INSERT INTO hifz_diary_entries (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabaq_lines, sabaq_tajweed, sabaq_quality, sabqi_status, sabqi_para, sabqi_para_2, manzil_status, manzil_para_1, manzil_para_2, manzil_para_3) VALUES (@tenant_id, ${stuVar}, '${dateString}', ${is_absent}, '${sabaq_status}', ${valCurrentPara}, ${valCurrentPara}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 2}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 15}, ${is_absent ? 'NULL' : 15}, '${tajweed}', 'good', '${sabqi_status}', ${is_absent ? 'NULL' : Math.max(1, current_para - 1)}, NULL, '${manzil_status}', ${is_absent ? 'NULL' : Math.max(1, current_para - 2)}, NULL, NULL);\n`;
            }

            if (current_para > 1) {
                for (let pNo = 1; pNo < current_para; pNo++) {
                    sql += `INSERT INTO hifz_para_completions (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self) VALUES (@tenant_id, ${stuVar}, ${pNo}, '2025-01-01', '2025-01-05', 'pass', 'Qari sb', 0);\n`;
                }
            }
        }
    } else {
        sql += '\n-- Hifz Enrollments\n';
        for (const h of hifzEnrollments) {
            if (!stuMap[h.student_id]) continue;
            sql += generateInsert('hifz_enrollment', h);
        }

        const [hifzDiary] = await db.query('SELECT * FROM hifz_diary_entries WHERE tenant_id = ?', [sourceTenant]);
        sql += '\n-- Hifz Diary Entries\n';
        for (const h of hifzDiary) {
            if (!stuMap[h.student_id]) continue;
            sql += generateInsert('hifz_diary_entries', h);
        }

        const [hifzPara] = await db.query('SELECT * FROM hifz_para_completions WHERE tenant_id = ?', [sourceTenant]);
        sql += '\n-- Hifz Para Completions\n';
        for (const h of hifzPara) {
            if (!stuMap[h.student_id]) continue;
            sql += generateInsert('hifz_para_completions', h);
        }

        const [hifzWaqaf] = await db.query('SELECT * FROM hifz_waqaf_periods WHERE tenant_id = ?', [sourceTenant]);
        sql += '\n-- Hifz Waqaf Periods\n';
        for (const h of hifzWaqaf) {
            if (!stuMap[h.student_id]) continue;
            sql += generateInsert('hifz_waqaf_periods', h);
        }

        const [hifzHolidays] = await db.query('SELECT * FROM hifz_school_holidays WHERE tenant_id = ?', [sourceTenant]);
        sql += '\n-- Hifz School Holidays\n';
        for (const h of hifzHolidays) {
            sql += generateInsert('hifz_school_holidays', h);
        }
    }

    sql += '\nSET FOREIGN_KEY_CHECKS = 1;\n';

    fs.writeFileSync('seed_demo_tenant_generated.sql', sql);
    console.log('Successfully generated anonymized SQL from sms database into seed_demo_tenant_generated.sql');
    await db.end();
})();
