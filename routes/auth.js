const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcryptjs');
const { isAuthenticated } = require('../middleware/auth');

// GET Login
router.get('/login', (req, res) => {
    res.render('login', { error: null });
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
                
                return req.session.save((err) => {
                    if (err) {
                        return res.render('login', { error: 'Session save error. Try again.' });
                    }
                    res.redirect('/');
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
