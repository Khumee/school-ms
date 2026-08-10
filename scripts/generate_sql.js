const fs = require('fs');
const bcrypt = require('bcryptjs');

(async () => {
    let sql = `
-- ==========================================
-- Exhaustive Demo Tenant Seeding SQL Script
-- ==========================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Use Demo Tenant ID 4
SET @tenant_id = 4;

-- 2. Clean up old demo data (just in case)
DELETE FROM fee_payments WHERE tenant_id = @tenant_id;
DELETE FROM hifz_school_holidays WHERE tenant_id = @tenant_id;
DELETE FROM hifz_para_completions WHERE tenant_id = @tenant_id;
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
DELETE FROM users WHERE tenant_id = @tenant_id AND username = 'admin';
DELETE FROM sessions WHERE tenant_id = @tenant_id;

-- 3. Create default session
INSERT INTO sessions (name, is_active, tenant_id) VALUES ('2026', 1, @tenant_id);
`;

    // Admin User
    const bcryptHash = await bcrypt.hash('1234', 10);
    sql += `\n-- 4. Create Admin User (Password: 1234)\n`;
    sql += `INSERT INTO users (username, password, role, tenant_id) VALUES ('admin', '${bcryptHash}', 'admin', @tenant_id);\n`;

    // Helpers
    const escapeSql = str => str.replace(/'/g, "''");
    const rInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
    const getRandomName = (isMale) => {
        const maleFirst = ['Muhammad', 'Ali', 'Omar', 'Ahmad', 'Hassan', 'Hussain', 'Zaid', 'Saad', 'Bilal', 'Tariq', 'Hamza', 'Talha', 'Zubair', 'Anas', 'Usman', 'Abu Bakr'];
        const femaleFirst = ['Fatima', 'Ayesha', 'Khadija', 'Zainab', 'Maryam', 'Amna', 'Hafsa', 'Ruqayyah', 'Sumayya', 'Sara', 'Safa', 'Marwa'];
        const lastNames = ['Khan', 'Ali', 'Ahmad', 'Mahmood', 'Iqbal', 'Qureshi', 'Shaikh', 'Farooq', 'Raza', 'Malik'];
        const first = isMale ? maleFirst[rInt(0, maleFirst.length - 1)] : femaleFirst[rInt(0, femaleFirst.length - 1)];
        const last = lastNames[rInt(0, lastNames.length - 1)];
        return `${first} ${last}`;
    };

    // 5. Classes (Nursery, Prep, 1-10, Hifz)
    sql += `\n-- 5. Create Classes\n`;
    const classNames = [
        { name: 'Nursery', fee: 1500 }, { name: 'Prep', fee: 1500 },
        { name: 'Class One', fee: 2000 }, { name: 'Class Two', fee: 2000 },
        { name: 'Class Three', fee: 2200 }, { name: 'Class Four', fee: 2200 },
        { name: 'Class Five', fee: 2500 }, { name: 'Class Six', fee: 2500 },
        { name: 'Class Seven', fee: 3000 }, { name: 'Class Eight', fee: 3000 },
        { name: 'Class Nine', fee: 3500 }, { name: 'Class Ten', fee: 3500 },
        { name: 'Hifz Class', fee: 3000 }
    ];
    
    classNames.forEach((c, i) => {
        const isHifz = c.name === 'Hifz Class' ? 1 : 0;
        sql += `INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES ('${c.name}', ${c.fee}, @tenant_id, ${isHifz});\n`;
        sql += `SET @class_${i} = LAST_INSERT_ID();\n`;
    });

    // 6. Employees (15 Teachers)
    sql += `\n-- 6. Create 15 Employees (Teachers & Staff)\n`;
    const employees = [];
    for (let i = 0; i < 15; i++) {
        const isMale = Math.random() > 0.5;
        const name = getRandomName(isMale);
        let designation = 'Teacher';
        let salary = rInt(20000, 35000);
        if (i === 0) { designation = 'Principal'; salary = 60000; }
        else if (i === 1) { designation = 'Accountant'; salary = 40000; }
        else if (i === 2 || i === 3) { designation = 'Qari'; salary = 35000; }
        employees.push({ name, designation, salary, isMale });
        
        sql += `INSERT INTO employees (tenant_id, name, designation, role, status, date_of_joining, default_salary, gender) VALUES (@tenant_id, '${escapeSql(name)}', '${designation}', 'teacher', 'on_payroll', '2022-04-01', ${salary}, '${isMale ? 'male' : 'female'}');\n`;
        sql += `SET @emp_${i} = LAST_INSERT_ID();\n`;
    }

    // 7. Regular Students (10 per non-Hifz class)
    sql += `\n-- 7. Create Students\n`;
    let globalReg = 1000;
    const studentsData = []; // Store for fee/attendance generation

    for (let i = 0; i < 12; i++) { // First 12 are non-Hifz
        for (let s = 0; s < 10; s++) {
            const name = getRandomName(Math.random() > 0.5);
            globalReg++;
            const hasConcession = Math.random() > 0.8 ? 1 : 0;
            const fee = hasConcession ? (classNames[i].fee - 500) : 'NULL';
            const notes = hasConcession ? "'Sibling Discount'" : 'NULL';
            
            sql += `INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission) VALUES ('REG-${globalReg}', '${escapeSql(name)}', @class_${i}, ${fee}, ${hasConcession}, ${notes}, 'active', @tenant_id, '2025-01-15');\n`;
            sql += `SET @student_reg_${globalReg} = LAST_INSERT_ID();\n`;
            
            studentsData.push({ reg: globalReg, baseFee: classNames[i].fee, actualFee: fee !== 'NULL' ? fee : classNames[i].fee });
        }
    }

    // 8. Hifz Students (15 students)
    sql += `\n-- 8. Create Hifz Students (15)\n`;
    for (let s = 0; s < 15; s++) {
        const name = getRandomName(Math.random() > 0.1); // mostly male
        globalReg++;
        const hasConcession = Math.random() > 0.7 ? 1 : 0;
        const fee = hasConcession ? (classNames[12].fee - 1000) : 'NULL';
        const notes = hasConcession ? "'Hifz Scholarship'" : 'NULL';
        
        sql += `INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission) VALUES ('REG-${globalReg}', '${escapeSql(name)}', @class_12, ${fee}, ${hasConcession}, ${notes}, 'active', @tenant_id, '2025-01-15');\n`;
        sql += `SET @student_reg_${globalReg} = LAST_INSERT_ID();\n`;
        
        studentsData.push({ reg: globalReg, baseFee: classNames[12].fee, actualFee: fee !== 'NULL' ? fee : classNames[12].fee });

        // Generate varied Hifz profiles
        let current_para = rInt(1, 30);
        let pace = (s < 5) ? 'fast' : (s < 12 ? 'average' : 'slow');
        let streak = pace === 'fast' ? rInt(10, 30) : (pace === 'average' ? rInt(3, 10) : rInt(0, 2));
        let phase = current_para < 5 ? 'early' : (current_para < 15 ? 'mid' : 'advanced');
        let avgLines = pace === 'fast' ? 14.5 : (pace === 'average' ? 7.5 : 3.5);
        let linesMemo = (current_para - 1) * 300 + rInt(0, 250);

        sql += `INSERT INTO hifz_enrollment (tenant_id, student_id, class_id, current_phase, current_para, total_lines_memorized, avg_lines_30d, current_streak_days, status, enrolled_date) VALUES (@tenant_id, @student_reg_${globalReg}, @class_12, '${phase}', ${current_para}, ${linesMemo}, ${avgLines}, ${streak}, 'active', '2024-03-01');\n`;

        // 30 days of diary entries
        const today = new Date();
        for (let dIndex = 30; dIndex >= 0; dIndex--) {
            const entryDate = new Date();
            entryDate.setDate(today.getDate() - dIndex);
            if (entryDate.getDay() === 0) continue; // Skip Sundays
            
            const dateString = entryDate.toISOString().split('T')[0];
            let is_absent = 0;
            let sabaq_status = 'recited';
            if (pace === 'slow' && Math.random() < 0.2) { is_absent = 1; sabaq_status = 'not_recited'; }
            else if (pace === 'average' && Math.random() < 0.05) { sabaq_status = 'leave'; }
            else if (Math.random() < 0.05) { is_absent = 1; }

            let valCurrentPara = is_absent ? 'NULL' : current_para;
            let sabqi_status = sabaq_status;
            let manzil_status = sabaq_status;

            sql += `INSERT INTO hifz_diary_entries (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabqi_status, sabqi_para, sabqi_para_2, manzil_status, manzil_para_1, manzil_para_2, manzil_para_3) VALUES (@tenant_id, @student_reg_${globalReg}, '${dateString}', ${is_absent}, '${sabaq_status}', ${valCurrentPara}, ${valCurrentPara}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 2}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 15}, '${sabqi_status}', ${is_absent ? 'NULL' : Math.max(1, current_para - 1)}, NULL, '${manzil_status}', ${is_absent ? 'NULL' : Math.max(1, current_para - 2)}, NULL, NULL);\n`;
        }

        // Completions
        if (current_para > 1) {
            for (let pNo = 1; pNo < current_para; pNo++) {
                sql += `INSERT INTO hifz_para_completions (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self) VALUES (@tenant_id, @student_reg_${globalReg}, ${pNo}, '2025-01-01', '2025-01-05', 'pass', 'Qari sb', 0);\n`;
            }
        }
    }

    // 9. Fee Payments (6 months)
    sql += `\n-- 9. Seed Fee Payments (January to June)\n`;
    for (let m = 1; m <= 6; m++) {
        const dateStr = `2026-0${m}-05`;
        studentsData.forEach((s) => {
            // 95% payment rate
            if (Math.random() > 0.05) {
                sql += `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_reg_${s.reg}, ${m}, 2026, ${s.actualFee}, '${dateStr}');\n`;
            }
        });
    }

    // 10. Salaries (6 months)
    sql += `\n-- 10. Seed Salaries Paid\n`;
    for (let m = 1; m <= 6; m++) {
        const dateStr = `2026-0${m}-01`;
        for (let i = 0; i < 15; i++) {
            sql += `INSERT INTO salaries (tenant_id, employee_id, month, year, basic_salary, bonus, paid_date) VALUES (@tenant_id, @emp_${i}, ${m}, 2026, ${employees[i].salary}, 0, '${dateStr}');\n`;
        }
    }

    // 11. Overheads/Expenses
    sql += `\n-- 11. Seed Expenses (Rent, Utilities, Internet, Misc)\n`;
    const expenses = [
        { item: 'Building Rent', amt: 65000, cat: 'rent' },
        { item: 'Electricity Bill', amt: 25000, cat: 'utility' },
        { item: 'Internet', amt: 4000, cat: 'utility' },
        { item: 'Water & Gas', amt: 5000, cat: 'utility' },
        { item: 'Stationery & Printing', amt: 8500, cat: 'maintenance' },
        { item: 'Cleaning Supplies', amt: 3000, cat: 'maintenance' }
    ];
    for (let m = 1; m <= 6; m++) {
        expenses.forEach(exp => {
            const dStr = `2026-0${m}-${rInt(10, 25)}`;
            const fluctuated = exp.amt + rInt(-500, 1500); // add some variance
            sql += `INSERT INTO expenses (tenant_id, date, item, amount, category, description) VALUES (@tenant_id, '${dStr}', '${exp.item}', ${fluctuated}, '${exp.cat}', 'Monthly overhead');\n`;
        });
    }

    // 12. Donors & Donations
    sql += `\n-- 12. Donors and Donations\n`;
    const donors = [
        { name: 'Dr. Tariq', c: '03001111111' }, { name: 'Ali Trust', c: '03002222222' },
        { name: 'Haji Aslam', c: '03003333333' }, { name: 'Anonymous', c: '0000000' },
        { name: 'Software Co', c: '03005555555' }
    ];
    donors.forEach((d, i) => {
        sql += `INSERT INTO donors (tenant_id, name, contact_no) VALUES (@tenant_id, '${d.name}', '${d.c}');\n`;
        sql += `SET @donor_${i} = LAST_INSERT_ID();\n`;
    });

    for (let m = 1; m <= 6; m++) {
        for (let i = 0; i < donors.length; i++) {
            if (Math.random() > 0.2) { // 80% chance to donate each month
                const amt = rInt(5, 50) * 1000;
                const cat = Math.random() > 0.5 ? 'zakat' : 'general';
                const dStr = `2026-0${m}-${rInt(1, 28)}`;
                sql += `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes) VALUES (@tenant_id, @donor_${i}, ${amt}, '${dStr}', '${cat}', 'Cash', 'Monthly contribution');\n`;
            }
        }
    }

    sql += `\nSET FOREIGN_KEY_CHECKS = 1;\n`;

    fs.writeFileSync('seed_demo_tenant_generated.sql', sql);
    console.log('Exhaustive SQL generated successfully. Saved to seed_demo_tenant_generated.sql');
})();
