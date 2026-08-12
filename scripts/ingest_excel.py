import os
import re
import datetime
import pandas as pd
import pymysql
from dotenv import load_dotenv

load_dotenv()

# Connect to database
conn = pymysql.connect(
    host=os.getenv("DB_HOST", "localhost"),
    port=int(os.getenv("DB_PORT", 3306)),
    user=os.getenv("DB_USER", "root"),
    password=os.getenv("DB_PASSWORD", "admin"),
    database=os.getenv("DB_NAME", "school_db")
)
cursor = conn.cursor()

# 1. Ensure Tenant exists
tenant_subdomain = "mis"
cursor.execute("SELECT id FROM tenants WHERE subdomain = %s", (tenant_subdomain,))
tenant_row = cursor.fetchone()
if not tenant_row:
    cursor.execute(
        """INSERT INTO tenants (name, subdomain, school_name, status, plan_tier) 
           VALUES (%s, %s, %s, %s, %s)""",
        ("Muhaimin Islamic School", tenant_subdomain, "Muhaimin Islamic School Rawalpindi", "active", "pro")
    )
    tenant_id = cursor.lastrowid
else:
    tenant_id = tenant_row[0]

# Ensure Default Admin User exists
cursor.execute("SELECT id FROM users WHERE username = %s AND tenant_id = %s", ("admin", tenant_id))
if not cursor.fetchone():
    # bcrypt hash of '1234'
    bcrypt_hash = "$2b$10$M1IY6qBDG9A.L4gJ7GCDIuy8PSEGuTZ.pcm6pg.WhUJpkZkI0UfCC"
    cursor.execute(
        "INSERT INTO users (username, password, role, tenant_id) VALUES (%s, %s, %s, %s)",
        ("admin", bcrypt_hash, "admin", tenant_id)
    )

# Ensure active session exists
cursor.execute("SELECT id FROM sessions WHERE name = %s AND tenant_id = %s", ("2026", tenant_id))
session_row = cursor.fetchone()
if not session_row:
    cursor.execute("INSERT INTO sessions (name, is_active, tenant_id) VALUES (%s, %s, %s)", ("2026", 1, tenant_id))
    session_id = cursor.lastrowid
else:
    session_id = session_row[0]

excel_path = r"D:\school-ms\Muhaimin Islamic School 2026.xlsx"
xl = pd.ExcelFile(excel_path)

print("DB Initialized. Importing classes and students...")

# 2. Import Classes & Students from 'Current Students' sheet
df_students = pd.read_excel(xl, 'Current Students', header=None)

current_class_id = None
student_reg_to_id = {}

class_names_mapping = {}

for idx, row in df_students.iterrows():
    val0 = str(row[0]).strip() if pd.notna(row[0]) else ""
    val1 = str(row[1]).strip() if pd.notna(row[1]) else ""
    val2 = str(row[2]).strip() if pd.notna(row[2]) else ""
    
    if val0 == "Serial No" or not val0:
        continue
        
    # Check if this row defines a class (no reg_no and name, but has class name in val0)
    if not val1 and not val2:
        class_name = val0
        cursor.execute("SELECT id FROM classes WHERE name = %s AND tenant_id = %s", (class_name, tenant_id))
        class_row = cursor.fetchone()
        if not class_row:
            cursor.execute("INSERT INTO classes (name, tenant_id) VALUES (%s, %s)", (class_name, tenant_id))
            current_class_id = cursor.lastrowid
        else:
            current_class_id = class_row[0]
        class_names_mapping[class_name.lower().replace(" ", "")] = current_class_id
        print(f"Created class: {class_name}")
    elif current_class_id and val1:
        # Student row
        reg_no = val1
        name = val2
        
        cursor.execute("SELECT id FROM students WHERE reg_no = %s AND tenant_id = %s", (reg_no, tenant_id))
        stud_row = cursor.fetchone()
        if not stud_row:
            cursor.execute(
                """INSERT INTO students (reg_no, name, class_id, status, tenant_id) 
                   VALUES (%s, %s, %s, %s, %s)""",
                (reg_no, name, current_class_id, "active", tenant_id)
            )
            student_id = cursor.lastrowid
        else:
            student_id = stud_row[0]
            
        student_reg_to_id[reg_no.lower()] = student_id
        
        # Enroll in session
        cursor.execute(
            "SELECT id FROM student_enrollments WHERE student_id = %s AND session_id = %s", 
            (student_id, session_id)
        )
        if not cursor.fetchone():
            cursor.execute(
                "INSERT INTO student_enrollments (student_id, class_id, session_id, tenant_id) VALUES (%s, %s, %s, %s)",
                (student_id, current_class_id, session_id, tenant_id)
            )

print("Classes and students imported successfully. Deducing tuition fees and concessions...")

# 3. Parse Fee sheet to map concessions and payments
df_fee = pd.read_excel(xl, 'Fee', header=None)

# Locate headers and classes in Fee sheet
# Row 4 contains month names (Reg No, Name, Jan..Dec)
month_cols = {}
for col_idx in range(len(df_fee.columns)):
    val = str(df_fee.iloc[4, col_idx]).strip() if pd.notna(df_fee.iloc[4, col_idx]) else ""
    if val in ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']:
        month_name_to_num = {
            'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6,
            'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12
        }
        month_cols[col_idx] = month_name_to_num[val]

# First, find student payments and collect fees paid per student/class
fee_payments_list = []
student_fee_modes = {} # student_id -> list of payment amounts
class_payment_amounts = {} # class_id -> list of payment amounts

fee_current_class_id = None

for idx, row in df_fee.iterrows():
    if idx <= 4:
        continue
    val0 = str(row[0]).strip() if pd.notna(row[0]) else ""
    val2 = str(row[2]).strip() if pd.notna(row[2]) else ""
    val3 = str(row[3]).strip() if pd.notna(row[3]) else ""
    
    # Check if this row is a class header
    if not val0 and val2 and not val3:
        class_name = val2.strip()
        # Find matching class id
        normalized_name = class_name.lower().replace("class", "").replace(" ", "")
        fee_current_class_id = None
        for cname, cid in class_names_mapping.items():
            if normalized_name in cname or cname in normalized_name:
                fee_current_class_id = cid
                break
        if not fee_current_class_id:
            # Fallback
            cursor.execute("SELECT id FROM classes WHERE name LIKE %s AND tenant_id = %s", (f"%{class_name}%", tenant_id))
            crow = cursor.fetchone()
            if crow:
                fee_current_class_id = crow[0]
        continue
        
    if val2 and val2.lower() in student_reg_to_id:
        student_id = student_reg_to_id[val2.lower()]
        
        # Read payments
        for col_idx, month_num in month_cols.items():
            amt_val = row.iloc[col_idx]
            try:
                amt_val_f = float(amt_val)
                is_num = True
            except (ValueError, TypeError):
                is_num = False
            if pd.notna(amt_val) and is_num and amt_val_f > 0:
                amount = amt_val_f
                fee_payments_list.append((student_id, month_num, amount))
                
                # Track for concession calculations
                if student_id not in student_fee_modes:
                    student_fee_modes[student_id] = []
                student_fee_modes[student_id].append(amount)
                
                if fee_current_class_id:
                    if fee_current_class_id not in class_payment_amounts:
                        class_payment_amounts[fee_current_class_id] = []
                    class_payment_amounts[fee_current_class_id].append(amount)

# Calculate standard fee per class (e.g. maximum non-zero amount paid in that class)
class_default_fees = {}
for cid, payments in class_payment_amounts.items():
    if payments:
        class_default_fees[cid] = max(payments)
    else:
        class_default_fees[cid] = 2000.00 # fallback standard fee

# Update classes with their default fees
for cid, default_fee in class_default_fees.items():
    cursor.execute("UPDATE classes SET default_monthly_fee = %s WHERE id = %s", (default_fee, cid))

# Update student concession profile fields
for student_id, payments in student_fee_modes.items():
    # Find student class default fee
    cursor.execute("SELECT class_id FROM students WHERE id = %s", (student_id,))
    class_id = cursor.fetchone()[0]
    default_fee = class_default_fees.get(class_id, 2000.00)
    
    # Custom fee is the most frequent payment amount
    if payments:
        most_common_fee = max(set(payments), key=payments.count)
        if most_common_fee < default_fee:
            cursor.execute(
                "UPDATE students SET custom_monthly_fee = %s, has_concession = 1, concession_notes = 'Scholarship support' WHERE id = %s",
                (most_common_fee, student_id)
            )
        else:
            cursor.execute("UPDATE students SET custom_monthly_fee = %s WHERE id = %s", (most_common_fee, student_id))
    else:
        # Student never paid: full concession
        cursor.execute(
            "UPDATE students SET custom_monthly_fee = 0.00, has_concession = 1, concession_notes = 'Full concession' WHERE id = %s",
            (student_id,)
        )

# Insert the fee payments
for student_id, month_num, amount in fee_payments_list:
    cursor.execute(
        """INSERT IGNORE INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date)
           VALUES (%s, %s, %s, 2026, %s, %s)""",
        (tenant_id, student_id, month_num, amount, datetime.date(2026, month_num, 1))
    )

print("Fees and concessions imported. Importing donors & donations...")

# 4. Import Donors & Donations
df_donations = pd.read_excel(xl, 'Donations', header=None)

# Find sections
trust_section_row = 25

# Process Section 1 (Donations Record 2026) - General
donor_name_to_id = {}

month_mapping = {
    'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6,
    'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12
}

def parse_donation_section(start_row, end_row, category):
    headers_row = df_donations.iloc[start_row]
    cols = {}
    for col_idx, h_val in enumerate(headers_row):
        h_str = str(h_val).strip()
        if h_str in month_mapping:
            cols[col_idx] = month_mapping[h_str]
        elif h_str == 'Referred By':
            cols['referred'] = col_idx
        elif h_str == 'Contact No':
            cols['contact'] = col_idx
            
    for row_idx in range(start_row + 1, end_row):
        row = df_donations.iloc[row_idx]
        val0 = str(row[0]).strip() if pd.notna(row[0]) else ""
        val1 = str(row[1]).strip() if pd.notna(row[1]) else ""
        
        if not val0 or val1 == "Total":
            continue
            
        donor_name = val1
        referred_by = str(row.iloc[cols['referred']]).strip() if 'referred' in cols and pd.notna(row.iloc[cols['referred']]) else None
        contact_no = str(row.iloc[cols['contact']]).strip() if 'contact' in cols and pd.notna(row.iloc[cols['contact']]) else None
        
        # Check / Insert Donor
        cursor.execute("SELECT id FROM donors WHERE name = %s AND tenant_id = %s", (donor_name, tenant_id))
        drow = cursor.fetchone()
        if not drow:
            cursor.execute(
                "INSERT INTO donors (name, contact_no, referred_by, tenant_id) VALUES (%s, %s, %s, %s)",
                (donor_name, contact_no, referred_by, tenant_id)
            )
            donor_id = cursor.lastrowid
        else:
            donor_id = drow[0]
            
        # Loop through monthly columns
        for col_idx, m_num in cols.items():
            if isinstance(col_idx, int):
                damt = row.iloc[col_idx]
                try:
                    damt_f = float(damt)
                    is_num = True
                except (ValueError, TypeError):
                    is_num = False
                if pd.notna(damt) and is_num and damt_f > 0:
                    cursor.execute(
                        """INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method)
                           VALUES (%s, %s, %s, %s, %s, %s)""",
                        (tenant_id, donor_id, damt_f, datetime.date(2026, m_num, 1), category, "Cash")
                    )

parse_donation_section(3, 25, 'general')
parse_donation_section(27, len(df_donations), 'trust')

print("Donors and donations imported. Importing employee payroll & salary details...")

# 5. Import Employees & Salaries
df_sal = pd.read_excel(xl, 'Salary', header=None)

# Headers in row 3
headers_sal = df_sal.iloc[3]
month_sal_cols = {}
for col_idx, val in enumerate(headers_sal):
    val_str = str(val).strip()
    if val_str in month_mapping:
        month_sal_cols[col_idx] = month_mapping[val_str]

employee_name_to_id = {}

for idx, row in df_sal.iterrows():
    if idx <= 3:
        continue
    val0 = str(row[0]).strip() if pd.notna(row[0]) else ""
    val1 = row[1] # Joining date
    val2 = str(row[2]).strip() if pd.notna(row[2]) else "" # Name
    val3 = str(row[3]).strip() if pd.notna(row[3]) else "" # Designation
    
    if not val0 or val2 == "Total":
        continue
        
    emp_name = val2
    emp_desig = val3
    
    # Parse joining date
    joining_date = None
    if pd.notna(val1):
        if isinstance(val1, datetime.datetime):
            joining_date = val1.date()
        elif isinstance(val1, datetime.date):
            joining_date = val1
        else:
            try:
                joining_date = pd.to_datetime(val1).date()
            except:
                pass
                
    # Find default salary (last non-zero salary)
    default_salary = 0.00
    for col_idx in sorted(month_sal_cols.keys()):
        val_sal = row.iloc[col_idx]
        try:
            val_sal_f = float(val_sal)
            is_num = True
        except (ValueError, TypeError):
            is_num = False
        if pd.notna(val_sal) and is_num and val_sal_f > 0:
            default_salary = val_sal_f
            
    # Insert Employee
    cursor.execute("SELECT id FROM employees WHERE name = %s AND tenant_id = %s", (emp_name, tenant_id))
    erow = cursor.fetchone()
    if not erow:
        # Determine employee role
        role = 'teacher'
        if 'principal' in emp_desig.lower():
            role = 'admin'
        elif 'admin' in emp_desig.lower():
            role = 'admin'
        elif 'cleaner' in emp_desig.lower() or 'peon' in emp_desig.lower():
            role = 'support'
            
        cursor.execute(
            """INSERT INTO employees (name, designation, role, status, date_of_joining, default_salary, tenant_id)
               VALUES (%s, %s, %s, %s, %s, %s, %s)""",
            (emp_name, emp_desig, role, "on_payroll", joining_date, default_salary, tenant_id)
        )
        emp_id = cursor.lastrowid
    else:
        emp_id = erow[0]
        
    employee_name_to_id[emp_name.lower()] = emp_id
    
    # Insert Salaries paid
    for col_idx, m_num in month_sal_cols.items():
        val_sal = row.iloc[col_idx]
        try:
            val_sal_f = float(val_sal)
            is_num = True
        except (ValueError, TypeError):
            is_num = False
        if pd.notna(val_sal) and is_num and val_sal_f > 0:
            cursor.execute(
                """INSERT IGNORE INTO salaries (tenant_id, employee_id, month, year, basic_salary, paid_date)
                   VALUES (%s, %s, %s, 2026, %s, %s)""",
                (tenant_id, emp_id, m_num, val_sal_f, datetime.date(2026, m_num, 1))
            )

# Import Eid Bonuses
df_eid = pd.read_excel(xl, 'Eid Bonus', header=None)
for idx, row in df_eid.iterrows():
    if idx <= 3:
        continue
    val0 = str(row[0]).strip() if pd.notna(row[0]) else ""
    val2 = str(row.iloc[2]).strip() if pd.notna(row.iloc[2]) else "" # Name
    val4 = row.iloc[4] # Eid bonus amount
    
    if not val0 or not val2 or val2 == "Total":
        continue
        
    if val2.lower() in employee_name_to_id:
        emp_id = employee_name_to_id[val2.lower()]
        try:
            val4_f = float(val4)
            is_num = True
        except (ValueError, TypeError):
            is_num = False
        if pd.notna(val4) and is_num and val4_f > 0:
            # Add Eid bonus to salaries for March 2026 (Month 3)
            # Check if salary record already exists
            cursor.execute(
                "SELECT id FROM salaries WHERE employee_id = %s AND month = 3 AND year = 2026 AND tenant_id = %s",
                (emp_id, tenant_id)
            )
            sal_row = cursor.fetchone()
            if sal_row:
                cursor.execute(
                    "UPDATE salaries SET bonus = %s, bonus_description = 'Eid ul Fitr' WHERE id = %s",
                    (val4_f, sal_row[0])
                )
            else:
                # Get default salary
                cursor.execute("SELECT default_salary FROM employees WHERE id = %s", (emp_id,))
                def_sal = cursor.fetchone()[0]
                cursor.execute(
                    """INSERT INTO salaries (tenant_id, employee_id, month, year, basic_salary, bonus, bonus_description, paid_date)
                       VALUES (%s, %s, 3, 2026, %s, %s, 'Eid ul Fitr', %s)""",
                    (tenant_id, emp_id, def_sal, val4_f, datetime.date(2026, 3, 1))
                )

print("Salaries and bonuses imported. Importing monthly overhead expenses...")

# 6. Import General Expenses from monthly tabs
# NOTE: column positions for the 3 side-by-side sections (Main/Office/Utility)
# are NOT consistent across month sheets (e.g. 'Jan' is shifted one column to
# the right compared to 'Feb'..'Jun'), so we detect the header row and each
# section's "Date" column dynamically per sheet instead of hardcoding indices.
sheet_name_overrides = {'Jul': 'July'}

def find_expense_sections(df_m):
    """Scans the first few rows for the header row containing 'Date' labels
    and returns (data_start_row, [(date_col, item_col, amt_col, category), ...])."""
    header_row = None
    for r in range(0, min(8, len(df_m))):
        row_vals = [str(v).strip() if pd.notna(v) else "" for v in df_m.iloc[r]]
        if row_vals.count('Date') >= 1:
            header_row = r
            break
    if header_row is None:
        return None, []

    row_vals = [str(v).strip() if pd.notna(v) else "" for v in df_m.iloc[header_row]]
    date_cols = [i for i, v in enumerate(row_vals) if v == 'Date']
    section_categories = ['other', 'office', 'utility']  # Main, Office, Utility in left-to-right order
    sections = []
    for idx, date_col in enumerate(date_cols):
        cat = section_categories[idx] if idx < len(section_categories) else 'other'
        sections.append((date_col, date_col + 1, date_col + 2, cat))
    return header_row + 1, sections

for month_name, m_num in month_mapping.items():
    actual_sheet_name = sheet_name_overrides.get(month_name, month_name)
    if actual_sheet_name not in xl.sheet_names:
        continue

    df_m = pd.read_excel(xl, actual_sheet_name, header=None)
    data_start, sections = find_expense_sections(df_m)
    if data_start is None:
        continue

    def extract_expense_ledger(date_col, item_col, amt_col, exp_category):
        for idx in range(data_start, len(df_m)):
            r_date = df_m.iloc[idx, date_col]
            r_item = df_m.iloc[idx, item_col]
            r_amt = df_m.iloc[idx, amt_col]

            if pd.isna(r_item) or pd.isna(r_amt):
                continue

            item_str = str(r_item).strip()
            # Clean totals or balances
            if "total" in item_str.lower() or "balance" in item_str.lower() or "carry" in item_str.lower():
                continue

            # Skip salaries in monthly expenses as we track them via payroll salaries table
            if "salary" in item_str.lower() or "salaries" in item_str.lower():
                continue

            # Skip section subtotal labels that appear inline among the real line items
            # (e.g. "Office Expense" / "Utility Bills" / "Expense" recap figures, not real transactions)
            if item_str.lower() in ('expense', 'office expense', 'utility bills', 'utility bill'):
                continue

            try:
                amt = float(r_amt)
            except (ValueError, TypeError):
                continue
            if amt <= 0:
                continue

            # Parse date
            exp_date = None
            if pd.notna(r_date):
                if isinstance(r_date, datetime.datetime):
                    exp_date = r_date.date()
                elif isinstance(r_date, datetime.date):
                    exp_date = r_date
                else:
                    try:
                        exp_date = pd.to_datetime(r_date).date()
                    except:
                        pass
            if not exp_date:
                exp_date = datetime.date(2026, m_num, 1)

            # Map category
            cat = exp_category
            if "rent" in item_str.lower():
                cat = "rent"
            elif "bill" in item_str.lower() or "electricity" in item_str.lower() or "water" in item_str.lower() or "gas" in item_str.lower():
                cat = "utility"

            cursor.execute(
                """INSERT INTO expenses (tenant_id, date, item, amount, category, description)
                   VALUES (%s, %s, %s, %s, %s, %s)""",
                (tenant_id, exp_date, item_str, amt, cat, item_str)
            )

    for date_col, item_col, amt_col, cat in sections:
        extract_expense_ledger(date_col, item_col, amt_col, cat)

conn.commit()
conn.close()
print("[Success] Seeding and ingestion completed successfully!")
