const express = require('express');
const session = require('express-session');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// View engine setup
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Serve static assets
app.use(express.static(path.join(__dirname, 'public')));

// Body parser
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Session setup
app.use(session({
    secret: process.env.SESSION_SECRET || 'school_secret_key_789',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 24 * 60 * 60 * 1000 } // 24 hours
}));

// Set layout locals
app.use((req, res, next) => {
    res.locals.session = req.session;
    next();
});

// Tenant Context Middleware
const tenantMiddleware = require('./middleware/tenant');
app.use(tenantMiddleware);

// Import Modular Entity Routers
const authRoutes = require('./routes/auth');
const dashboardRoutes = require('./routes/dashboard');
const studentRoutes = require('./routes/students');
const employeeRoutes = require('./routes/employees');
const feeRoutes = require('./routes/fees');
const donationRoutes = require('./routes/donations');
const attendanceRoutes = require('./routes/attendance');
const expenseRoutes = require('./routes/expenses');

// Register Routers
app.use(authRoutes);
app.use(dashboardRoutes);
app.use(studentRoutes);
app.use(employeeRoutes);
app.use(feeRoutes);
app.use(donationRoutes);
app.use(attendanceRoutes);
app.use(expenseRoutes);

app.listen(PORT, () => {
    console.log(`School Management Portal running on http://localhost:${PORT}`);
});
