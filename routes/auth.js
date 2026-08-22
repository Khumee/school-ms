const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcryptjs');
const { isAuthenticated } = require('../middleware/auth');

// GET Login
router.get('/login', (req, res) => {
    res.render('login', { error: null });
});

// GET Impersonate (accept token from Super Admin)
router.get('/impersonate', async (req, res) => {
    const { token } = req.query;
    if (!token) return res.status(400).send('Missing impersonation token');

    try {
        const [tokens] = await db.pool.execute(
            'SELECT * FROM impersonation_tokens WHERE token = ? AND tenant_id = ? AND created_at > (NOW() - INTERVAL 5 MINUTE)',
            [token, req.tenant.id]
        );

        if (tokens.length === 0) {
            return res.status(403).send('Invalid or expired impersonation token');
        }

        const impersonation = tokens[0];

        // Delete the token so it can only be used once
        await db.pool.execute('DELETE FROM impersonation_tokens WHERE id = ?', [impersonation.id]);

        // Fetch all permissions for Admin role for this tenant (or just grant all)
        // In OmniSchool, the 'Admin' role name is generally used. We will grant a virtual Admin session.
        req.session.userId = -1; // Virtual user
        req.session.roleId = -1;
        req.session.roleName = 'Admin';
        req.session.username = 'SuperAdmin_Impersonator';
        req.session.permissions = [
            'Dashboard', 'Students', 'Employees', 'Fees', 
            'Donations', 'Attendance', 'Ledgers', 'Hifz', 'Settings'
        ];

        return req.session.save((err) => {
            if (err) return res.status(500).send('Session save error');
            res.redirect('/');
        });
    } catch (err) {
        console.error('Impersonation Error:', err);
        res.status(500).send('Internal Server Error');
    }
});

// POST Login
router.post('/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const [users] = await db.execute(
            'SELECT u.*, r.name as role_name FROM users u LEFT JOIN roles r ON u.role_id = r.id WHERE u.username = ? AND u.tenant_id = ? LIMIT 1',
            [username ? username.trim() : '', req.tenant.id]
        );
        
        if (users.length > 0) {
            const user = users[0];
            const match = await bcrypt.compare(password, user.password);
            if (match) {
                // Fetch permissions
                const [perms] = await db.execute(
                    'SELECT function_name FROM role_permissions WHERE role_id = ? AND tenant_id = ? AND allowed = 1',
                    [user.role_id, req.tenant.id]
                );
                
                req.session.userId = user.id;
                req.session.roleId = user.role_id;
                req.session.roleName = user.role_name;
                req.session.username = user.username;
                req.session.permissions = perms.map(p => p.function_name);
                
                let redirectUrl = '/';
                if (user.role_name !== 'Admin' && !req.session.permissions.includes('Dashboard')) {
                    if (req.session.permissions.includes('Students')) redirectUrl = '/students';
                    else if (req.session.permissions.includes('Attendance')) redirectUrl = '/attendance/students';
                    else if (req.session.permissions.includes('Fees')) redirectUrl = '/fees/ledger';
                    else if (req.session.permissions.includes('Ledgers')) redirectUrl = '/expenses';
                    else if (req.session.permissions.includes('Employees')) redirectUrl = '/employees';
                    else redirectUrl = '/change-password'; // Fallback
                }

                return req.session.save((err) => {
                    if (err) {
                        return res.render('login', { error: 'Session save error. Try again.' });
                    }
                    res.redirect(redirectUrl);
                });
            }
        }
        res.render('login', { error: 'Invalid username or password.' });
    } catch (err) {
        console.error('Login Error:', err);
        res.render('login', { error: 'An internal error occurred.' });
    }
});

// GET Logout
router.get('/logout', (req, res) => {
    req.session.destroy(() => {
        res.redirect('/login');
    });
});

// GET Change Password
router.get('/change-password', isAuthenticated, (req, res) => {
    res.render('change_password', { error: null, success: null });
});

// POST Change Password
router.post('/change-password', isAuthenticated, async (req, res) => {
    const { currentPassword, newPassword, confirmPassword } = req.body;
    try {
        const [users] = await db.execute(
            'SELECT password FROM users WHERE id = ? AND tenant_id = ?',
            [req.session.userId, req.tenant.id]
        );
        const match = await bcrypt.compare(currentPassword, users[0].password);
        if (!match) {
            return res.render('change_password', { error: 'Current password incorrect.', success: null });
        }
        if (newPassword !== confirmPassword) {
            return res.render('change_password', { error: 'Passwords do not match.', success: null });
        }
        const hashed = await bcrypt.hash(newPassword, 10);
        await db.execute(
            'UPDATE users SET password = ? WHERE id = ? AND tenant_id = ?',
            [hashed, req.session.userId, req.tenant.id]
        );
        res.render('change_password', { error: null, success: 'Password updated successfully!' });
    } catch (err) {
        console.error(err);
        res.render('change_password', { error: 'Failed to update password.', success: null });
    }
});

module.exports = router;
