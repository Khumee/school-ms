# Implementation Plan: Multitenant SaaS School Management System (school-ms)

This plan outlines the architecture, database schema, and module designs for a new multi-tenant SaaS School Management System (`school-ms`) adapted from the patterns established in `madrassa-ms`. The design includes the specific additions required by the school's Excel-based management workflow (fee concessions, donation logs, admin-marked teacher attendance, and salary/expense ledgers).

---

## User Review Required

> [!IMPORTANT]
> **Key Architectural Assumptions & System Customizations:**
> 1. **Technology Stack:** We will mirror the stack of `madrassa-ms` (Node.js, Express, EJS, MySQL, and context-based multi-tenancy using `AsyncLocalStorage`).
> 2. **Fee Concession Strategy:** Instead of standard billing with discounts, each student can be assigned a `custom_monthly_fee` (representing their net due fee, e.g., 300 PKR for concession students or 0 PKR for full support), which overrides the default class-level tuition fee.
> 3. **Donation Categorization:** Donations will be tracked across different accounts (e.g., "Personal/Direct" and "Trust Account") as seen in the excel sheet, with metadata for referrers (`referred_by`).
> 4. **Teacher Attendance:** The UI and routes will allow School Admins to mark teacher attendance (present/absent/leave, class/period assignments) rather than relying on student self-reports.
> 5. **General Ledger (Expenses & Salary):** We will implement a basic ledger system to track monthly operational expenses (rent, utility bills, salaries, bonuses like Eid bonus) as documented in the Excel sheets.

---

## Open Questions

> [!NOTE]
> 1. **Default Fee Structure:** Does every class have a standard monthly tuition fee, or is it entirely custom/negotiated per student? (Our plan supports setting a class standard fee which is overridden by a student-specific custom fee).
> 2. **Subdomain vs Custom Domain Strategy:** Will schools be provisioned using subdomains (e.g., `muhaimin.schoolms.com`) or path-based scoping? (We recommend subdomains).

---

## References to `madrassa-ms` Codebase

To speed up development, we will reuse and adapt core configurations, controllers, views, and routing logic from the `madrassa-ms` project. Below are the specific paths for reference:

- **Database Connection & Multi-Tenant Middleware Wrapper:** Refer to [db.js](file:///d:/madrassa-ms/db.js) and the middleware context setup in [middleware/](file:///d:/madrassa-ms/middleware/).
- **Auth & Session Management:** Adapt controllers from [controllers/authController.js](file:///d:/madrassa-ms/controllers/authController.js) and the session config in [server.js](file:///d:/madrassa-ms/server.js).
- **Timetable & Periods Logic:** Copy database structures, schema, and page templates relating to class schedules/periods from [sql/V1__Schema.sql](file:///d:/madrassa-ms/sql/V1__Schema.sql#L190-L210) and routing/view files.
- **Urdu/Arabic Localization Configurations:** Reuse the localization dictionary files in [locales/](file:///d:/madrassa-ms/locales/).

---

## Proposed Changes

### Database Schema Design

#### [NEW] [schema.sql](file:///d:/school-ms/sql/V1__Schema.sql)
We will define the new schema for the multi-tenant system. In addition to standard school tables, it will incorporate:
* `tenants` and `master_admins` tables (for SaaS provisioning and management).
* `donations` and `donors` tables (to track donations, referrers, and fund categories).
* `student_fees` or `fee_payments` table (to track monthly payments and outstanding balances).
* `expenses` and `salaries` tables (to record monthly overheads, payroll, and bonuses).
* `attendance_teachers` (scoped to admin-marking).

```sql
-- Core Tenants
CREATE TABLE IF NOT EXISTS tenants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subdomain VARCHAR(100) NOT NULL UNIQUE,
    custom_domain VARCHAR(255) UNIQUE,
    status ENUM('active', 'suspended', 'maintenance') DEFAULT 'active',
    logo_url VARCHAR(255) DEFAULT '/images/default_logo.png',
    school_name VARCHAR(255) NOT NULL,
    primary_color VARCHAR(7) DEFAULT '#3b82f6',
    secondary_color VARCHAR(7) DEFAULT '#1d4ed8',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Donors Registry
CREATE TABLE IF NOT EXISTS donors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    contact_no VARCHAR(50),
    referred_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);

-- Donation Payments
CREATE TABLE IF NOT EXISTS donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    donor_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    fund_category ENUM('general', 'trust', 'student_support') DEFAULT 'general',
    payment_method VARCHAR(50) DEFAULT 'Cash',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (donor_id) REFERENCES donors(id) ON DELETE CASCADE
);

-- Classes Table
CREATE TABLE IF NOT EXISTS classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    default_monthly_fee DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);

-- Employees Table
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL, -- e.g., 'Principal', 'Primary Teacher', 'Cleaner'
    role ENUM('admin', 'teacher', 'support') DEFAULT 'teacher',
    status ENUM('on_payroll', 'volunteer', 'inactive') DEFAULT 'on_payroll',
    date_of_joining DATE,
    default_salary DECIMAL(10,2) DEFAULT 0.00,
    
    -- Additional Admission/HR Details
    email VARCHAR(100),
    phone VARCHAR(50),
    cnic_number VARCHAR(20),
    address VARCHAR(255),
    gender ENUM('male', 'female', 'other'),
    qualification VARCHAR(150),
    experience_years INT DEFAULT 0,
    bank_account_info VARCHAR(255),
    
    user_id INT DEFAULT NULL, -- linked to users table for logging in
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);

-- Students (with Concession & Detailed Admission Details)
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    reg_no VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    class_id INT,
    
    -- Concession Details
    custom_monthly_fee DECIMAL(10,2) DEFAULT NULL, -- NULL means they pay the default class fee
    has_concession BOOLEAN DEFAULT FALSE,
    concession_notes TEXT,
    
    -- Admission & Demographic Details
    father_name VARCHAR(100),
    father_phone VARCHAR(50),
    emergency_contact VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(255),
    gender ENUM('male', 'female', 'other'),
    date_of_admission DATE,
    status ENUM('active', 'left', 'graduated') DEFAULT 'active',
    previous_school_info VARCHAR(255),
    blood_group VARCHAR(5),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_reg_no_per_tenant (tenant_id, reg_no),
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE SET NULL,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);

-- Student Fee Payments (Monthly Ledger)
CREATE TABLE IF NOT EXISTS fee_payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    student_id INT NOT NULL,
    month TINYINT NOT NULL, -- 1-12 (Jan - Dec)
    year INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    recorded_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_payment_per_student_month (tenant_id, student_id, month, year),
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Salaries Table (Payroll Tracking)
CREATE TABLE IF NOT EXISTS salaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    employee_id INT NOT NULL,
    month TINYINT NOT NULL,
    year INT NOT NULL,
    basic_salary DECIMAL(10,2) NOT NULL,
    bonus DECIMAL(10,2) DEFAULT 0.00,
    bonus_description VARCHAR(255), -- e.g., 'Eid Bonus'
    paid_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- General Expenses
CREATE TABLE IF NOT EXISTS expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT NOT NULL,
    date DATE NOT NULL,
    item VARCHAR(150) NOT NULL, -- e.g. 'Rent', 'Water Bill'
    amount DECIMAL(10,2) NOT NULL,
    category ENUM('rent', 'utility', 'salary', 'office', 'other') DEFAULT 'other',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE
);
```

---

### Key Modules & Components

1. **Multi-Tenant Context Management (`db.js`)**:
   - Reuse `AsyncLocalStorage` architecture to isolate queries.
   - Restrict data visibility using automatic queries checks.

2. **Donation Tracking Module**:
   - Manage donor accounts, contact details, and referrals.
   - Record donation payments, assign them to funds (e.g., Trust Account vs. General Fund).
   - Display a dashboard with monthly donation totals vs. student fee income.

3. **Fee Concession & Ledger Panel**:
   - Class management (define default tuition fee, e.g., nursery = 2000).
   - Student profiles where Admins configure individual concessions (i.e. override standard fee with custom monthly fee).
   - A grid interface (like the Excel layout) for marking monthly fee collections (Jan to Dec).

4. **Teacher Attendance marked by Admin**:
   - A dedicated page for school admins or designated staff to log daily teacher attendance.
   - Unlike students, teachers cannot mark their own or others' attendance unless granted permission.

5. **Operational Ledger (Salary & Expenses)**:
   - Logging of recurring costs (Rent, Utility Bills) and direct link to payroll execution.
   - Bonus allocation page (e.g., Eid Bonus sheet).

6. **KPI Dashboard & Reports Panel**:
   - Displays student metrics: Total Students, Paying vs Supported counts.
   - Displays payroll metrics: Total Employees, On Payroll vs Volunteers (categorized by role: Teacher vs Admin).
   - Dynamic monthly dashboard mirroring the Excel `Summary` sheet:
     - Monthly grids of Fees + Donations = Total Income.
     - Monthly grids of Rent + Salaries + Utility + Office = Total Expenses.
     - Automatic calculation of Net Balance (Income - Expenses) with dynamic carry-forward balance tracking.

---

## Data Ingestion Strategy (Excel to Database)

To seamlessly replace the Excel workflow, we will create a dedicated ingestion utility script `scripts/ingest_excel.js` (using the `exceljs` package) or a Python utility `scripts/ingest_excel.py`. The ingestion process will execute the following steps for the initial tenant:

1. **Establish Tenant Reference:** Create or resolve the default tenant (e.g., subdomain: `muhaimin`).
2. **Import Classes & Students:**
   - Parse `Current Students` tab.
   - Create the classes (`Play Group`, `Nursery`, `Prep`, etc.).
   - Create student records with basic fields.
3. **Parse Fees and Deduce Concessions:**
   - Parse `Fee` sheet.
   - Map existing payments (Jan–Dec) to the `fee_payments` ledger.
   - Infer concessions: If a student's normal monthly payment is less than the class default fee, calculate their `custom_monthly_fee` based on their most frequent payment value, mark `has_concession = TRUE`, and save it to their profile.
4. **Import Donors & Donations:**
   - Parse `Donations` sheet (Personal and Trust Account sections).
   - Populate `donors` table (extracting referrer name and contact details).
   - Log historic monthly donations into `donations`.
5. **Import Employees & Salaries:**
   - Parse `Salary` and `Eid Bonus` sheets.
   - Insert employees with their designated roles and default salaries.
   - Populate historic salary transactions under `salaries`.
6. **Import Monthly Overhead Ledgers:**
   - Read monthly sheets (`Jan`, `Feb`, `Mar`, etc.) to parse rent, utility, and office expenses.
   - Record these into the `expenses` table.

---

## Verification Plan

### Automated Tests
- Run migration schemas on a fresh test database.
- Execute the ingestion script and check database row counts:
  - 167 students, 151 with concessions.
  - 13 teachers, 6 admins.
  - Verify that the sum of ingested donations matches the spreadsheet totals.

### Manual Verification
- Visual inspection of the dashboard for donation vs fee summary metrics.
- End-to-end flow: Add a student with a custom concession fee (300 PKR), mark their Jan fee as paid, and ensure the outstanding balance matches calculations.
