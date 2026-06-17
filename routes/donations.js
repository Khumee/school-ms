const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

const FUND_LABELS = { general: 'General / Direct', trust: 'Trust Account', student_support: 'Student Sponsorship' };

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

// GET /donations/donor/:id - donor profile + full donation history
router.get('/donations/donor/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [donorRows] = await db.execute(
            'SELECT * FROM donors WHERE id = ? AND tenant_id = ?',
            [req.params.id, tenantId]
        );
        if (donorRows.length === 0) return res.status(404).send('Donor not found.');

        const [donations] = await db.execute(
            'SELECT * FROM donations WHERE donor_id = ? AND tenant_id = ? ORDER BY date DESC, id DESC',
            [req.params.id, tenantId]
        );

        const totalDonated = donations.reduce((sum, d) => sum + parseFloat(d.amount), 0);

        res.render('donor_view', { donor: donorRows[0], donations, totalDonated, fundLabels: FUND_LABELS });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading donor profile.');
    }
});

// GET /donations/receipt/:id - generate PDF receipt for a donation
router.get('/donations/receipt/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [rows] = await db.execute(
            `SELECT d.*, dn.name as donor_name, dn.contact_no, dn.referred_by
             FROM donations d
             JOIN donors dn ON d.donor_id = dn.id
             WHERE d.id = ? AND d.tenant_id = ?`,
            [req.params.id, tenantId]
        );
        if (rows.length === 0) return res.status(404).send('Donation not found.');
        const donation = rows[0];

        const tenantForPdf = { ...req.tenant, logo_url: resolvePublicAsset(req.tenant.logo_url) };

        renderPdf(res, {
            templateName: 'donation_receipt',
            data: {
                tenant: tenantForPdf,
                donor: { name: donation.donor_name, contact_no: donation.contact_no, referred_by: donation.referred_by },
                donation,
                fundCategoryLabel: FUND_LABELS[donation.fund_category] || donation.fund_category,
                dateFormatted: new Date(donation.date).toLocaleDateString('en-GB')
            },
            fileBaseName: `donation_receipt_${donation.id}`,
            downloadName: `donation-receipt-${donation.donor_name}-${donation.id}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating donation receipt.');
    }
});

module.exports = router;
