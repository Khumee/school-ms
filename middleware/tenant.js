const db = require('../db');

module.exports = async (req, res, next) => {
    try {
        const host = req.hostname;
        
        // 1. Identify Super-Admin Host
        if (host.startsWith('admin') || host === 'admin.localhost') {
            req.isSuperAdminSite = true;
            if (req.path === '/' || req.path === '/login') {
                return res.redirect('/admin/login');
            }
            return next();
        }

        let tenant = null;
        const subdomain = host.split('.')[0];

        // 2. Localhost fallback
        if (host === 'localhost' || host === '127.0.0.1') {
            const fallbackSubdomain = process.env.DEFAULT_TENANT_SUBDOMAIN || 'muhaimin';
            const [tenants] = await db.pool.execute(
                'SELECT * FROM tenants WHERE subdomain = ? LIMIT 1',
                [fallbackSubdomain]
            );
            if (tenants.length > 0) {
                tenant = tenants[0];
            }
        } else {
            // 3. Lookup by domain / subdomain
            const [tenants] = await db.pool.execute(
                'SELECT * FROM tenants WHERE custom_domain = ? OR subdomain = ? LIMIT 1',
                [host, subdomain]
            );
            if (tenants.length > 0) {
                tenant = tenants[0];
            }
        }

        if (!tenant) {
            return res.status(404).send('School Tenant Not Found. Please verify the URL.');
        }

        // 4. Status Check
        if (tenant.status === 'suspended') {
            return res.status(403).send('This school portal has been suspended. Please contact admin.');
        }

        // 5. Inject
        req.tenant = tenant;
        res.locals.tenant = tenant;

        // 6. Bind to AsyncLocalStorage context
        db.tenantContext.run({ tenantId: tenant.id }, () => {
            next();
        });
    } catch (err) {
        console.error('Tenant Middleware Error:', err);
        res.status(500).send('Internal Server Error (Tenant Context failed)');
    }
};
