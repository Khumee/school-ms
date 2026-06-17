const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');
const ejs = require('ejs');

const scratchDir = path.join(__dirname, '..', 'scratch');

/**
 * Converts a server-relative public asset path (e.g. tenant.logo_url
 * stored as "/images/logos/x.png") into an absolute file:// URL so it
 * resolves correctly when the PDF template is rendered from a local
 * scratch HTML file rather than served over HTTP.
 */
function resolvePublicAsset(relPath) {
    if (!relPath) return null;
    const absPath = path.join(__dirname, '..', 'public', relPath.replace(/^\/+/, ''));
    if (!fs.existsSync(absPath)) return null;
    return 'file:///' + absPath.replace(/\\/g, '/');
}

/**
 * Renders an EJS template to HTML, converts it to a PDF via the shared
 * Playwright-based html_to_pdf.py script, streams it as a download, then
 * cleans up the scratch files. Mirrors the pattern used in madrassa-ms.
 */
function renderPdf(res, { templateName, data, fileBaseName, downloadName }) {
    const templatePath = path.join(__dirname, '..', 'views', 'pdf', `${templateName}.ejs`);

    ejs.renderFile(templatePath, data, (renderErr, html) => {
        if (renderErr) {
            console.error('[PDF Generator] Template render failed:', renderErr);
            return res.status(500).send('Error rendering PDF template.');
        }

        if (!fs.existsSync(scratchDir)) {
            fs.mkdirSync(scratchDir, { recursive: true });
        }

        const tempHtmlPath = path.join(scratchDir, `${fileBaseName}.html`);
        const tempPdfPath = path.join(scratchDir, `${fileBaseName}.pdf`);

        fs.writeFileSync(tempHtmlPath, html, 'utf8');

        const scriptPath = process.env.PDF_SCRIPT_PATH || path.join(__dirname, 'html_to_pdf.py');
        const pythonCmd = process.platform === 'win32' ? 'python' : 'python3';
        const cmd = `${pythonCmd} "${scriptPath}" -i "${tempHtmlPath}" -o "${tempPdfPath}" -w 1500`;

        console.log(`[PDF Generator] Compiling ${templateName} to PDF: ${cmd}`);

        exec(cmd, (error, stdout, stderr) => {
            if (error) {
                console.error(`[PDF Generator] Execution failed: ${error.message}`);
                console.error(`stderr: ${stderr}`);
                return res.status(500).send('PDF generation is not configured on this server yet. Please contact the administrator.');
            }

            res.download(tempPdfPath, downloadName, (err) => {
                try {
                    if (fs.existsSync(tempHtmlPath)) fs.unlinkSync(tempHtmlPath);
                    if (fs.existsSync(tempPdfPath)) fs.unlinkSync(tempPdfPath);
                } catch (cleanupErr) {
                    console.error('[PDF Generator] Cleanup failed:', cleanupErr);
                }
                if (err) console.error('[PDF Generator] Download error:', err);
            });
        });
    });
}

module.exports = { renderPdf, resolvePublicAsset };
