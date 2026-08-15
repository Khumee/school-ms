const express = require('express');
const router = express.Router();
const db = require('../db');
const bcrypt = require('bcryptjs');
const { hasPermission } = require('../middleware/auth');

// GET /settings/users - List Users
router.get('/settings/users', hasPermission('Settings'), async (req, res) => {
    try {
        const [users] = await db.execute(`
            SELECT u.*, r.name as role_name 
            FROM users u 
            LEFT JOIN roles r ON u.role_id = r.id 
            WHERE u.tenant_id = ?
            ORDER BY u.username ASC
        `, [req.tenant.id]);
        
        const [roles] = await db.execute('SELECT * FROM roles WHERE tenant_id = ? ORDER BY name ASC', [req.tenant.id]);
        const [employees] = await db.execute('SELECT id, name, designation FROM employees WHERE tenant_id = ? ORDER BY name ASC', [req.tenant.id]);
        
        res.render('settings_users', { users, roles, employees, error: null, success: req.query.success });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading users.');
    }
});

// POST /settings/users/add - Add User
router.post('/settings/users/add', hasPermission('Settings'), async (req, res) => {
    const { username, password, role_id, employee_id } = req.body;
    try {
        // Check if username exists in tenant
        const [existing] = await db.execute('SELECT id FROM users WHERE username = ? AND tenant_id = ?', [username, req.tenant.id]);
        if (existing.length > 0) {
            return res.redirect('/settings/users?error=Username already exists');
        }
        
        const hashedPwd = await bcrypt.hash(password, 10);
        
        const [result] = await db.execute(
            'INSERT INTO users (username, password, role_id, tenant_id) VALUES (?, ?, ?, ?)',
            [username, hashedPwd, role_id || null, req.tenant.id]
        );
        const userId = result.insertId;
        
        // Link to employee if selected
        if (employee_id) {
            await db.execute('UPDATE employees SET user_id = ? WHERE id = ? AND tenant_id = ?', [userId, employee_id, req.tenant.id]);
        }
        
        res.redirect('/settings/users?success=User added successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding user.');
    }
});

// POST /settings/users/edit/:id - Edit User
router.post('/settings/users/edit/:id', hasPermission('Settings'), async (req, res) => {
    const { username, password, role_id, employee_id } = req.body;
    const userId = req.params.id;
    const conn = await db.getConnection();
    
    try {
        await conn.beginTransaction();
        
        if (password && password.trim() !== '') {
            const hashedPwd = await bcrypt.hash(password, 10);
            await conn.execute(
                'UPDATE users SET username = ?, password = ?, role_id = ? WHERE id = ? AND tenant_id = ?',
                [username, hashedPwd, role_id || null, userId, req.tenant.id]
            );
        } else {
            await conn.execute(
                'UPDATE users SET username = ?, role_id = ? WHERE id = ? AND tenant_id = ?',
                [username, role_id || null, userId, req.tenant.id]
            );
        }
        
        // Clear previous employee linkage
        await conn.execute('UPDATE employees SET user_id = NULL WHERE user_id = ? AND tenant_id = ?', [userId, req.tenant.id]);
        
        // Link to new employee if selected
        if (employee_id) {
            await conn.execute('UPDATE employees SET user_id = ? WHERE id = ? AND tenant_id = ?', [userId, employee_id, req.tenant.id]);
        }
        
        await conn.commit();
        res.redirect('/settings/users?success=User updated successfully');
    } catch (err) {
        await conn.rollback();
        console.error(err);
        res.status(500).send('Error updating user.');
    } finally {
        conn.release();
    }
});

// POST /settings/users/delete/:id - Delete User
router.post('/settings/users/delete/:id', hasPermission('Settings'), async (req, res) => {
    try {
        // Prevent deleting the last Admin (optional validation could be added)
        await db.execute('DELETE FROM users WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect('/settings/users?success=User deleted successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting user.');
    }
});

module.exports = router;
