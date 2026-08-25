require('dotenv').config({ path: __dirname + '/../.env' });
const db = require('../db');

/**
 * Advanced Grid-Based Google Places Scraper
 * Uses Nearby Search and an expanding spiral algorithm to sweep cities block-by-block.
 */

const GOOGLE_API_KEY = process.env.GOOGLE_PLACES_API_KEY;
const MAX_MONTHLY_REQUESTS = 2000;
let apiRequestsMadeThisRun = 0;

const targetCities = [
    // Far North & KPK (Starting at the top of the country)
    "Swat", "Muzaffarabad", "Mirpur", "Mansehra", "Abbottabad", "Haripur",
    "Peshawar", "Mardan", "Swabi", "Nowshera", "Kohat", "Bannu", "Dera Ismail Khan", "Attock", "Wah Cantonment",

    // Northern/Central Punjab (Moving South down GT Road)
    "Jhelum", "Kharian", "Gujrat", "Gujranwala", "Kamoke", "Muridke", "Sheikhupura", "Lahore",
    "Sialkot", "Hafizabad", "Mandi Bahauddin", "Kasur", "Pattoki", "Okara", "Sahiwal",

    // Central/Western Punjab
    "Faisalabad", "Chiniot", "Sargodha", "Khushab", "Mianwali", "Bhakkar", "Jhang", "Toba Tek Singh", "Gojra",

    // Southern Punjab
    "Multan", "Khanewal", "Vehari", "Burewala", "Muzaffargarh", "Kot Addu", "Dera Ghazi Khan", "Layyah", "Rajanpur",
    "Bahawalpur", "Rahim Yar Khan", "Sadiqabad",

    // Sindh (North to South)
    "Kashmore", "Ghotki", "Sukkur", "Shikarpur", "Larkana", "Khairpur", "Dadu", "Nawabshah",
    "Hyderabad", "Tando Adam", "Tando Allahyar", "Mirpur Khas", "Thatta", "Badin", "Karachi",

    // Balochistan & Deep South
    "Hub", "Gwadar", "Quetta"
];

async function ensureTables(connection) {
    await connection.execute(`
        CREATE TABLE IF NOT EXISTS crm_scraper_logs (
            id INT AUTO_INCREMENT PRIMARY KEY,
            requests_made INT NOT NULL,
            month_year VARCHAR(7) NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
    `);

    await connection.execute(`
        CREATE TABLE IF NOT EXISTS crm_scraper_grid_state (
            city VARCHAR(100) PRIMARY KEY,
            center_lat DECIMAL(10, 8) NOT NULL,
            center_lng DECIMAL(11, 8) NOT NULL,
            spiral_index INT DEFAULT 0,
            max_radius INT DEFAULT 20000,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
    `);
}

async function apiRequest(url) {
    if (!GOOGLE_API_KEY) throw new Error("GOOGLE_PLACES_API_KEY is missing!");
    apiRequestsMadeThisRun++;
    const response = await fetch(url);
    const data = await response.json();
    if (data.status !== 'OK' && data.status !== 'ZERO_RESULTS') {
        console.error(`Google API Error: ${data.status} - ${data.error_message || ''}`);
    }
    return data;
}

// Generates an (x, y) grid offset for an expanding square spiral
function getSpiralOffset(n) {
    let x = 0, y = 0, dx = 0, dy = -1;
    for (let i = 0; i < n; i++) {
        if (x === y || (x < 0 && x === -y) || (x > 0 && x === 1 - y)) {
            let temp = dx;
            dx = -dy;
            dy = temp;
        }
        x += dx;
        y += dy;
    }
    return { x, y };
}

async function getCityCenter(city) {
    const query = `City of ${city}, Pakistan`;
    const url = `https://maps.googleapis.com/maps/api/place/textsearch/json?query=${encodeURIComponent(query)}&key=${GOOGLE_API_KEY}`;
    const data = await apiRequest(url);
    if (data.results && data.results.length > 0) {
        return data.results[0].geometry.location;
    }
    throw new Error(`Could not find coordinates for ${city}`);
}

async function fetchNearbyPlaces(lat, lng, pageToken = null) {
    let url = `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&radius=3000&keyword=${encodeURIComponent("School OR Academy")}&key=${GOOGLE_API_KEY}`;
    if (pageToken) {
        url += `&pagetoken=${pageToken}`;
        await new Promise(resolve => setTimeout(resolve, 2000));
    }
    return await apiRequest(url);
}

const puppeteer = require('puppeteer');

async function scrapePhoneWithPuppeteer(browser, placeId, lat, lng) {
    const url = `https://www.google.com/maps/search/?api=1&query=${lat},${lng}&query_place_id=${placeId}`;
    let page = null;
    try {
        page = await browser.newPage();
        
        // Block images/css for speed
        await page.setRequestInterception(true);
        page.on('request', (req) => {
            if(['image', 'stylesheet', 'font'].includes(req.resourceType())) {
                req.abort();
            } else {
                req.continue();
            }
        });
        
        await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 25000 });
        
        // Try finding the copy phone button first
        await page.waitForSelector('button[data-tooltip="Copy phone number"]', { timeout: 4000 }).catch(() => {});
        
        const phone = await page.evaluate(() => {
            const btn = document.querySelector('button[data-tooltip="Copy phone number"]');
            if (btn) return btn.getAttribute('aria-label').replace('Phone: ', '').trim();
            
            const telBtn = document.querySelector('button[data-item-id^="phone:tel:"]');
            if (telBtn) return telBtn.getAttribute('aria-label').replace('Phone: ', '').trim();
            
            return null;
        });
        
        return phone;
    } catch (err) {
        console.error("Puppeteer scraping error:", err.message);
        return null;
    } finally {
        if (page) await page.close();
    }
}

async function main() {
    console.log("Starting Grid-Based Google Places API Scraper (Hybrid Mode)...");
    if (!GOOGLE_API_KEY) {
        console.error("ERROR: GOOGLE_PLACES_API_KEY is missing from .env file!");
        process.exit(1);
    }

    const connection = await db.pool.getConnection();

    try {
        await ensureTables(connection);

        const today = new Date();
        const currentMonthYear = `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}`;

        const [[usageRow]] = await connection.execute(
            "SELECT SUM(requests_made) as total FROM crm_scraper_logs WHERE month_year = ?",
            [currentMonthYear]
        );
        const currentUsage = parseInt(usageRow.total || 0);
        console.log(`[API USAGE] ${currentUsage} / ${MAX_MONTHLY_REQUESTS} requests used this month (${currentMonthYear}).`);

        if (currentUsage >= MAX_MONTHLY_REQUESTS) {
            console.log("Monthly request limit reached. Aborting scrape to prevent overages.");
            return;
        }

        const start = new Date(new Date().getFullYear(), 0, 0);
        const diff = new Date() - start;
        const dayOfYear = Math.floor(diff / (1000 * 60 * 60 * 24));

        // Select exactly 1 city per day based on the day of the year
        const cityIndex = dayOfYear % targetCities.length;
        const citiesToScrapeToday = [targetCities[cityIndex]];

        console.log(`[Day ${dayOfYear}] Target City: ${citiesToScrapeToday[0]}`);

        let totalNewLeads = 0;
        let browser = null;
        
        try {
            browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox', '--disable-setuid-sandbox'] });
            console.log("Puppeteer browser launched successfully.");
        } catch (err) {
            console.error("Failed to launch Puppeteer browser:", err.message);
            process.exit(1);
        }

        for (const city of citiesToScrapeToday) {
            if (currentUsage + apiRequestsMadeThisRun >= MAX_MONTHLY_REQUESTS) break;

            console.log(`\n--- Processing Grid for: ${city} ---`);

            // 1. Get or create grid state
            let [[gridState]] = await connection.execute(
                "SELECT * FROM crm_scraper_grid_state WHERE city = ?",
                [city]
            );

            if (!gridState) {
                console.log(`First time searching ${city}. Fetching center coordinates...`);
                try {
                    const loc = await getCityCenter(city);
                    await connection.execute(
                        "INSERT INTO crm_scraper_grid_state (city, center_lat, center_lng, spiral_index, max_radius) VALUES (?, ?, ?, 0, 20000)",
                        [city, loc.lat, loc.lng]
                    );
                    gridState = { center_lat: loc.lat, center_lng: loc.lng, spiral_index: 0, max_radius: 20000 };
                } catch (e) {
                    console.error(e.message);
                    continue; // Skip city if we can't find its center
                }
            }

            // 2. Calculate the shifted search coordinates
            // 3km is roughly 0.027 degrees lat/lng in Pakistan
            const gridStepDegrees = 0.027;
            const offset = getSpiralOffset(gridState.spiral_index);
            const searchLat = parseFloat(gridState.center_lat) + (offset.y * gridStepDegrees);
            const searchLng = parseFloat(gridState.center_lng) + (offset.x * gridStepDegrees);

            // Calculate approximate distance from center to see if we exceeded max radius
            const distanceFromCenterMeters = Math.sqrt(offset.x * offset.x + offset.y * offset.y) * 3000;
            if (distanceFromCenterMeters > gridState.max_radius) {
                console.log(`Spiral exceeded max radius for ${city}. Resetting to center.`);
                gridState.spiral_index = 0;
            }

            console.log(`Searching at [lat: ${searchLat.toFixed(5)}, lng: ${searchLng.toFixed(5)}] (Spiral Index: ${gridState.spiral_index})`);

            let nextPageToken = null;
            let cityResults = [];

            do {
                if (currentUsage + apiRequestsMadeThisRun >= MAX_MONTHLY_REQUESTS) break;
                const apiData = await fetchNearbyPlaces(searchLat, searchLng, nextPageToken);

                if (apiData.results) cityResults.push(...apiData.results);
                nextPageToken = apiData.next_page_token;
            } while (nextPageToken);

            let validResultsCount = 0;
            for (const place of cityResults) {
                if (!place.name) continue;

                // NearbySearch respects keywords, but we still strictly double-check the name just in case
                const nameLower = place.name.toLowerCase();
                if (!nameLower.includes('school') && !nameLower.includes('academy')) continue;

                // Fetch Phone Number using Puppeteer
                let phone = "";
                try {
                    // Pass searchLat and searchLng or place.geometry.location if available
                    const lat = place.geometry?.location?.lat || searchLat;
                    const lng = place.geometry?.location?.lng || searchLng;
                    console.log(`Extracting phone via Puppeteer for: ${place.name}...`);
                    phone = await scrapePhoneWithPuppeteer(browser, place.place_id, lat, lng);
                } catch (e) {
                    console.error(`Error scraping phone for ${place.name}:`, e.message);
                }

                if (!phone) {
                    console.log(`[SKIPPED] ${place.name} (No Phone Number found via Puppeteer)`);
                    continue;
                }

                const address = place.vicinity || place.formatted_address || city;
                const sourceUrl = `https://maps.google.com/?q=place_id:${place.place_id}`;

                validResultsCount++;

                const [[existingScraped]] = await connection.execute(
                    "SELECT id FROM crm_scraped_leads WHERE school_name = ? AND city = ?",
                    [place.name, city]
                );
                const [[existingLead]] = await connection.execute(
                    "SELECT id FROM crm_leads WHERE school_name = ? AND city = ?",
                    [place.name, city]
                );

                if (!existingScraped && !existingLead) {
                    await connection.execute(`
                        INSERT INTO crm_scraped_leads (school_name, phone, address, city, source_url, search_term_used, status)
                        VALUES (?, ?, ?, ?, ?, ?, 'pending')
                    `, [
                        place.name, phone, address, city, sourceUrl, `Nearby Grid (Idx: ${gridState.spiral_index})`
                    ]);
                    console.log(`[ADDED] ${place.name} - ${phone}`);
                    totalNewLeads++;
                }
            }

            console.log(`Grid Step ${gridState.spiral_index} completed. Found ${validResultsCount} schools.`);

            // 3. Update spiral index for tomorrow
            await connection.execute(
                "UPDATE crm_scraper_grid_state SET spiral_index = spiral_index + 1 WHERE city = ?",
                [city]
            );
        } // end city loop

        if (browser) {
            await browser.close();
            console.log("Puppeteer browser closed.");
        }

        console.log(`\nScrape complete! Inserted ${totalNewLeads} new leads.`);

        if (apiRequestsMadeThisRun > 0) {
            await connection.execute(
                "INSERT INTO crm_scraper_logs (requests_made, month_year) VALUES (?, ?)",
                [apiRequestsMadeThisRun, currentMonthYear]
            );
        }

    } catch (err) {
        console.error("Error during scraping process:", err);
    } finally {
        connection.release();
    }
    process.exit(0);
}

main();
