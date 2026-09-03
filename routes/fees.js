const express = require('express');
const router = express.Router();
const db = require('../db');
const { isAuthenticated } = require('../middleware/auth');
const { renderPdf, resolvePublicAsset } = require('../utils/pdfGenerator');
const { numberToWords } = require('../utils/numberToWords');

const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

// GET /fees - redirect to ledger
router.get('/fees', isAuthenticated, (req, res) => {
    res.redirect('/fees/ledger');
});

// GET /fees/concessions - list students & custom fees
router.get('/fees/concessions', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, search } = req.query;
        
        let queryStr = `
            SELECT s.*, c.name as class_name, c.default_monthly_fee, c.is_hifz_class 
            FROM students s 
            LEFT JOIN classes c ON s.class_id = c.id 
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);
        
        res.render('fees_concessions', { students, classes, classId, search });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading concessions.');
    }
});

// POST /fees/concessions/update - save concession overrides
router.post('/fees/concessions/update', isAuthenticated, async (req, res) => {
    const { student_id, custom_monthly_fee, has_concession, concession_notes, concession_reason } = req.body;
    try {
        await db.execute(
            `UPDATE students 
             SET custom_monthly_fee = ?, has_concession = ?, concession_notes = ?, concession_reason = ? 
             WHERE id = ? AND tenant_id = ?`,
            [
                (custom_monthly_fee !== undefined && custom_monthly_fee !== null && custom_monthly_fee !== '') ? parseFloat(custom_monthly_fee) : null,
                has_concession === '1' ? 1 : 0,
                concession_notes || null,
                concession_reason || null,
                student_id,
                req.tenant.id
            ]
        );
        res.redirect('/fees/concessions');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating concession.');
    }
});

// Helper to calculate YTD Top Defaulters
async function getTopDefaulters(tenantId, activeYear, limit = 10, offset = 0) {
    const currentMonthNum = new Date().getMonth() + 1;
    const currentYear = new Date().getFullYear();
    const elapsedMonths = activeYear < currentYear ? 12 : (activeYear === currentYear ? currentMonthNum : 0);
    
    const [students] = await db.execute(`
        SELECT s.id, s.reg_no, s.name, s.custom_monthly_fee, c.name as class_name, c.default_monthly_fee, c.is_hifz_class
        FROM students s
        LEFT JOIN classes c ON s.class_id = c.id
        WHERE s.tenant_id = ?
    `, [tenantId]);
    
    const [payments] = await db.execute(`
        SELECT student_id, SUM(amount_paid) as total_paid
        FROM fee_payments
        WHERE tenant_id = ? AND year = ?
        GROUP BY student_id
    `, [tenantId, activeYear]);
    
    const paymentMap = {};
    payments.forEach(p => paymentMap[p.student_id] = parseFloat(p.total_paid || 0));
    
    let defaulters = [];
    students.forEach(s => {
        const expectedMonthly = parseFloat(s.default_monthly_fee || 0) - parseFloat(s.custom_monthly_fee || 0);
        const totalExpected = expectedMonthly * elapsedMonths;
        const totalPaid = paymentMap[s.id] || 0;
        const due = totalExpected - totalPaid;
        
        if (due > 0) {
            defaulters.push({
                id: s.id,
                reg_no: s.reg_no,
                name: s.name,
                class_name: s.class_name || 'Unassigned',
                expectedFee: expectedMonthly, // To open payment modal with right standard fee
                default_monthly_fee: s.default_monthly_fee,
                custom_monthly_fee: s.custom_monthly_fee,
                due: due
            });
        }
    });
    
    defaulters.sort((a, b) => b.due - a.due);
    return defaulters.slice(offset, offset + limit);
}

// GET /fees/ledger - monthly payments matrix
router.get('/fees/ledger', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { classId, search, month, year } = req.query;
        
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);
        
        // Fetch classes for dropdown and defaults
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);

        if (classId === undefined) {
            const nursery = classes.find(c => c.name.toLowerCase().includes('nursery'));
            if (nursery) {
                classId = nursery.id.toString();
            }
        }
        
        let queryStr = `
            SELECT s.id, s.class_id, s.reg_no, s.name, s.custom_monthly_fee, s.has_concession, 
                   c.name as class_name, c.default_monthly_fee, c.is_hifz_class
            FROM students s
            LEFT JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        
        // Fetch all payments for the active year for these students
        const [payments] = await db.execute(
            'SELECT id, student_id, month, amount_paid, fine_amount, fine_waived, additional_fee, additional_fee_description FROM fee_payments WHERE tenant_id = ? AND year = ?',
            [tenantId, activeYear]
        );
        
        // Map payments for easy access: student_id -> { month: { id, amount_paid } }
        const paymentMap = {};
        payments.forEach(p => {
            if (!paymentMap[p.student_id]) {
                paymentMap[p.student_id] = {};
            }
            paymentMap[p.student_id][p.month] = {
                id: p.id,
                amount_paid: parseFloat(p.amount_paid),
                fine_amount: parseFloat(p.fine_amount || 0),
                fine_waived: p.fine_waived,
                additional_fee: parseFloat(p.additional_fee || 0),
                additional_fee_description: p.additional_fee_description || ''
            };
        });
        
        
        
        // Fetch recent payments for the default view
        const [recentPayments] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND fp.month >= 1 AND fp.month <= 12
             ORDER BY fp.payment_date DESC, fp.id DESC LIMIT 10`,
            [tenantId]
        );

        // Fetch initial top defaulters
        const topDefaulters = await getTopDefaulters(tenantId, activeYear, 10, 0);

        // Fetch active campaigns for the dropdown
        const [activeCampaigns] = await db.execute(
            'SELECT * FROM fee_campaigns WHERE tenant_id = ? AND year = ? AND is_active = TRUE ORDER BY created_at DESC',
            [tenantId, activeYear]
        );

        // Fetch all transactions that actually occurred in the active month (Cash Basis)
        const [cashflowTransactions] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND MONTH(fp.payment_date) = ? AND YEAR(fp.payment_date) = ?
             ORDER BY fp.payment_date DESC, fp.id DESC`,
            [tenantId, activeMonth, activeYear]
        );

        res.render('fees_ledger', { 
            students, 
            classes, 
            classId, 
            search, 
            paymentMap, 
            activeMonthNum: activeMonth, 
            activeYear: activeYear,
            recentPayments,
            topDefaulters,
            activeCampaigns,
            cashflowTransactions
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading fee ledger.');
    }
});

// GET /fees/other - Manage other fees
router.get('/fees/other', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { classId, search, year, view, campaign_id } = req.query;
        
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeView = view || 'activity';
        
        // Fetch classes for dropdown
        const [classes] = await db.execute('SELECT * FROM classes WHERE tenant_id = ? ORDER BY id ASC', [tenantId]);

        let queryStr = `
            SELECT s.id, s.class_id, s.reg_no, s.name, c.name as class_name
            FROM students s
            LEFT JOIN classes c ON s.class_id = c.id
            WHERE s.tenant_id = ?
        `;
        const params = [tenantId];
        
        if (classId) {
            queryStr += ' AND s.class_id = ?';
            params.push(classId);
        }
        if (search) {
            queryStr += ' AND (s.name LIKE ? OR s.reg_no LIKE ?)';
            params.push(`%${search}%`, `%${search}%`);
        }
        queryStr += ' ORDER BY s.reg_no ASC';
        
        const [students] = await db.execute(queryStr, params);
        
        // Fetch other fees (Exam, Paper, Event, etc.) for the active year
        let otherPaymentsQuery = `
             SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ? AND fp.year = ? AND (fp.additional_fee > 0 OR fp.additional_fee_description IS NOT NULL OR fp.month = 13)
        `;
        let otherPaymentsParams = [tenantId, activeYear];
        
        if (classId) {
            otherPaymentsQuery += ' AND s.class_id = ?';
            otherPaymentsParams.push(classId);
        }
        otherPaymentsQuery += ' ORDER BY fp.payment_date DESC, fp.id DESC';

        const [otherPayments] = await db.execute(otherPaymentsQuery, otherPaymentsParams);

        // Fetch campaigns for the year
        const [campaigns] = await db.execute(
            'SELECT * FROM fee_campaigns WHERE tenant_id = ? AND year = ? ORDER BY created_at DESC', 
            [tenantId, activeYear]
        );

        let activeCampaign = null;
        if (campaign_id) {
            activeCampaign = campaigns.find(c => c.id == campaign_id);
            if (activeCampaign && !activeCampaign.applicable_to_all) {
                // filter students by campaign rules
                // if it applies to specific class
                if (activeCampaign.class_id) {
                    students.splice(0, students.length, ...students.filter(s => s.class_id === activeCampaign.class_id));
                }
                
                // if not applicable_to_class_all, we'd check fee_campaign_students table
                if (!activeCampaign.applicable_to_class_all) {
                    const [campStudents] = await db.execute('SELECT student_id FROM fee_campaign_students WHERE campaign_id = ?', [activeCampaign.id]);
                    const validIds = new Set(campStudents.map(cs => cs.student_id));
                    students.splice(0, students.length, ...students.filter(s => validIds.has(s.id)));
                }
            }
        }

        res.render('fees_other', { 
            students, 
            classes, 
            classId, 
            search, 
            activeYear: activeYear,
            otherPayments,
            campaigns,
            activeView,
            activeCampaign
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error loading other fees.');
    }
});

// POST /fees/pay - record payment
router.post('/fees/pay', isAuthenticated, async (req, res) => {
    const { student_id, month, year, amount, fine_amount, fine_waived, additional_fee, additional_fee_description, redirect_url, payment_date } = req.body;
    try {
        const tenantId = req.tenant.id;
        const waived = fine_waived === 'on' || fine_waived === '1' ? 1 : 0;
        const fineVal = fine_amount ? parseFloat(fine_amount) : 0.00;
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const addFeeVal = additional_fee ? parseFloat(additional_fee) : 0.00;
        const payDate = payment_date ? new Date(payment_date) : new Date();
        
        if (amount === '' || amount === null) {
            // If completely empty, do nothing
        } else if (parseFloat(amount) === 0) {
            // If they explicitly send 0, they want to clear the main fee.
            // We should keep the record if there's an additional fee, otherwise delete.
            await db.execute(
                `DELETE FROM fee_payments WHERE student_id = ? AND month = ? AND year = ? AND tenant_id = ? AND (additional_fee IS NULL OR additional_fee = 0)`,
                [student_id, month, activeYear, tenantId]
            );
            await db.execute(
                `UPDATE fee_payments SET amount_paid = additional_fee, fine_amount = 0 WHERE student_id = ? AND month = ? AND year = ? AND tenant_id = ?`,
                [student_id, month, activeYear, tenantId]
            );
        } else {
            const campaignId = req.body.campaign_id ? parseInt(req.body.campaign_id) : null;
            await db.execute(
                `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description, campaign_id)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE
                     amount_paid = VALUES(amount_paid),
                     payment_date = VALUES(payment_date),
                     recorded_by = VALUES(recorded_by),
                     fine_amount = VALUES(fine_amount),
                     fine_waived = VALUES(fine_waived),
                     additional_fee = VALUES(additional_fee),
                     additional_fee_description = VALUES(additional_fee_description),
                     campaign_id = VALUES(campaign_id)`,
                [tenantId, student_id, month, activeYear, parseFloat(amount), payDate, req.session.userId, fineVal, waived, addFeeVal, additional_fee_description || null, campaignId]
            );
        }
        
        res.redirect(redirect_url || '/fees/ledger');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording fee payment.');
    }
});

// POST /fees/pay-other - record custom/one-off other fees (Exam, Paper, Event, etc.)
router.post('/fees/pay-other', isAuthenticated, async (req, res) => {
    const { student_id, month, year, fee_type, additional_fee_description, amount, payment_date, redirect_url } = req.body;
    try {
        const tenantId = req.tenant.id;
        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        let month_val = month ? parseInt(month) : 13;
        let year_val = parseInt(year) || new Date().getFullYear();
        let feeAmt = parseFloat(amount) || 0;
        let campaign_id = req.body.campaign_id ? parseInt(req.body.campaign_id) : null;
        let payDate = payment_date ? new Date(payment_date) : new Date();

        let desc = fee_type || 'Other Fee';
        if (fee_type === 'Custom' && additional_fee_description) {
            desc = additional_fee_description;
        } else if (additional_fee_description && fee_type !== 'Custom') {
            desc = `${fee_type} - ${additional_fee_description}`;
        }

        await db.execute(
            `INSERT INTO fee_payments (tenant_id, student_id, month, year, amount_paid, payment_date, recorded_by, fine_amount, fine_waived, additional_fee, additional_fee_description, campaign_id)
             VALUES (?, ?, ?, ?, ?, ?, ?, 0, 0, ?, ?, ?)
             ON DUPLICATE KEY UPDATE
                 amount_paid = amount_paid + VALUES(amount_paid),
                 additional_fee = additional_fee + VALUES(additional_fee),
                 additional_fee_description = IF(additional_fee_description IS NULL OR additional_fee_description = '', VALUES(additional_fee_description), CONCAT_WS(' | ', additional_fee_description, VALUES(additional_fee_description)))`,
            [tenantId, student_id, month_val, year_val, 0, payDate, req.session.userId, feeAmt, desc, campaign_id]
        );

        res.redirect(redirect_url || '/fees/other');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording other fee payment.');
    }
});

// POST /fees/pay-other/edit/:id - Edit an existing other fee
router.post('/fees/pay-other/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const paymentId = req.params.id;
        const { fee_type, additional_fee_description, amount, payment_date } = req.body;
        
        const desc = fee_type === 'Custom' ? additional_fee_description : fee_type;
        const feeAmt = parseFloat(amount) || 0;
        
        await db.execute(
            `UPDATE fee_payments SET amount_paid = ?, additional_fee_description = ?, payment_date = ? 
             WHERE id = ? AND tenant_id = ?`,
            [feeAmt, desc, payment_date, paymentId, tenantId]
        );
        
        res.redirect('/fees/other');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error editing other fee payment.');
    }
});

// POST /fees/campaigns - Create a fee campaign
router.post('/fees/campaigns', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        let { title, fee_type, default_amount, applicable_to_all, class_id, applicable_to_class_all, year, month } = req.body;
        
        const isAll = applicable_to_all === 'true' || applicable_to_all === '1' || applicable_to_all === 'on';
        const isClassAll = applicable_to_class_all === 'true' || applicable_to_class_all === '1' || applicable_to_class_all === 'on';
        const cid = (!isAll && class_id) ? parseInt(class_id) : null;
        
        await db.execute(
            `INSERT INTO fee_campaigns 
             (tenant_id, title, fee_type, default_amount, applicable_to_all, class_id, applicable_to_class_all, year, month)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [tenantId, title, fee_type || title, parseFloat(default_amount) || 0, isAll, cid, isClassAll, parseInt(year), parseInt(month) || 13]
        );
        
        res.redirect('/fees/other');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error creating fee campaign.');
    }
});

// POST /fees/campaigns/:id/edit - Edit campaign details
router.post('/fees/campaigns/:id/edit', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const campaignId = req.params.id;
        const { title, fee_type, default_amount } = req.body;
        
        await db.execute(
            `UPDATE fee_campaigns 
             SET title = ?, fee_type = ?, default_amount = ? 
             WHERE id = ? AND tenant_id = ?`,
            [title, fee_type, parseFloat(default_amount) || 0, campaignId, tenantId]
        );
        
        res.redirect('/fees/other?view=campaigns');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error updating campaign.');
    }
});

// POST /fees/campaigns/:id/toggle - Toggle active status of a fee campaign
router.post('/fees/campaigns/:id/toggle', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const campaignId = req.params.id;
        
        await db.execute(
            `UPDATE fee_campaigns SET is_active = NOT is_active WHERE id = ? AND tenant_id = ?`,
            [campaignId, tenantId]
        );
        
        res.redirect('/fees/other?view=campaigns');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error toggling campaign status.');
    }
});

// POST /fees/campaigns/:id/pay/:studentId - Quick pay campaign fee
router.post('/fees/campaigns/:id/pay/:studentId', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const campaignId = req.params.id;
        const studentId = req.params.studentId;
        
        // Fetch campaign details
        const [[campaign]] = await db.execute('SELECT * FROM fee_campaigns WHERE id = ? AND tenant_id = ?', [campaignId, tenantId]);
        if (!campaign) return res.status(404).send('Campaign not found.');
        
        // Insert payment using a distinct pseudo-month to bypass unique constraint across different campaigns
        const pseudoMonth = 13 + parseInt(campaignId);
        await db.execute(
            `INSERT IGNORE INTO fee_payments 
             (tenant_id, student_id, month, year, amount_paid, additional_fee_description, payment_date, recorded_by, campaign_id)
             VALUES (?, ?, ?, ?, ?, ?, CURDATE(), ?, ?)`,
            [tenantId, studentId, pseudoMonth, campaign.year, campaign.default_amount, campaign.fee_type, req.session.userId, campaignId]
        );
        
        res.redirect(req.get('Referrer') || `/fees/other?view=campaigns&campaign_id=${campaignId}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error recording campaign payment: ' + err.message);
    }
});

// POST /fees/campaigns/:id/unpay/:studentId - Quick unpay campaign fee (delete payment)
router.post('/fees/campaigns/:id/unpay/:studentId', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const campaignId = req.params.id;
        const studentId = req.params.studentId;
        
        await db.execute(
            'DELETE FROM fee_payments WHERE tenant_id = ? AND campaign_id = ? AND student_id = ?',
            [tenantId, campaignId, studentId]
        );
        
        res.redirect(req.get('Referrer') || `/fees/other?view=campaigns&campaign_id=${campaignId}`);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting campaign payment.');
    }
});

// GET /fees/student-history/:id - fetch JSON history for a student
router.get('/fees/student-history/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [payments] = await db.execute(
            `SELECT fp.*, u.username as recorded_by_user 
             FROM fee_payments fp
             LEFT JOIN users u ON fp.recorded_by = u.id
             WHERE fp.student_id = ? AND fp.tenant_id = ?
             ORDER BY fp.year DESC, fp.month DESC`,
            [req.params.id, tenantId]
        );
        res.json({ success: true, payments });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load history.' });
    }
});

// GET /fees/receipt/:id - generate PDF receipt for a fee payment
router.get('/fees/receipt/:id', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const [rows] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, s.has_concession, s.custom_monthly_fee, c.name as class_name, c.default_monthly_fee, c.is_hifz_class
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.id = ? AND fp.tenant_id = ?`,
            [req.params.id, tenantId]
        );
        if (rows.length === 0) return res.status(404).send('Fee payment not found.');
        const payment = rows[0];

        // Fetch last 5 payments for this student
        const [lastFivePayments] = await db.execute(
            `SELECT fp.*, u.username as recorded_by_user
             FROM fee_payments fp
             LEFT JOIN users u ON fp.recorded_by = u.id
             WHERE fp.student_id = ? AND fp.tenant_id = ? AND fp.id != ?
             ORDER BY fp.year DESC, fp.month DESC LIMIT 5`,
            [payment.student_id, tenantId, payment.id]
        );

        const tenantForPdf = { ...req.tenant, logo_url: resolvePublicAsset(req.tenant.logo_url) };

        const standardFee = parseFloat(payment.default_monthly_fee || 0);
        const customFee = payment.custom_monthly_fee !== null ? parseFloat(payment.custom_monthly_fee) : standardFee;
        const concession = Math.max(0, standardFee - customFee);

        let monthLabel = 'Monthly Fee';
        if (payment.month === 0) {
            monthLabel = 'Admission Fee';
        } else if (payment.additional_fee_description) {
            monthLabel = payment.additional_fee_description;
        } else if (payment.month >= 1 && payment.month <= 12) {
            monthLabel = MONTH_NAMES[payment.month - 1];
        }

        const totalAmtPaid = parseFloat(payment.amount_paid) > 0 ? parseFloat(payment.amount_paid) : parseFloat(payment.additional_fee || 0);

        let isRegularFee = (payment.month >= 1 && payment.month <= 12);

        renderPdf(res, {
            templateName: 'fee_receipt',
            data: {
                tenant: tenantForPdf,
                student: { name: payment.student_name, reg_no: payment.reg_no, has_concession: payment.has_concession },
                className: payment.class_name,
                month: payment.month,
                monthName: monthLabel,
                year: payment.year,
                amount: totalAmtPaid,
                fineAmount: payment.fine_amount || 0,
                fineWaived: payment.fine_waived === 1,
                standardFee,
                concession,
                receiptId: payment.id,
                paymentDate: new Date(payment.payment_date).toLocaleDateString('en-GB'),
                lastFivePayments,
                MONTH_NAMES,
                isRegularFee
            },
            fileBaseName: `fee_receipt_${payment.id}`,
            downloadName: `fee-receipt-${payment.reg_no}-${payment.month === 0 ? 'AdmissionFee' : (payment.additional_fee_description || MONTH_NAMES[payment.month - 1] || 'OtherFee')}-${payment.year}.pdf`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error generating fee receipt.');
    }
});

// GET /fees/challans/print - generate bulk PDF fee challans for a class (3 students per page)
router.get('/fees/challans/print', isAuthenticated, async (req, res) => {
    try {
        const tenantId = req.tenant.id;
        const { classId, month, year, issueDate, dueDate, lateFine, lateFeeType, arrearsStartMonth } = req.query;

        const activeYear = year ? parseInt(year) : new Date().getFullYear();
        const activeMonth = month ? parseInt(month) : (new Date().getMonth() + 1);

        if (!classId) {
            return res.status(400).send('Please select a class to print challans.');
        }

        // Fetch class info
        const [[classData]] = await db.execute(
            'SELECT * FROM classes WHERE id = ? AND tenant_id = ?',
            [classId, tenantId]
        );

        if (!classData) {
            return res.status(404).send('Selected class not found.');
        }

        // Fetch active students in this class
        const [students] = await db.execute(
            `SELECT s.id, s.reg_no, s.name, s.father_name, s.custom_monthly_fee, s.has_concession, s.date_of_admission, s.created_at,
                    c.name as class_name, c.default_monthly_fee
             FROM students s
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE s.tenant_id = ? AND s.class_id = ? AND (s.status = 'active' OR s.status IS NULL)
             ORDER BY s.reg_no ASC, s.name ASC`,
            [tenantId, classId]
        );

        if (students.length === 0) {
            return res.status(404).send('No active students found in this class.');
        }

        // Format dates
        const issueObj = issueDate ? new Date(issueDate) : new Date();
        const formattedIssueDate = issueObj.toLocaleDateString('en-GB');

        let dueObj = dueDate ? new Date(dueDate) : null;
        if (!dueObj) {
            dueObj = new Date(activeYear, activeMonth - 1, req.tenant.fine_start_days || 10);
        }
        const formattedDueDate = dueObj.toLocaleDateString('en-GB');
        const monthsShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        const dueDayStr = String(dueObj.getDate()).padStart(2, '0');
        const dueDateDisplay = `${dueDayStr} ${monthsShort[dueObj.getMonth()]} ${dueObj.getFullYear()}`;

        // Dynamic Late Fine calculation and notice formatting
        const fineType = req.tenant.default_late_fee_type || 'fixed';
        let lateFineVal = 0;
        if (fineType === 'per_day') {
            lateFineVal = parseFloat(req.tenant.fine_amount_per_day || 20);
        } else {
            lateFineVal = parseFloat(req.tenant.fixed_late_fee_amount || 250);
        }

        let lateFineNotice = '';
        if (fineType === 'per_day') {
            lateFineNotice = `A late fine of Rs. ${lateFineVal.toLocaleString()} per day applies after this date.`;
        } else {
            lateFineNotice = `A late fine of Rs. ${lateFineVal.toLocaleString()} applies after this date.`;
        }

        // Determine starting month for arrears calculation
        let arrearsStart = 0;
        if (arrearsStartMonth !== undefined && arrearsStartMonth !== null && arrearsStartMonth !== '') {
            arrearsStart = parseInt(arrearsStartMonth);
        } else {
            const isOverdueEnabled = req.tenant.include_overdue_in_challans !== 0;
            arrearsStart = isOverdueEnabled ? (req.tenant.fee_start_month || 8) : 0;
        }

        // Fetch all previous payments for activeYear for students in this class
        const [previousPayments] = await db.execute(
            `SELECT student_id, month, SUM(amount_paid) as total_paid
             FROM fee_payments
             WHERE tenant_id = ? AND year = ? AND month < ? AND month >= 1 AND month <= 12
             GROUP BY student_id, month`,
            [tenantId, activeYear, activeMonth]
        );

        const prevPaymentMap = {};
        previousPayments.forEach(p => {
            if (!prevPaymentMap[p.student_id]) prevPaymentMap[p.student_id] = {};
            prevPaymentMap[p.student_id][p.month] = parseFloat(p.total_paid || 0);
        });

        // Process student fees, previous arrears, and amount in words
        const formattedStudents = [];
        for (const s of students) {
            const defaultFee = parseFloat(s.default_monthly_fee || 0);
            const customFee = s.custom_monthly_fee !== null && s.custom_monthly_fee !== undefined ? parseFloat(s.custom_monthly_fee) : defaultFee;
            const tuitionFee = customFee;

            // Determine effective start month for this student based on admission or system start
            let studentStartMonth = arrearsStart;
            if (s.date_of_admission) {
                const admDate = new Date(s.date_of_admission);
                const admYear = admDate.getFullYear();
                const admMonth = admDate.getMonth() + 1;
                if (admYear === activeYear) {
                    studentStartMonth = Math.max(studentStartMonth, admMonth);
                } else if (admYear > activeYear) {
                    studentStartMonth = 99; // Admitted in future year
                }
            } else if (s.created_at) {
                const createDate = new Date(s.created_at);
                const createYear = createDate.getFullYear();
                const createMonth = createDate.getMonth() + 1;
                if (createYear === activeYear) {
                    studentStartMonth = Math.max(studentStartMonth, createMonth);
                }
            }

            // Compute previous unpaid dues / arrears from studentStartMonth to activeMonth - 1
            let previousDues = 0;
            const unpaidItems = [];
            if (arrearsStart > 0 && activeMonth > studentStartMonth) {
                for (let m = studentStartMonth; m < activeMonth; m++) {
                    const paidForMonth = (prevPaymentMap[s.id] && prevPaymentMap[s.id][m]) ? prevPaymentMap[s.id][m] : 0;
                    const dueForMonth = Math.max(0, tuitionFee - paidForMonth);
                    if (dueForMonth > 0) {
                        previousDues += dueForMonth;
                        unpaidItems.push({
                            monthNum: m,
                            monthName: MONTH_NAMES[m - 1],
                            shortName: MONTH_NAMES[m - 1].substring(0, 3),
                            due: dueForMonth
                        });
                    }
                }
            }

            const totalPayable = tuitionFee + previousDues;

            // Skip zero fee / full waiver students who have no balance to pay
            if (totalPayable <= 0) {
                continue;
            }

            formattedStudents.push({
                id: s.id,
                reg_no: s.reg_no,
                name: s.name,
                father_name: s.father_name || '',
                tuitionFee: tuitionFee,
                previousDues: previousDues,
                unpaidItems: unpaidItems,
                totalPayable: totalPayable,
                feeInWords: numberToWords(totalPayable)
            });
        }

        if (formattedStudents.length === 0) {
            return res.status(400).send('No students with payable fee found in this class (all students have 0 fee or full waiver).');
        }

        const tenantForPdf = {
            ...req.tenant,
            logo_url: resolvePublicAsset(req.tenant.logo_url)
        };

        const easypaisaLogo = resolvePublicAsset('/images/easypaisa.png');
        const jazzcashLogo = resolvePublicAsset('/images/jazzcash.png');
        const easypaisaNumber = req.tenant.easypaisa_number || req.tenant.fee_account_number || '';
        const jazzcashNumber = req.tenant.jazzcash_number || req.tenant.fee_account_number || '';

        renderPdf(res, {
            templateName: 'fee_challans',
            data: {
                tenant: tenantForPdf,
                className: classData.name,
                month: activeMonth,
                monthName: MONTH_NAMES[activeMonth - 1],
                year: activeYear,
                issueDate: formattedIssueDate,
                dueDate: formattedDueDate,
                dueDateDisplay: dueDateDisplay,
                lateFineAmount: lateFineVal,
                lateFineNotice: lateFineNotice,
                easypaisaLogo: easypaisaLogo,
                jazzcashLogo: jazzcashLogo,
                easypaisaNumber: easypaisaNumber,
                jazzcashNumber: jazzcashNumber,
                feeAccountNumber: req.tenant.fee_account_number || easypaisaNumber || '',
                brandColor: req.tenant.primary_color || '#1b2a47',
                students: formattedStudents
            },
            fileBaseName: `fee_challans_${classId}_${activeMonth}_${activeYear}_${Date.now()}`,
            downloadName: `Fee-Challans-${classData.name.replace(/\s+/g, '_')}-${MONTH_NAMES[activeMonth - 1]}-${activeYear}.pdf`
        });

    } catch (err) {
        console.error('Error generating class fee challans:', err);
        res.status(500).send('Error generating class fee challans.');
    }
});

// GET /fees/api/recent - paginated recent collections
router.get('/fees/api/recent', isAuthenticated, async (req, res) => {
    try {
        const offset = parseInt(req.query.offset) || 0;
        const [recentPayments] = await db.execute(
            `SELECT fp.*, s.name as student_name, s.reg_no, c.name as class_name
             FROM fee_payments fp
             JOIN students s ON fp.student_id = s.id
             LEFT JOIN classes c ON s.class_id = c.id
             WHERE fp.tenant_id = ?
             ORDER BY fp.payment_date DESC, fp.id DESC LIMIT 10 OFFSET ?`,
            [req.tenant.id, offset.toString()]
        );
        res.json({ success: true, data: recentPayments });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load recent payments.' });
    }
});

// GET /fees/api/defaulters - paginated YTD defaulters
router.get('/fees/api/defaulters', isAuthenticated, async (req, res) => {
    try {
        const offset = parseInt(req.query.offset) || 0;
        const activeYear = req.query.year ? parseInt(req.query.year) : new Date().getFullYear();
        const defaulters = await getTopDefaulters(req.tenant.id, activeYear, 10, offset);
        res.json({ success: true, data: defaulters });
    } catch (err) {
        console.error(err);
        res.status(500).json({ success: false, error: 'Failed to load defaulters.' });
    }
});

module.exports = router;
