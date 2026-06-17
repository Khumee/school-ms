# Project Status & Transition Handover Notes (Updated)

This document contains a comprehensive record of the context, completed work, resolved issues, and next steps for the `school-ms` project to allow a seamless resume.

---

## 1. Project Overview & Context
- **Institution:** Muhaimin Islamic School Rawalpindi (A Project of Muhaimin Welfare Trust).
- **Core Requirements:**
  - Multitenant SaaS architecture similar to `madrassa-ms`.
  - Lightweight, professional, English-only user interface.
  - Custom tuition fee concessions (overriding default class fees).
  - Donation tracking categorized by funds (e.g. Trust Account vs General Fund).
  - Admin-marked teacher attendance (not marked by students).
  - General expenses ledger and payroll summary reporting.
  - KPI Dashboard replicating the Excel `Summary` sheet.

---

## 2. Progress Checklist & Completed Tasks

- [x] **Project Scaffolding:**
  - Initialized `package.json` with dependencies (`express`, `ejs`, `mysql2`, `dotenv`, `exceljs`, `luxon`, `bcryptjs`).
  - Created `.env` config with local MySQL database credentials (`DB_NAME=school_db`, `DB_PASSWORD=admin`).
  - Adapted database context wrapper `db.js` with `AsyncLocalStorage` tenant context scoping.
- [x] **Database Schema Setup:**
  - Created database schema history and table structures in [V1__Schema.sql](file:///d:/school-ms/sql/V1__Schema.sql) (includes `tenants`, `employees`, `students`, `fee_payments`, `donors`, `donations`, `salaries`, `expenses`, `attendance_employees`, etc.).
  - Created migration runner [migrate.js](file:///d:/school-ms/migrate.js).
  - Successfully ran migrations to initialize the `school_db` schema.
- [x] **Core Server Application & Routes:**
  - Created main server file [server.js](file:///d:/school-ms/server.js).
  - Created tenant resolution middleware [middleware/tenant.js](file:///d:/school-ms/middleware/tenant.js).
  - Created authentication middleware [middleware/auth.js](file:///d:/school-ms/middleware/auth.js).
  - Developed routers under [routes/](file:///d:/school-ms/routes/):
    - `auth.js`: Handles session logins/logouts.
    - `dashboard.js`: Generates KPI dashboard statistics and aggregates the financial monthly table.
    - `students.js` & `employees.js`: Admission onboarding and profile management (fully supporting demographic details).
    - `fees.js`: Handles concessions updates and fee payments logging.
    - `donations.js`: Logs donor directory and donation transactions.
    - `attendance.js`: Admin-marked employee attendance.
    - `expenses.js`: General ledgers for rent, utilities, office expenses.
- [x] **User Interface & Views:**
  - Set up standard lightweight, English-only stylesheet [public/css/style.css](file:///d:/school-ms/public/css/style.css).
  - Created EJS views and layout partials under [views/](file:///d:/school-ms/views/):
    - Headers/Footers with dynamic theme color injection.
    - Login and password change cards.
    - Summary Dashboard grid and month-by-month Income vs. Expense ledger table.
    - Student/Employee list directories and detailed Admission creation/edit forms.
    - Concession list manager and Fee Payment Ledger matrix (Jan–Dec).
    - Donors matrix grid and donation record logger.
    - Staff attendance radio-button matrix.
    - Expenses log and Payroll issue sheets.

---

## 3. Current Ingestion Status & Debug Details
- The data ingestion script is located at [scripts/ingest_excel.py](file:///d:/school-ms/scripts/ingest_excel.py).
- **Completed Data Migration (fully verified, all tables populated):**
  - Ingested **9 Classes** (Play Group, Nursery, Prep, One, Two, Three, Four, Fifth Class, Hifz).
  - Ingested **157 Students** (118 with concessions).
  - Ingested **19 Employees** (teachers, principals, admin, cleaning staff) and established default salaries.
  - Ingested **56 Donors** and **235 Donation Records** (for subdomain: `mis`).
  - Ingested **82 Salaries/Payroll Payouts** (inclusive of Eid Bonuses).
  - Ingested **61 Overhead Expenses** (rent, utility bills, office stationery).
  - Ingested **339 Fee Payment Records** (previously `0` — see fix below).
- **Subdomain Routing Setup:**
  - The Excel actual school data is mapped to subdomain **`mis`** (which maps to `mis.nukrim.com`).
  - The sandbox/demo school portal will map to subdomain **`school-ms`** (which maps to `school-ms.nukrim.com`).

- **Resolved Ingestion Bug (Fee Payments):**
  - *Root cause:* In the `Fee` sheet, the script read the month header row (`Jan`...`Dec`) from row index `3`, but row 3 is blank — the actual header row (`Reg No`, `Name`, `Jan`...`Dec`) is at row index `4`. This made `month_cols` empty, so no payment amounts were ever extracted.
  - *Fix applied:* Updated `scripts/ingest_excel.py` to read the header row at `df_fee.iloc[4, col_idx]` instead of index `3`, and adjusted the skip condition in the row loop to `if idx <= 4`.
  - *Verified:* After dropping the DB, re-running migrations, and re-running ingestion, `fee_payments` now has 339 rows, and the dashboard's monthly ledger correctly shows fee totals (e.g. January = 153,800 PKR).
- **Resolved Login Bug (Default Admin Password):**
  - *Root cause:* The hardcoded "bcrypt hash of '1234'" placeholder in `scripts/ingest_excel.py` (`$2a$10$9xGqR7/u4p9hR3r9X.l15uxm3mC5H11267423.8.d55169a/1336`) was not a real bcrypt hash, so login always failed with "Invalid username or password."
  - *Fix applied:* Generated a real bcrypt hash of `1234` via `bcryptjs` and replaced the placeholder in the script (and updated the already-seeded `users` row directly). New hash: `$2b$10$M1IY6qBDG9A.L4gJ7GCDIuy8PSEGuTZ.pcm6pg.WhUJpkZkI0UfCC`.
  - *Verified:* Logged in as `admin` / `1234` against the `mis` tenant and confirmed the dashboard renders with correct KPI and monthly ledger data.

---

## 4. How to Resume the Setup

1. **Re-run Ingestion from scratch (if needed):**
     ```powershell
     mysql -u root -padmin -e "DROP DATABASE school_db;"
     npm run migrate
     python scripts/ingest_excel.py
     ```
2. **Start the Application:**
   - Launch the server:
     ```powershell
     npm start
     ```
   - Access the portal locally at `http://localhost:3000` (or `http://mis.localhost:3000`).
   - Default login credentials:
     - **Username:** `admin`
     - **Password:** `1234`

---

## 5. Suggested Next Steps
- Manually click through the UI (Students, Fees ledger, Donations, Attendance, Expenses, Payroll) to spot-check rendering and data accuracy beyond the dashboard.
- Decide on resolution for malformed registration numbers in the `Fee` sheet (e.g. `Mis=265`, `MIs=264` use `=` instead of `-`), which currently fail to match against `Current Students` and are silently skipped — confirm with the school whether these are typos to fix in the source Excel or in the matching logic.
- Address the data discrepancy: employees ingested is 19, not 20 as previously logged — confirm against source sheet if this is expected (e.g. a duplicate name collapsed) or a real gap.
- Decide on subdomain/DNS provisioning for `mis.nukrim.com` and `school-ms.nukrim.com` per the open question in `implementation_plan.md`.
