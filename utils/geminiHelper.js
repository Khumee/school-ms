const { GoogleGenerativeAI } = require('@google/generative-ai');

// Global index to round-robin/distribute requests across configured keys
let currentKeyIndex = 0;

/**
 * Call Gemini API with automatic key rotation and detailed logging.
 * Configured via GEMINI_API_KEY in .env (can be a comma-separated list of keys).
 * Masks rate limit (429) errors with a user-friendly "server busy" message.
 */
async function generateGeminiContent(contents, options = {}) {
    const rawKeys = process.env.GEMINI_API_KEY || '';
    const apiKeys = rawKeys.split(',').map(k => k.trim()).filter(Boolean);

    if (apiKeys.length === 0) {
        console.error('[GeminiHelper] ERROR: No Gemini API keys configured in environment.');
        throw new Error('Gemini API key not configured in .env');
    }

    const modelName = options.model || 'gemini-2.5-flash';
    const generationConfig = options.generationConfig || {};

    let attempts = 0;
    const maxAttempts = apiKeys.length;
    
    console.log(`[GeminiHelper] Request initiated. Model: ${modelName}. Total keys available: ${apiKeys.length}. Starting with key index: ${currentKeyIndex}`);

    while (attempts < maxAttempts) {
        // Ensure index is within range
        const keyIdx = currentKeyIndex;
        const apiKey = apiKeys[keyIdx];
        
        // Mask the API key in logs for security
        const maskedKey = apiKey.length > 8 ? `${apiKey.substring(0, 4)}...${apiKey.substring(apiKey.length - 4)}` : 'invalid_key';

        try {
            console.log(`[GeminiHelper] Attempting request using key index ${keyIdx} (${maskedKey}) (Attempt ${attempts + 1}/${maxAttempts})`);
            
            const genAI = new GoogleGenerativeAI(apiKey);
            const model = genAI.getGenerativeModel({
                model: modelName,
                generationConfig: generationConfig
            });

            const result = await model.generateContent(contents);
            console.log(`[GeminiHelper] Request succeeded using key index ${keyIdx}`);
            
            // Success! Advance index slightly for next request to distribute load
            currentKeyIndex = (currentKeyIndex + 1) % apiKeys.length;
            
            return result;
        } catch (err) {
            const isRateLimit = err.status === 429 || 
                                (err.message && err.message.includes('429')) || 
                                (err.message && err.message.includes('Quota exceeded')) ||
                                (err.message && err.message.includes('Too Many Requests'));

            console.error(`[GeminiHelper] Request failed with key index ${keyIdx} (${maskedKey}). Error: ${err.message}`);

            if (isRateLimit) {
                if (apiKeys.length > 1 && attempts < maxAttempts - 1) {
                    // Move to the next key index
                    currentKeyIndex = (currentKeyIndex + 1) % apiKeys.length;
                    console.warn(`[GeminiHelper] Key index ${keyIdx} was rate-limited (429). Rotating index to ${currentKeyIndex} and retrying...`);
                    attempts++;
                    continue;
                } else {
                    console.error('[GeminiHelper] Rate limit reached and all available API keys have been exhausted.');
                    throw new Error('The server is busy processing other sheets right now. Please wait a minute and try again.');
                }
            } else {
                // For other errors (invalid key, bad request, etc.), throw immediately
                throw err;
            }
        }
    }

    throw new Error('The server is busy processing other sheets right now. Please wait a minute and try again.');
}

module.exports = { generateGeminiContent };
