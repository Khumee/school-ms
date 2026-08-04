const db = require('./db');
async function run() {
    try {
        const [s] = await db.pool.query("SELECT id, name, class_id, tenant_id, has_concession, custom_monthly_fee FROM students WHERE reg_no IN ('MHD-057', 'MIS-012', 'MIS-044')");
        console.log("Students:", s);
        const [c] = await db.pool.query("SELECT id, name, is_hifz_class, tenant_id FROM classes WHERE name LIKE '%Hifz%'");
        console.log("Classes:", c);
        process.exit(0);
    } catch(err) {
        console.error(err);
        process.exit(1);
    }
}
run();
