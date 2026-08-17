module.exports = {
    isAuthenticated: (req, res, next) => {
        if (req.session && req.session.userId) {
            return next();
        }
        // For fetch/AJAX requests return JSON 401 instead of HTML redirect
        const isApiRequest = req.headers['accept'] === 'application/json' ||
                             req.headers['content-type'] === 'application/json' ||
                             req.xhr;
        if (isApiRequest) {
            return res.status(401).json({ error: 'Session expired. Please log in again.' });
        }
        res.redirect('/login');
    },
    isAdmin: (req, res, next) => {
        if (req.session && req.session.userId && req.session.roleName === 'Admin') {
            return next();
        }
        res.status(403).send('Unauthorized. Admin access required.');
    },
    hasPermission: (permission) => {
        return (req, res, next) => {
            if (req.session && req.session.userId) {
                const perms = req.session.permissions || [];
                if (req.session.roleName === 'Admin' || perms.includes(permission)) {
                    return next();
                }
            }
            res.status(403).send(`Unauthorized. Missing permission: ${permission}`);
        };
    },
    isSuperAdmin: (req, res, next) => {
        if (req.session && req.session.masterAdminId) {
            return next();
        }
        res.redirect('/admin/login');
    },
    isOnlySuperAdmin: (req, res, next) => {
        if (req.session && req.session.masterAdminId) {
            if (req.session.masterAdminRole === 'sales_rep') {
                return res.redirect('/admin/crm/leads');
            }
            return next();
        }
        res.redirect('/admin/login');
    }
};
