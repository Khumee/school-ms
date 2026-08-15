const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { requireModule } = require('../middleware/modules');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');

// Block all donation routes if module is disabled for this tenant
router.use('/donations', requireModule('donations'));
router.use('/donors', requireModule('donations'));

const FUND_LABELS = { general: 'Member Account', trust: 'Trust Account', student_support: 'Student Sponsorship' };


// Removed monthKey function as we now use for_month directly

// GET /donations - modern overview (this month's activity + lapsed recurring donors + search donors)
router.get('/donations', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { searchDonor, memberFilter } = req.query;

        // Fetch all donors (filtered if searchDonor is provided)
        let donorsQuery = `
            SELECT d.*, 
                   (SELECT amount FROM donations WHERE donor_id = d.id AND tenant_id = ? ORDER BY date DESC, id DESC LIMIT 1) as last_donation_amount
            FROM donors d 
            WHERE d.tenant_id = ?
        `;
        const donorsParams = [tenantId, tenantId];
        if (searchDonor) {
            donorsQuery += ' AND (d.name LIKE ? OR d.referred_by LIKE ?)';
            donorsParams.push(`%${searchDonor}%`, `%${searchDonor}%`);
        }
        if (memberFilter === '1') {
            donorsQuery += ' AND d.monthly_commitment = 1';
        } else if (memberFilter === '0') {
            donorsQuery += ' AND d.monthly_commitment = 0';
        }
        donorsQuery += ' ORDER BY d.name ASC';
        const [donors] = await db.execute(donorsQuery, donorsParams);

        // Fetch donor_references for this tenant
        const [donorReferences] = await db.execute('SELECT * FROM donor_references WHERE tenant_id = ? ORDER BY name ASC', [tenantId]);

        // Fetch top 5 highest paying donors
        const [topDonors] = await db.execute(
            `SELECT d.id, d.name, COALESCE(SUM(dn.amount), 0) as total_amount 
             FROM donors d 
             JOIN donations dn ON d.id = dn.donor_id
             WHERE d.tenant_id = ? 
             GROUP BY d.id 
             ORDER BY total_amount DESC 
             LIMIT 5`,
            [tenantId]
        );

        const [allDonations] = await db.execute(
            `SELECT d.*, dn.name as donor_name, dn.contact_no, dn.referred_by
             FROM donations d
             JOIN donors dn ON d.donor_id = dn.id
             WHERE d.tenant_id = ?
             ORDER BY d.date DESC, d.id DESC`,
            [tenantId]
        );

        const now = new Date();
        const currentKey = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`;

        // Keep using date for financial cash flow this month
        const recentThisMonth = allDonations.filter(d => {
            const dn = new Date(d.date);
            return dn.getFullYear() === now.getFullYear() && dn.getMonth() === now.getMonth();
        });
        const thisMonthTotal = recentThisMonth.reduce((sum, d) => sum + parseFloat(d.amount), 0);
        const thisMonthDonorCount = new Set(recentThisMonth.map(d => d.donor_id)).size;

        // Build donor_id -> Set of month-keys they've donated in (across all history)
        const donorMonthSets = {};
        allDonations.forEach(d => {
            if (d.for_month) {
                if (!donorMonthSets[d.donor_id]) donorMonthSets[d.donor_id] = new Set();
                donorMonthSets[d.donor_id].add(d.for_month);
            }
        });

        const donorById = {};
        const [allDonorsForLookup] = await db.execute('SELECT * FROM donors WHERE tenant_id = ?', [tenantId]);
        allDonorsForLookup.forEach(d => { donorById[d.id] = d; });

        const lapsedDonors = allDonorsForLookup
            .filter(d => d.monthly_commitment == 1) // Only recurring donors
            .filter(d => {
                const months = donorMonthSets[d.id] || new Set();
                return !months.has(currentKey); // Missed this month
            })
            .map(d => {
                const lastDonation = allDonations.find(dn => String(dn.donor_id) === String(d.id));
                return {
                    donor: d,
                    lastDonationDate: lastDonation ? lastDonation.date : null,
                    lastDonationAmount: lastDonation ? lastDonation.amount : null
                };
            });

        const totalAllTime = allDonations.reduce((sum, d) => sum + parseFloat(d.amount), 0);
        const monthlyDonorsCount = allDonorsForLookup.filter(d => d.monthly_commitment).length;
        const totalDonationsCount = allDonations.length;

        res.render('donations', {
            donors,
            recentThisMonth: recentThisMonth.slice(0, 25),
            thisMonthTotal,
            thisMonthDonorCount,
            lapsedDonors,
            totalAllTime,
            totalDonorCount: allDonorsForLookup.length,
            monthlyDonorsCount,
            totalDonationsCount,
            fundLabels: FUND_LABELS,
            topDonors,
            donorReferences,
            searchDonor: searchDonor || '',
            memberFilter: memberFilter || ''
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading donations.');
    }
});

// GET /donations/directory - donor directory
router.get('/donations/directory', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { searchDonor, memberFilter } = req.query;

        // Fetch all donors (filtered if searchDonor is provided)
        let donorsQuery = `
            SELECT d.*, 
                   (SELECT amount FROM donations WHERE donor_id = d.id AND tenant_id = ? ORDER BY date DESC, id DESC LIMIT 1) as last_donation_amount
            FROM donors d 
            WHERE d.tenant_id = ?
        `;
        const donorsParams = [tenantId, tenantId];
        if (searchDonor) {
            donorsQuery += ' AND (d.name LIKE ? OR d.referred_by LIKE ?)';
            donorsParams.push(`%${searchDonor}%`, `%${searchDonor}%`);
        }
        if (memberFilter === '1') {
            donorsQuery += ' AND d.monthly_commitment = 1';
        } else if (memberFilter === '0') {
            donorsQuery += ' AND d.monthly_commitment = 0';
        }
        donorsQuery += ' ORDER BY d.name ASC';
        const [donors] = await db.execute(donorsQuery, donorsParams);

        // Fetch donor_references for this tenant
        const [donorReferences] = await db.execute('SELECT * FROM donor_references WHERE tenant_id = ? ORDER BY name ASC', [tenantId]);

        res.render('donations_directory', {
            donors,
            donorReferences,
            searchDonor: searchDonor || '',
            memberFilter: memberFilter || ''
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading donor directory.');
    }
});

// GET /donations/matrix - donor x month grid (full history view)
router.get('/donations/matrix', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { search, months, referred_by, min_amount } = req.query;
        
        // Ensure months is an array
        if (months && !Array.isArray(months)) {
            months = [months];
        }
        if (!months) months = [];
        
        // Fetch donorReferences for the dropdown
        const [donorReferences] = await db.execute('SELECT * FROM donor_references WHERE tenant_id = ? ORDER BY name ASC', [tenantId]);

        let donorQuery = 'SELECT * FROM donors WHERE tenant_id = ?';
        const params = [tenantId];

        if (search) {
            donorQuery += ' AND (name LIKE ? OR referred_by LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        if (referred_by) {
            donorQuery += ' AND referred_by = ?';
            params.push(referred_by);
        }
        donorQuery += ' ORDER BY name ASC';

        let [donors] = await db.execute(donorQuery, params);

        // Fetch monthly donations for 2026 (or parameterize year later)
        let donationsQuery = 'SELECT donor_id, MONTH(date) as month, SUM(amount) as total_amount FROM donations WHERE tenant_id = ? AND YEAR(date) = 2026';
        let donParams = [tenantId];
        
        if (months.length > 0) {
            const placeholders = months.map(() => '?').join(',');
            donationsQuery += ` AND MONTH(date) IN (${placeholders})`;
            donParams.push(...months);
        }
        
        donationsQuery += ' GROUP BY donor_id, MONTH(date)';
        
        const [donations] = await db.execute(donationsQuery, donParams);

        // Map donations: donor_id -> { month: amount }
        const donationMap = {};
        const donorTotals = {};
        donations.forEach(d => {
            if (!donationMap[d.donor_id]) {
                donationMap[d.donor_id] = {};
                donorTotals[d.donor_id] = 0;
            }
            donationMap[d.donor_id][d.month] = parseFloat(d.total_amount) || 0;
            donorTotals[d.donor_id] += parseFloat(d.total_amount) || 0;
        });
        
        // Filter by min_amount if provided
        if (min_amount) {
            const minAmt = parseFloat(min_amount);
            if (!isNaN(minAmt)) {
                donors = donors.filter(d => (donorTotals[d.id] || 0) > minAmt);
            }
        } else if (months.length > 0) {
            // If months are selected but no min_amount, still filter out donors who have 0 donations in these months
            donors = donors.filter(d => (donorTotals[d.id] || 0) > 0);
        }

        res.render('donations_matrix', { 
            donors, 
            search: search || '', 
            donationMap,
            donorReferences,
            selectedMonths: months,
            selectedReferredBy: referred_by || '',
            minAmount: min_amount || ''
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading donations matrix.');
    }
});

// POST /donations/donor/add - create donor
router.post('/donations/donor/add', isAuthenticated, async (req, res) => {
    const { name, contact_no, referred_by, monthly_commitment, monthly_commitment_amount, preferred_fund_category, preferred_payment_method, preferred_member } = req.body;
    try {
        const tenantId = req.tenant.id;
        const commitment = monthly_commitment === 'on' || monthly_commitment === '1' ? 1 : 0;
        const commitmentAmount = commitment && monthly_commitment_amount ? parseFloat(monthly_commitment_amount) : null;
        
        await db.execute(
            `INSERT INTO donors (name, contact_no, referred_by, monthly_commitment, monthly_commitment_amount, preferred_fund_category, preferred_payment_method, preferred_member, tenant_id) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [name, contact_no || null, referred_by || null, commitment, commitmentAmount, preferred_fund_category || 'general', preferred_payment_method || 'Online', preferred_member || null, tenantId]
        );
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding donor: ' + err.message);
    }
});

// POST /donations/donor/edit/:id - edit donor details
router.post('/donations/donor/edit/:id', isAuthenticated, async (req, res) => {
    const { name, contact_no, referred_by, monthly_commitment, monthly_commitment_amount, preferred_fund_category, preferred_payment_method, preferred_member } = req.body;
    try {
        const tenantId = req.tenant.id;
        const commitment = monthly_commitment === 'on' || monthly_commitment === '1' ? 1 : 0;
        const commitmentAmount = commitment && monthly_commitment_amount ? parseFloat(monthly_commitment_amount) : null;
        
        await db.execute(
            `UPDATE donors SET name = ?, contact_no = ?, referred_by = ?, monthly_commitment = ?, monthly_commitment_amount = ?, preferred_fund_category = ?, preferred_payment_method = ?, preferred_member = ? 
             WHERE id = ? AND tenant_id = ?`,
            [name, contact_no || null, referred_by || null, commitment, commitmentAmount, preferred_fund_category || 'general', preferred_payment_method || 'Online', preferred_member || null, req.params.id, tenantId]
        );
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating donor: ' + err.message);
    }
});

// POST /donations/donor/delete/:id - delete a donor
router.post('/donations/donor/delete/:id', isAuthenticated, async (req, res) => {
    try {
        await db.execute('DELETE FROM donors WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting donor: ' + err.message);
    }
});

// POST /donations/add - record donation payment
router.post('/donations/add', isAuthenticated, async (req, res) => {
    let { donor_id, amount, date, for_month, for_month_only, for_year_only, fund_category, payment_method, notes, direct_ref, donation_type } = req.body;
    
    if (!for_month && for_month_only && for_year_only) {
        for_month = `${for_year_only}-${for_month_only}`;
    }

    try {
        const tenantId = req.tenant.id;
        let finalNotes = notes || null;
        if (fund_category === 'general' && direct_ref) {
            finalNotes = `[Direct: ${direct_ref}]` + (notes ? ' ' + notes : '');
        }
        
        await db.execute(
            `INSERT INTO donations (tenant_id, donor_id, amount, date, for_month, fund_category, payment_method, notes, donation_type)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                tenantId, donor_id, parseFloat(amount), date || new Date(), for_month || null,
                fund_category || 'general', payment_method || 'Cash', finalNotes, donation_type || 'Sadqa'
            ]
        );
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding donation.');
    }
});

// POST /donations/edit/:id - update a donation record
router.post('/donations/edit/:id', isAuthenticated, async (req, res) => {
    let { amount, date, for_month, for_month_only, for_year_only, fund_category, payment_method, notes, direct_ref, donation_type } = req.body;
    
    if (!for_month && for_month_only && for_year_only) {
        for_month = `${for_year_only}-${for_month_only}`;
    }

    try {
        let finalNotes = notes || null;
        if (fund_category === 'general' && direct_ref) {
            finalNotes = `[Direct: ${direct_ref}]` + (notes ? ' ' + notes : '');
        }
        await db.execute(
            `UPDATE donations SET amount = ?, date = ?, for_month = ?, fund_category = ?, payment_method = ?, notes = ?, donation_type = ?
             WHERE id = ? AND tenant_id = ?`,
            [parseFloat(amount), date, for_month || null, fund_category || 'general', payment_method || 'Cash', finalNotes, donation_type || 'Sadqa', req.params.id, req.tenant.id]
        );
        res.redirect(req.body.redirect_to || '/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating donation.');
    }
});

// POST /donations/delete/:id - delete a donation record
router.post('/donations/delete/:id', isAuthenticated, async (req, res) => {
    try {
        await db.execute('DELETE FROM donations WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect(req.body.redirect_to || '/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting donation.');
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

        // Fetch last 5 donations for this donor starting from Jan 1, 2026
        const [recentDonations] = await db.execute(
            `SELECT id, amount, date FROM donations 
             WHERE donor_id = ? AND tenant_id = ? AND date >= '2026-01-01' 
             ORDER BY date DESC, id DESC LIMIT 5`,
            [donation.donor_id, tenantId]
        );

        // Fetch total donation for this donor starting from Jan 1, 2026
        const [[{ total_donated_2026 }]] = await db.execute(
            `SELECT COALESCE(SUM(amount), 0) as total_donated_2026 FROM donations 
             WHERE donor_id = ? AND tenant_id = ? AND date >= '2026-01-01'`,
            [donation.donor_id, tenantId]
        );

        const tenantForPdf = { ...req.tenant, logo_url: resolvePublicAsset(req.tenant.logo_url) };

        renderPdf(res, {
            templateName: 'donation_receipt',
            data: {
                tenant: tenantForPdf,
                donor: { name: donation.donor_name, contact_no: donation.contact_no, referred_by: donation.referred_by },
                donation,
                fundCategoryLabel: FUND_LABELS[donation.fund_category] || donation.fund_category,
                dateFormatted: new Date(donation.date).toLocaleDateString('en-GB'),
                recentDonations,
                total_donated_2026
            },
            fileBaseName: `donation_receipt_${donation.id}`,
            downloadName: `donation-receipt-${donation.donor_name}-${donation.id}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating donation receipt.');
    }
});

// POST /donations/references/add - add a reference name
router.post('/donations/references/add', isAuthenticated, async (req, res) => {
    try {
        const { name } = req.body;
        await db.execute('INSERT IGNORE INTO donor_references (tenant_id, name) VALUES (?, ?)', [req.tenant.id, name]);
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding reference.');
    }
});

// POST /donations/references/edit/:id - edit a reference name
router.post('/donations/references/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const { name } = req.body;
        await db.execute('UPDATE donor_references SET name = ? WHERE id = ? AND tenant_id = ?', [name, req.params.id, req.tenant.id]);
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating reference.');
    }
});

// POST /donations/references/delete/:id - delete a reference name
router.post('/donations/references/delete/:id', isAuthenticated, async (req, res) => {
    try {
        await db.execute('DELETE FROM donor_references WHERE id = ? AND tenant_id = ?', [req.params.id, req.tenant.id]);
        res.redirect('/donations');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting reference.');
    }
});

module.exports = router;
