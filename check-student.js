const db = require('./db');
async function run() {
    try {
        const [s] = await db.pool.query("SELECT * FROM students WHERE reg_no = 'MIS-012'");
        console.log(s);
        process.exit(0);
    } catch(err) {
        console.error(err);
        process.exit(1);
    }
}
run();
