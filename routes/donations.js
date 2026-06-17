const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');

// GET /donations - donor grid & records
router.get('/donations', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { search } = req.query;
        
        let donorQuery = 'SELECT * FROM donors WHERE tenant_id = ?';
        const params = [tenantId];
        
        if (search) {
            donorQuery += ' AND (name LIKE ? OR referred_by LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        donorQuery += ' ORDER BY name ASC';
        
        const [donors] = await db.execute(donorQuery, params);
        
        // Fetch monthly donations for 2026
        const [donations] = await db.execute(
            'SELECT donor_id, MONTH(date) as month, SUM(amount) as total_amount FROM donations WHERE tenant_id = ? AND YEAR(date) = 2026 GROUP BY donor_id, MONTH(date)',
            [tenantId]
        );
        
        // Map donations: donor_id -> { month: amount }
        const donationMap = {};
        donations.forEach(d => {
            if (!donationMap[d.donor_id]) {
                donationMap[d.donor_id] = {};
            }
            donationMap[d.donor_id][d.month] = d.total_amount;
        });
        
        res.render('donations', { donors, search, donationMap });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading donations.');
    }
});

// POST /donations/donor/add - create donor
router.post('/donations/donor/add', isAuthenticated, async (req, res) => {
    const { name, contact_no, referred_by } = req.body;
    try {
        const tenantId = req.tenant.id;
        
        await db.execute(
            'INSERT INTO donors (name, contact_no, referred_by, tenant_id) VALUES (?, ?, ?, ?)',
            [name, contact_no || null, referred_by || null, tenantId]
        );
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding donor.');
    }
});

// POST /donations/add - record donation payment
router.post('/donations/add', isAuthenticated, async (req, res) => {
    const { donor_id, amount, date, fund_category, payment_method, notes } = req.body;
    try {
        const tenantId = req.tenant.id;
        
        await db.execute(
            `INSERT INTO donations (tenant_id, donor_id, amount, date, fund_category, payment_method, notes)
             VALUES (?, ?, ?, ?, ?, ?, ?)`,
            [
                tenantId, donor_id, parseFloat(amount), date || new Date(), 
                fund_category || 'general', payment_method || 'Cash', notes || null
            ]
        );
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding donation.');
    }
});

module.exports = router;
