module.exports = {
    isAuthenticated: (req, res, next) => {
        if (req.session && req.session.userId) {
            return next();
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
