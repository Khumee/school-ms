const db = require('./db');

async function fix() {
    try {
        const [classes] = await db.query('SELECT id, default_monthly_fee FROM classes WHERE is_hifz_class = 1 AND tenant_id = 1');
        for (const c of classes) {
            await db.query(
                'UPDATE students SET has_concession = 1, custom_monthly_fee = ? WHERE class_id = ? AND tenant_id = 1',
                [c.default_monthly_fee, c.id]
            );
        }
        console.log('Fixed Hifz students concessions completely!');
        process.exit(0);
    } catch(err) {
        console.error(err);
        process.exit(1);
    }
}
fix();
