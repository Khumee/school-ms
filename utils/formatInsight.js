// Turns a raw Gemini strategy-insight text blob into structured sections
// (heading + paragraph/bullet/numbered blocks) so the CRM Strategy Advisor
// page can render it as readable cards instead of one plain-text wall.

const SECTION_META = {
    pricing: { label: 'Pricing / Costing Strategy', icon: 'bi-cash-coin', color: '#2563eb' },
    marketing: { label: 'Marketing Strategy', icon: 'bi-megaphone-fill', color: '#7c3aed' },
    patterns: { label: 'Key Patterns Observed', icon: 'bi-graph-up-arrow', color: '#0891b2' },
    actions: { label: 'Immediate Action Items', icon: 'bi-check2-square', color: '#16a34a' },
    _preamble: { label: 'Overview', icon: 'bi-info-circle', color: '#64748b' },
};

const HEADING_MATCHERS = [
    { key: 'pricing', re: /^\**\s*PRICING\s*\/\s*COSTING STRATEGY\s*\**$/i },
    { key: 'marketing', re: /^\**\s*MARKETING STRATEGY\s*\**$/i },
    { key: 'patterns', re: /^\**\s*KEY PATTERNS OBSERVED\s*\**$/i },
    { key: 'actions', re: /^\**\s*IMMEDIATE ACTION ITEMS\s*\**$/i },
];

function linesToBlocks(lines) {
    const blocks = [];
    let currentList = null;

    lines.forEach(line => {
        const bulletMatch = /^[-•]\s+(.*)/.exec(line);
        const numberedMatch = /^\d+[.)]\s+(.*)/.exec(line);

        if (bulletMatch) {
            if (!currentList || currentList.type !== 'ul') {
                currentList = { type: 'ul', items: [] };
                blocks.push(currentList);
            }
            currentList.items.push(bulletMatch[1]);
        } else if (numberedMatch) {
            if (!currentList || currentList.type !== 'ol') {
                currentList = { type: 'ol', items: [] };
                blocks.push(currentList);
            }
            currentList.items.push(numberedMatch[1]);
        } else {
            currentList = null;
            blocks.push({ type: 'p', text: line });
        }
    });

    return blocks;
}

function parseInsightText(text) {
    if (!text) return [];
    const lines = text.split('\n').map(l => l.trim());

    const rawSections = [];
    let current = null;

    lines.forEach(line => {
        const matched = HEADING_MATCHERS.find(h => h.re.test(line));
        if (matched) {
            current = { key: matched.key, lines: [] };
            rawSections.push(current);
            return;
        }
        if (!line) return;
        if (!current) {
            current = rawSections.find(s => s.key === '_preamble');
            if (!current) {
                current = { key: '_preamble', lines: [] };
                rawSections.unshift(current);
            }
        }
        current.lines.push(line);
    });

    return rawSections
        .filter(s => s.lines.length > 0)
        .map(s => ({
            ...(SECTION_META[s.key] || { label: s.key, icon: 'bi-file-text', color: '#64748b' }),
            blocks: linesToBlocks(s.lines),
        }));
}

module.exports = { parseInsightText };
