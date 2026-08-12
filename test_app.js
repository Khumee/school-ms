const express = require('express');
const app = express();
const db = require('./db');

app.set('view engine', 'ejs');
app.set('views', './views');

// stub middleware
const Module = require('module');
const originalRequire = Module.prototype.require;
Module.prototype.require = function() {
    if (arguments[0] === '../middleware/auth' || arguments[0] === '../../middleware/auth') {
        return { isAuthenticated: (req, res, next) => next() };
    }
    if (arguments[0] === '../middleware/modules') {
        return { requireModule: () => (req, res, next) => next() };
    }
    return originalRequire.apply(this, arguments);
};

app.use((req, res, next) => {
    req.tenant = { id: 4 };
    req.user = { role: 'admin' };
    res.locals.session = { userId: 1 };
    res.locals.tenant = { id: 4, settings: { currency: 'PKR' } };
    res.locals.user = { role: 'admin' };
    next();
});

const router = require('./routes/hifz');
app.use(router);

app.use((err, req, res, next) => {
    console.error('Express caught error:', err);
    res.status(500).send(err.toString());
});

const server = app.listen(3002, async () => {
    try {
        const [enrolls] = await db.execute(`SELECT student_id FROM hifz_enrollment WHERE tenant_id = 4 LIMIT 1`);
        if(enrolls.length > 0) {
            const studentId = enrolls[0].student_id;
            console.log('Testing GET /hifz/student/' + studentId);
            const http = require('http');
            http.get('http://localhost:3002/hifz/student/' + studentId, (res) => {
                let data = '';
                res.on('data', chunk => data += chunk);
                res.on('end', () => {
                    console.log('Status:', res.statusCode);
                    if(res.statusCode === 500) console.log('Response:', data);
                    else console.log('Render successful (len: ' + data.length + ')');
                    process.exit(0);
                });
            });
        } else {
            console.log('No student found');
            process.exit(0);
        }
    } catch(e) {
        console.error(e);
        process.exit(1);
    }
});
