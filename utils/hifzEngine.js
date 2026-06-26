/**
 * Hifz Engine — Business Logic
 * Phase detection, alarm computation, khatam date prediction, streak tracking.
 */

const TOTAL_QURAN_LINES = 6236; // approximate total lines in the Quran

// ============================================================
// Phase Detection (auto-computed from enrolled_date)
// ============================================================
const PHASES = [
    { key: 'early',             label: 'Early Memorization',   labelUr: 'ابتدائی حفظ',    minMonth: 0,  maxMonth: 6,  minLines: 10, maxLines: 16  },
    { key: 'mid',               label: 'Mid Memorization',     labelUr: 'درمیانی حفظ',    minMonth: 6,  maxMonth: 12, minLines: 16, maxLines: 24  },
    { key: 'advanced',          label: 'Advanced',             labelUr: 'اعلی درجہ',      minMonth: 12, maxMonth: 999, minLines: 24, maxLines: null },
];

/**
 * Returns the expected phase based on months since enrollment.
 * If student is in a waqaf/final_revision state, the stored phase takes priority.
 */
function detectPhase(enrolledDate) {
    const now = new Date();
    const enrolled = new Date(enrolledDate);
    const monthsElapsed = (now.getFullYear() - enrolled.getFullYear()) * 12 + (now.getMonth() - enrolled.getMonth());
    for (const phase of PHASES) {
        if (monthsElapsed >= phase.minMonth && monthsElapsed < phase.maxMonth) {
            return phase;
        }
    }
    return PHASES[PHASES.length - 1]; // default to advanced
}

function getPhaseByKey(key) {
    return PHASES.find(p => p.key === key) || PHASES[0];
}

// ============================================================
// Khatam Date Prediction
// ============================================================
function computeKhatamPrediction(totalLinesMemoized, avgLines30d) {
    if (!avgLines30d || avgLines30d <= 0) return null;
    const remaining = Math.max(0, TOTAL_QURAN_LINES - totalLinesMemoized);
    const daysNeeded = Math.ceil(remaining / avgLines30d);
    const predicted = new Date();
    predicted.setDate(predicted.getDate() + daysNeeded);
    return predicted.toISOString().split('T')[0]; // YYYY-MM-DD
}

// ============================================================
// Manzil Range Auto-Suggestion (rotating cycle)
// ============================================================
/**
 * Returns the suggested Manzil range for today, given completed paras and
 * the last manzil entry. Rotates through all completed paras in batches of ~3.
 * Flexible: if fewer than 3 paras completed, suggests what's available.
 */
function suggestManzilRange(completedParas, lastManzilTo) {
    if (!completedParas || completedParas.length === 0) return null;
    const total = completedParas.length;
    const batchSize = Math.min(3, total);
    const lastTo = lastManzilTo || 0;
    // Find the next starting point (rotate)
    let nextFrom = (lastTo % total) + 1;
    const fromPara = completedParas[nextFrom - 1];
    const toPara   = completedParas[Math.min(nextFrom - 1 + batchSize - 1, total - 1)];
    return { from: fromPara, to: toPara };
}

// ============================================================
// Alarm Computation
// ============================================================
const ALARM_RULES = [
    {
        key: 'lines_too_low',
        severity: 'warning',
        label: 'Lines Below Expected',
        labelUr: 'لائنیں متوقع سے کم',
        check: (entries, enrollment) => {
            const phase = getPhaseByKey(enrollment.current_phase);
            if (!phase.minLines) return false;
            const recent = entries.slice(0, 3).filter(e => !e.is_absent && e.sabaq_status === 'recited' && e.sabaq_lines !== null);
            if (recent.length < 3) return false;
            return recent.every(e => e.sabaq_lines < phase.minLines);
        }
    },
    {
        key: 'poor_quality',
        severity: 'warning',
        label: 'Consistently Weak Quality',
        labelUr: 'مسلسل کمزور معیار',
        check: (entries) => {
            const recent = entries.slice(0, 3).filter(e => !e.is_absent && e.sabaq_status === 'recited');
            if (recent.length < 3) return false;
            return recent.every(e => e.sabaq_quality === 'weak');
        }
    },
    {
        key: 'poor_tajweed',
        severity: 'critical',
        label: 'Persistent Tajweed Issues',
        labelUr: 'مسلسل تجوید کی غلطیاں',
        check: (entries, enrollment) => {
            if (!['early'].includes(enrollment.current_phase)) return false;
            const recent = entries.slice(0, 5).filter(e => !e.is_absent && e.sabaq_status === 'recited' && e.sabaq_tajweed);
            if (recent.length < 5) return false;
            return recent.every(e => ['poor', 'needs_work'].includes(e.sabaq_tajweed));
        }
    },
    {
        key: 'missed_days',
        severity: 'alert',
        label: 'Missed 3+ Days',
        labelUr: '3 یا زیادہ دن غیر حاضر',
        check: (entries, enrollment, holidays) => {
            // Check if last 3+ entries are all absent or missing
            const holidayDates = new Set((holidays || []).map(h => h.holiday_date?.toString().split('T')[0]));
            const recent = entries.slice(0, 5);
            let consecutiveMissed = 0;
            for (const e of recent) {
                const dateStr = e.entry_date?.toString().split('T')[0];
                if (holidayDates.has(dateStr)) continue; // skip holidays
                if (e.is_absent) consecutiveMissed++;
                else break;
            }
            return consecutiveMissed >= 3;
        }
    },
    {
        key: 'sabqi_skipped',
        severity: 'warning',
        label: 'Sabqi Not Recited (3 days)',
        labelUr: 'سبقی 3 دن سے نہیں سنا',
        check: (entries) => {
            const recent = entries.slice(0, 3).filter(e => !e.is_absent);
            if (recent.length < 3) return false;
            return recent.every(e => e.sabqi_status === 'not_recited');
        }
    },
    {
        key: 'stuck_in_para',
        severity: 'alert',
        label: 'Stuck in Same Para (30+ days)',
        labelUr: '30 دنوں سے ایک ہی پارے میں',
        check: (entries, enrollment) => {
            if (entries.length < 5) return false;
            const thirtyDaysAgo = new Date();
            thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
            const oldEntry = entries.find(e => new Date(e.entry_date) <= thirtyDaysAgo);
            if (!oldEntry) return false;
            return oldEntry.sabaq_para === enrollment.current_para;
        }
    },
];

/**
 * Returns list of active alarms for a student.
 * @param {Array} recentEntries - Diary entries, newest first
 * @param {Object} enrollment - hifz_enrollment row
 * @param {Array} holidays - hifz_school_holidays rows
 */
function computeAlarms(recentEntries, enrollment, holidays = []) {
    const alarms = [];
    for (const rule of ALARM_RULES) {
        try {
            if (rule.check(recentEntries, enrollment, holidays)) {
                alarms.push({
                    key: rule.key,
                    severity: rule.severity,
                    label: rule.label,
                    labelUr: rule.labelUr,
                });
            }
        } catch (e) {
            // rule check errors are silent
        }
    }
    return alarms;
}

// ============================================================
// Streak Computation
// ============================================================
/**
 * Computes current streak (consecutive days of good/excellent quality on Sabaq).
 */
function computeStreak(recentEntries) {
    let streak = 0;
    for (const e of recentEntries) {
        if (e.is_absent) break;
        if (e.sabaq_status === 'recited' && ['good', 'excellent'].includes(e.sabaq_quality)) {
            streak++;
        } else {
            break;
        }
    }
    return streak;
}

// ============================================================
// 30-Para Map
// ============================================================
/**
 * Returns a 30-element array with the status of each para.
 * @param {number} currentPara - student's current para
 * @param {Array} completions - hifz_para_completions rows
 */
function buildParaMap(currentPara, completions = []) {
    const completionMap = {};
    for (const c of completions) {
        completionMap[c.para_no] = c;
    }
    const map = [];
    for (let i = 1; i <= 30; i++) {
        if (completionMap[i]) {
            const comp = completionMap[i];
            map.push({ 
                para: i, 
                status: comp.test_result === 'pass' ? 'completed' : 'test-pending', 
                test: comp 
            });
        } else if (i === currentPara) {
            map.push({ para: i, status: 'in_progress', test: null });
        } else {
            map.push({ para: i, status: 'not_started', test: null });
        }
    }
    return map;
}

// ============================================================
// Waqaf Milestone Check
// ============================================================
/**
 * Returns the waqaf type if the student has reached a milestone and
 * there is no active waqaf period already in progress.
 */
function checkWaqafMilestone(currentPara, activeWaqaf) {
    if (activeWaqaf && activeWaqaf.status === 'active') return null; // already in waqaf
    const milestones = { 5: 'waqaf_5', 15: 'waqaf_15', 25: 'waqaf_25', 30: 'final_revision' };
    return milestones[currentPara] || null;
}

module.exports = {
    detectPhase,
    getPhaseByKey,
    computeKhatamPrediction,
    suggestManzilRange,
    computeAlarms,
    computeStreak,
    buildParaMap,
    checkWaqafMilestone,
    PHASES,
    TOTAL_QURAN_LINES,
};
