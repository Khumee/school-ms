/**
 * Module System — Route Guard Middleware
 * 
 * Usage in any optional module's route file (first line):
 *   const { requireModule } = require('../middleware/modules');
 *   router.use(requireModule('hifz'));
 *   router.use(requireModule('donations'));
 */

exports.requireModule = (moduleName) => (req, res, next) => {
    const flag = `enable_${moduleName}_module`;
    if (!req.tenant || !req.tenant[flag]) {
        return res.status(403).render('module_disabled', {
            moduleName: moduleName.charAt(0).toUpperCase() + moduleName.slice(1).replace(/_/g, ' '),
            pageTitle: 'Module Not Enabled'
        });
    }
    next();
};
