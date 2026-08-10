const fs = require('fs');
const bcrypt = require('bcryptjs');

(async () => {
    let sql = `
-- ==========================================
-- Demo Tenant Seeding SQL Script
-- ==========================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Use Demo Tenant ID 4
SET @tenant_id = 4;


-- 2. Clean up old demo data (just in case they were left behind by a previous tenant with same ID)
DELETE FROM fee_payments WHERE tenant_id = @tenant_id;
DELETE FROM hifz_school_holidays WHERE tenant_id = @tenant_id;
DELETE FROM hifz_para_completions WHERE tenant_id = @tenant_id;
DELETE FROM hifz_diary_entries WHERE tenant_id = @tenant_id;
DELETE FROM hifz_enrollment WHERE tenant_id = @tenant_id;
DELETE FROM students WHERE tenant_id = @tenant_id;
DELETE FROM classes WHERE tenant_id = @tenant_id;
DELETE FROM donations WHERE tenant_id = @tenant_id;
DELETE FROM donors WHERE tenant_id = @tenant_id;
DELETE FROM salaries WHERE tenant_id = @tenant_id;
DELETE FROM employees WHERE tenant_id = @tenant_id;
DELETE FROM expenses WHERE tenant_id = @tenant_id;
DELETE FROM users WHERE tenant_id = @tenant_id;
DELETE FROM sessions WHERE tenant_id = @tenant_id;

-- 3. Create default session
INSERT INTO sessions (name, is_active, tenant_id) VALUES ('2026', 1, @tenant_id);
`;

    // Admin User
    const bcryptHash = await bcrypt.hash('1234', 10);
    sql += `
-- 4. Create Admin User (Password: 1234)
INSERT INTO users (username, password, role, tenant_id) VALUES ('admin', '${bcryptHash}', 'admin', @tenant_id);
`;

    // Classes
    sql += `
-- 5. Create Classes
INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES ('Nursery', 1500.00, @tenant_id, 0);
SET @class_nursery = LAST_INSERT_ID();
INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES ('Class One', 2000.00, @tenant_id, 0);
SET @class_one = LAST_INSERT_ID();
INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES ('Class Two', 2000.00, @tenant_id, 0);
SET @class_two = LAST_INSERT_ID();
INSERT INTO classes (name, default_monthly_fee, tenant_id, is_hifz_class) VALUES ('Hifz Class', 2500.00, @tenant_id, 1);
SET @class_hifz = LAST_INSERT_ID();
`;

    // Employees
    const employees = [
        { name: 'Qari Muhammad Ahmad', designation: 'Qari (Male Quran Teacher)', salary: 28000.00 },
        { name: 'Ayesha Bibi', designation: 'Primary School Teacher', salary: 22000.00 },
        { name: 'Zainab Fatima', designation: 'Montessori Teacher', salary: 24000.00 }
    ];
    sql += `\n-- 6. Create Employees & Salaries\n`;
    employees.forEach((emp, i) => {
        const gender = emp.name.includes('Muhammad') ? 'male' : 'female';
        sql += `INSERT INTO employees (tenant_id, name, designation, role, status, date_of_joining, default_salary, gender) VALUES (@tenant_id, '${emp.name}', '${emp.designation}', 'teacher', 'on_payroll', '2024-03-01', ${emp.salary}, '${gender}');\n`;
        sql += `SET @emp_${i} = LAST_INSERT_ID();\n`;
    });

    // Students
    sql += `\n-- 7. Create Students & Hifz Details\n`;
    const students = [
        { name: 'Muhammad Ali', classVar: '@class_one', reg: 'REG-101', fee: 'NULL', concession: 0, notes: 'NULL', hifz: false },
        { name: 'Fatima Zahra', classVar: '@class_two', reg: 'REG-102', fee: 1200.00, concession: 1, notes: "'Orphan Concession'", hifz: false },
        { name: 'Hamza Yusuf', classVar: '@class_hifz', reg: 'REG-103', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'mid', current_para: 12, lines: 180, streak: 15, pace: 'fast' },
        { name: 'Omar Farooq', classVar: '@class_hifz', reg: 'REG-104', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'advanced', current_para: 22, lines: 330, streak: 20, pace: 'fast' },
        { name: 'Zubair Ibn Awwam', classVar: '@class_hifz', reg: 'REG-105', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'early', current_para: 4, lines: 60, streak: 8, pace: 'average' },
        { name: 'Talha Ubaidullah', classVar: '@class_hifz', reg: 'REG-106', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'early', current_para: 6, lines: 90, streak: 5, pace: 'average' },
        { name: 'Saad Abi Waqas', classVar: '@class_hifz', reg: 'REG-107', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'mid', current_para: 8, lines: 120, streak: 12, pace: 'average' },
        { name: 'Abdur Rahman Awf', classVar: '@class_hifz', reg: 'REG-108', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'mid', current_para: 9, lines: 135, streak: 9, pace: 'average' },
        { name: 'Saeed Zaid', classVar: '@class_hifz', reg: 'REG-109', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'early', current_para: 3, lines: 45, streak: 7, pace: 'average' },
        { name: 'Abu Ubaidah Jarrah', classVar: '@class_hifz', reg: 'REG-110', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'early', current_para: 5, lines: 75, streak: 4, pace: 'average' },
        { name: 'Bilal Khan', classVar: '@class_hifz', reg: 'REG-111', fee: 1000.00, concession: 1, notes: "'Sibling Discount'", hifz: true, phase: 'early', current_para: 1, lines: 10, streak: 0, pace: 'slow' },
        { name: 'Anas Malik', classVar: '@class_hifz', reg: 'REG-112', fee: 'NULL', concession: 0, notes: 'NULL', hifz: true, phase: 'early', current_para: 2, lines: 15, streak: 0, pace: 'slow' }
    ];

    students.forEach((s, i) => {
        sql += `INSERT INTO students (reg_no, name, class_id, custom_monthly_fee, has_concession, concession_notes, status, tenant_id, date_of_admission) VALUES ('${s.reg}', '${s.name}', ${s.classVar}, ${s.fee}, ${s.concession}, ${s.notes}, 'active', @tenant_id, '2025-01-15');\n`;
        sql += `SET @student_${i} = LAST_INSERT_ID();\n`;
        
        if (s.hifz) {
            const avgLines = s.pace === 'fast' ? 12.5 : s.pace === 'average' ? 6.5 : 4.0;
            sql += `INSERT INTO hifz_enrollment (tenant_id, student_id, class_id, current_phase, current_para, total_lines_memorized, avg_lines_30d, current_streak_days, status, enrolled_date) VALUES (@tenant_id, @student_${i}, ${s.classVar}, '${s.phase}', ${s.current_para}, ${s.lines}, ${avgLines}, ${s.streak}, 'active', '2025-01-15');\n`;
            
            const today = new Date();
            for (let dIndex = 6; dIndex >= 0; dIndex--) {
                const entryDate = new Date();
                entryDate.setDate(today.getDate() - dIndex);
                if (entryDate.getDay() === 0) continue;
                
                const dateString = entryDate.toISOString().split('T')[0];
                let sabaq_status = 'recited';
                let is_absent = 0;
                if (s.pace === 'slow' && (dIndex === 2 || dIndex === 5)) { is_absent = 1; sabaq_status = 'not_recited'; }
                if (s.pace === 'average' && dIndex === 4) { sabaq_status = 'leave'; }
                
                let valCurrentPara = is_absent ? 'NULL' : s.current_para;
                let valSabqiPara = is_absent ? 'NULL' : Math.max(1, s.current_para - 1);
                let valSabqiPara2 = is_absent ? 'NULL' : (s.current_para > 2 ? Math.max(1, s.current_para - 2) : 'NULL');
                let valManzil1 = is_absent ? 'NULL' : 1;
                let valManzil2 = is_absent ? 'NULL' : Math.max(1, s.current_para - 2);
                let valManzil3 = is_absent ? 'NULL' : Math.max(1, s.current_para - 1);
                
                sql += `INSERT INTO hifz_diary_entries (tenant_id, student_id, entry_date, is_absent, sabaq_status, sabaq_from_para, sabaq_to_para, sabaq_from_page, sabaq_to_page, sabaq_from_line, sabaq_to_line, sabqi_status, sabqi_para, sabqi_para_2, manzil_status, manzil_para_1, manzil_para_2, manzil_para_3) VALUES (@tenant_id, @student_${i}, '${dateString}', ${is_absent}, '${sabaq_status}', ${valCurrentPara}, ${valCurrentPara}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 2}, ${is_absent ? 'NULL' : 1}, ${is_absent ? 'NULL' : 16}, '${sabaq_status}', ${valSabqiPara}, ${valSabqiPara2}, '${sabaq_status}', ${valManzil1}, ${valManzil2}, ${valManzil3});\n`;
            }
            
            if (s.current_para > 1) {
                for (let pNo = 1; pNo < s.current_para; pNo++) {
                    let test_result = 'pass';
                    if (s.pace === 'slow' && pNo === 1) test_result = 'fail';
                    sql += `INSERT INTO hifz_para_completions (tenant_id, student_id, para_no, completed_date, test_date, test_result, test_evaluator_name, evaluated_by_self) VALUES (@tenant_id, @student_${i}, ${pNo}, '2025-11-20', '2025-11-25', '${test_result}', 'Qari Muhammad Ahmad', 0);\n`;
                }
            }
        }
    });

    sql += `\n-- 8. Seed Fee Payments (January to June)\n`;
    const months = [1, 2, 3, 4, 5, 6];
    months.forEach(m => {
        students.forEach((s, i) => {
            let payAmt = s.fee !== 'NULL' ? s.fee : (s.classVar === '@class_one' ? 2000.00 : 2500.00);
            if (m === 6 && (s.name === 'Muhammad Ali' || s.name === 'Anas Malik')) return;
            sql += `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date) VALUES (@tenant_id, @student_${i}, ${m}, 2026, ${payAmt}, '2026-0${m}-10');\n`;
        });
    });

    sql += `\n-- 9. Seed Donors & Donations\n`;
    sql += `INSERT INTO donors (tenant_id, name, contact_no) VALUES (@tenant_id, 'Dr. Tariq Mahmood', '03001234567');\n`;
    sql += `SET @donor_1 = LAST_INSERT_ID();\n`;
    sql += `INSERT INTO donors (tenant_id, name, contact_no) VALUES (@tenant_id, 'Sofia Foundations', '03217654321');\n`;
    sql += `SET @donor_2 = LAST_INSERT_ID();\n`;
    
    months.forEach(m => {
        sql += `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes) VALUES (@tenant_id, @donor_1, 15000.00, '2026-0${m}-05', 'trust', 'Online', 'Monthly support sponsorship');\n`;
        sql += `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes) VALUES (@tenant_id, @donor_2, 25000.00, '2026-0${m}-12', 'general', 'Cash', 'General welfare fund donation');\n`;
    });

    sql += `\n-- 10. Seed Payroll Salaries Paid\n`;
    months.forEach(m => {
        employees.forEach((emp, i) => {
            sql += `INSERT INTO salaries (tenant_id, employee_id, month, year, basic_salary, bonus, paid_date) VALUES (@tenant_id, @emp_${i}, ${m}, 2026, ${emp.salary}, 0, '2026-0${m}-01');\n`;
        });
    });

    sql += `\n-- 11. Seed Expenses (Rent & Utilities)\n`;
    months.forEach(m => {
        sql += `INSERT INTO expenses (tenant_id, date, item, amount, category, description) VALUES (@tenant_id, '2026-0${m}-02', 'Monthly School Building Rent', 35000.00, 'rent', 'Building lease payment');\n`;
        sql += `INSERT INTO expenses (tenant_id, date, item, amount, category, description) VALUES (@tenant_id, '2026-0${m}-15', 'Electricity & Gas Bill', 8500.00, 'utility', 'Overhead utilities bill');\n`;
    });
    
    sql += `\nSET FOREIGN_KEY_CHECKS = 1;\n`;

    fs.writeFileSync('seed_demo_tenant_generated.sql', sql);
    console.log('SQL generated successfully.');
})();
