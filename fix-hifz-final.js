const db = require('./db');

async function fix() {
    try {
        // Step 1: Fix classes that are Hifz classes but not marked as such
        await db.query("UPDATE classes SET is_hifz_class = 1 WHERE name LIKE '%Hifz%'");
        console.log('Fixed classes table: marked Hifz classes correctly.');

        // Step 2: Fix students in those classes
        const [classes] = await db.query('SELECT id, default_monthly_fee FROM classes WHERE is_hifz_class = 1');
        for (const c of classes) {
            // Apply full concession to students in this class who don't have it set up
            await db.query(
                'UPDATE students SET has_concession = 1, custom_monthly_fee = ? WHERE class_id = ? AND (has_concession = 0 OR custom_monthly_fee = 0 OR custom_monthly_fee IS NULL)',
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
