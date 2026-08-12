/**
 * Standalone OCR test script.
 * Run this directly on the server AFTER doing a scan from the browser.
 * It reads the exact same image the server received and calls Gemini directly.
 *
 * Usage: node test_ocr.js
 */

require("dotenv").config();
const fs = require("fs");
const path = require("path");
const { GoogleGenerativeAI } = require("@google/generative-ai");

const imagePath = path.join(__dirname, "public", "debug_scan.jpg");

if (!fs.existsSync(imagePath)) {
    console.error("ERROR: debug_scan.jpg not found!");
    console.error("Please do a scan from the browser first to generate the debug image.");
    process.exit(1);
}

const apiKey = process.env.GEMINI_API_KEY;
if (!apiKey) {
    console.error("ERROR: GEMINI_API_KEY is not set in environment!");
    process.exit(1);
}

console.log("API Key found:", apiKey.substring(0, 8) + "...");

const stat = fs.statSync(imagePath);
console.log("Image file size:", stat.size, "bytes");

const imageB64 = fs.readFileSync(imagePath).toString("base64");
console.log("Base64 length:", imageB64.length, "chars");
console.log("Calling Gemini...\n");

async function run() {
    const genAI = new GoogleGenerativeAI(apiKey);
    const model = genAI.getGenerativeModel({ model: "gemini-2.5-flash" });

    const imagePart = {
        inlineData: {
            data: imageB64,
            mimeType: "image/jpeg"
        }
    };

    const prompt = `You are a strict data extraction AI. You MUST extract the requested fields from the provided image.
Even if the image is blurry, cropped, or handwriting is messy, do your absolute best to transcribe it.
Return ONLY a valid JSON object with EXACTLY these keys.
Do NOT include markdown formatting.

Required keys:
"name": (Student full name)
"father_name": (Father name)
"father_phone": (Phone number)
"emergency_contact": (Emergency contact)
"date_of_birth": (YYYY-MM-DD)
"address": (Address)
"gender": (Male/Female/Other)
"blood_group": (e.g. O+)
"previous_school_info": (Previous school)

If a field is not present, use empty string. Fill as many fields as possible.`;

    try {
        const result = await model.generateContent([prompt, imagePart]);
        const responseText = result.response.text();
        console.log("=== GEMINI RESPONSE ===");
        console.log(responseText);
        console.log("======================");
    } catch (err) {
        console.error("Gemini API Error:", err.message);
    }
}

run();
