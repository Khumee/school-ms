const express = require('express');
const router = express.Router();
const db = require('../db');
const { hasPermission } = require('../middleware/auth');

// GET /settings/roles - List Roles
router.get('/settings/roles', hasPermission('Settings'), async (req, res) => {
    try {
        const [roles] = await db.execute('SELECT * FROM roles WHERE tenant_id = ? ORDER BY name ASC', [req.tenant.id]);
        res.render('settings_roles', { roles, error: null, success: req.query.success });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading roles.');
    }
});

// POST /settings/roles/add - Add Role
router.post('/settings/roles/add', hasPermission('Settings'), async (req, res) => {
    const { name, permissions } = req.body;
    const conn = await db.getConnection();
    try {
        await conn.beginTransaction();
        
        // Create role
        const [result] = await conn.execute('INSERT INTO roles (name, tenant_id) VALUES (?, ?)', [name, req.tenant.id]);
        const roleId = result.insertId;
        
        // Add permissions
        if (permissions && permissions.length > 0) {
            const permsArray = Array.isArray(permissions) ? permissions : [permissions];
            for (let p of permsArray) {
                await conn.execute('INSERT INTO role_permissions (role_id, function_name, allowed, tenant_id) VALUES (?, ?, 1, ?)', [roleId, p, req.tenant.id]);
            }
        }
        
        await conn.commit();
        res.redirect('/settings/roles?success=Role added successfully');
    } catch (err) {
        await conn.rollback();
        console.error(err);
        res.status(500).send('Error adding role.');
    } finally {
        conn.release();
    }
});

// POST /settings/roles/edit/:id - Edit Role
router.post('/settings/roles/edit/:id', hasPermission('Settings'), async (req, res) => {
    const { name, permissions } = req.body;
    const roleId = req.params.id;
    const conn = await db.getConnection();
    
    try {
        await conn.beginTransaction();
        
        // Update name
        await conn.execute('UPDATE roles SET name = ? WHERE id = ? AND tenant_id = ?', [name, roleId, req.tenant.id]);
        
        // Clear old permissions
        await conn.execute('DELETE FROM role_permissions WHERE role_id = ? AND tenant_id = ?', [roleId, req.tenant.id]);
        
        // Insert new permissions
        if (permissions && permissions.length > 0) {
            const permsArray = Array.isArray(permissions) ? permissions : [permissions];
            for (let p of permsArray) {
                await conn.execute('INSERT INTO role_permissions (role_id, function_name, allowed, tenant_id) VALUES (?, ?, 1, ?)', [roleId, p, req.tenant.id]);
            }
        }
        
        await conn.commit();
        res.redirect('/settings/roles?success=Role updated successfully');
    } catch (err) {
        await conn.rollback();
        console.error(err);
        res.status(500).send('Error updating role.');
    } finally {
        conn.release();
    }
});

// POST /settings/roles/delete/:id - Delete Role
router.post('/settings/roles/delete/:id', hasPermission('Settings'), async (req, res) => {
    try {
        await db.execute('DELETE FROM roles WHERE id = ? AND tenant_id = ? AND name != "Admin"', [req.params.id, req.tenant.id]);
        res.redirect('/settings/roles?success=Role deleted successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting role.');
    }
});

// GET API for role permissions (used for editing)
router.get('/api/roles/:id/permissions', hasPermission('Settings'), async (req, res) => {
    try {
        const [perms] = await db.execute('SELECT function_name FROM role_permissions WHERE role_id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.json({ success: true, permissions: perms.map(p => p.function_name) });
    } catch (err) {
        console.error(err);
        res.json({ success: false, error: err.message });
    }
});

module.exports = router;
