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
        if (req.session && req.session.userId && req.session.role === 'admin') {
            return next();
        }
        res.status(403).send('Unauthorized. Admin access required.');
    },
    isSuperAdmin: (req, res, next) => {
        if (req.session && req.session.masterAdminId) {
            return next();
        }
        res.redirect('/admin/login');
    }
};
