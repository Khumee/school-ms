require('dotenv').config({ path: __dirname + '/../.env' });
const db = require('../db');

/**
 * Live Google Places API Web Scraper / Lead Generator
 * Usage: node scripts/scraper.js
 * 
 * IMPORTANT: Requires GOOGLE_PLACES_API_KEY in the .env file.
 */

const GOOGLE_API_KEY = process.env.GOOGLE_PLACES_API_KEY;

// Comprehensive list of notable Pakistani cities
const targetCities = [
    // Punjab
    "Lahore", "Faisalabad", "Gujranwala", "Multan", "Bahawalpur", "Sargodha", "Sialkot", "Sheikhupura", 
    "Rahim Yar Khan", "Jhang", "Dera Ghazi Khan", "Gujrat", "Sahiwal", "Wah Cantonment", "Kasur", "Okara", 
    "Chiniot", "Kamoke", "Hafizabad", "Sadiqabad", "Burewala", "Vehari", "Muridke", "Jhelum", "Khanewal", 
    "Muzaffargarh", "Mandi Bahauddin", "Khushab", "Attock", "Bhakkar", "Kharian", "Mianwali", "Kot Addu", 
    "Layyah", "Rajanpur", "Pattoki", "Haroonabad", "Toba Tek Singh", "Shakargarh", "Samundri", "Gojra", "Murree", 
    // Sindh
    "Karachi", "Hyderabad", "Sukkur", "Larkana", "Nawabshah", "Mirpur Khas", "Jacobabad", "Shikarpur", 
    "Khairpur", "Dadu", "Tando Adam", "Tando Allahyar", "Umerkot", "Badin", "Ghotki", "Kashmore", "Thatta", 
    // KPK
    "Peshawar", "Mardan", "Mingora", "Kohat", "Abbottabad", "Dera Ismail Khan", "Nowshera", "Charsadda", 
    "Swabi", "Chitral", "Mansehra", "Bannu", "Timargara", "Karak", "Haripur", "Swat", 
    // Balochistan
    "Quetta", "Turbat", "Khuzdar", "Hub", "Chaman", "Gwadar", "Sibi", "Zhob", "Dera Murad Jamali", 
    // AJK & Gilgit
    "Muzaffarabad", "Mirpur", "Rawalakot", "Gilgit", "Skardu"
];

async function fetchGooglePlaces(query, pageToken = null) {
    if (!GOOGLE_API_KEY) {
        throw new Error("GOOGLE_PLACES_API_KEY is not set in the .env file!");
    }

    let url = `https://maps.googleapis.com/maps/api/place/textsearch/json?query=${encodeURIComponent(query)}&key=${GOOGLE_API_KEY}`;
    if (pageToken) {
        url += `&pagetoken=${pageToken}`;
        // Google requires a short delay before using a next_page_token
        await new Promise(resolve => setTimeout(resolve, 2000));
    }

    const response = await fetch(url);
    const data = await response.json();
    
    if (data.status !== 'OK' && data.status !== 'ZERO_RESULTS') {
        console.error(`Google API Error: ${data.status} - ${data.error_message || ''}`);
    }

    return data;
}

async function main() {
    console.log("Starting Live Google Places API Scraper...");
    if (!GOOGLE_API_KEY) {
        console.error("ERROR: GOOGLE_PLACES_API_KEY is missing from .env file!");
        console.log("Please add it and try again.");
        process.exit(1);
    }

    // Determine the rotating cities for today based on the day of the year
    const start = new Date(new Date().getFullYear(), 0, 0);
    const diff = new Date() - start;
    const oneDay = 1000 * 60 * 60 * 24;
    const dayOfYear = Math.floor(diff / oneDay);
    
    // Pick 5 cities from the rotation array based on day of year
    const CITIES_PER_DAY = 5;
    const rotationStartIndex = (dayOfYear * CITIES_PER_DAY) % targetCities.length;
    
    let rotatingCities = [];
    for (let i = 0; i < CITIES_PER_DAY; i++) {
        rotatingCities.push(targetCities[(rotationStartIndex + i) % targetCities.length]);
    }
    
    // Always include Rawalpindi and Islamabad, then add the rotating ones
    // Use a Set to ensure no duplicates if Rawalpindi happens to be in the rotating list
    const citiesToScrapeToday = [...new Set(["Rawalpindi", "Islamabad", ...rotatingCities])];
    
    console.log(`[Day ${dayOfYear}] Target Cities for Today: ${citiesToScrapeToday.join(', ')}`);

    const connection = await db.pool.getConnection();
    let totalNewLeads = 0;

    try {
        for (const city of citiesToScrapeToday) {
            const searchTerm = `School or Academy in ${city}`;
            console.log(`\n--- Starting scrape for: "${searchTerm}" ---`);
            
            let nextPageToken = null;
            let cityResults = [];
            
            // Loop through pages (Google allows up to 3 pages / 60 results max per query)
            do {
                const apiData = await fetchGooglePlaces(searchTerm, nextPageToken);
                
                if (apiData.results && apiData.results.length > 0) {
                    cityResults.push(...apiData.results);
                }
                
                nextPageToken = apiData.next_page_token;
                
            } while (nextPageToken);

            console.log(`Found ${cityResults.length} total places from API for ${city}. Filtering...`);

            let validResultsCount = 0;

            for (const place of cityResults) {
                // Ensure name exists
                if (!place.name) continue;

                // FILTER: Only allow those with "school" or "academy" in the title
                const nameLower = place.name.toLowerCase();
                if (!nameLower.includes('school') && !nameLower.includes('academy')) {
                    continue; // Skip silently to avoid spamming the console
                }

                // If no formatted_address is available, fallback to city
                const address = place.formatted_address || city;
                
                // Note: The basic Text Search doesn't always return a phone number. 
                // We leave it empty for the sales rep to look up, or they can use the source URL.
                const phone = ''; 
                
                const sourceUrl = `https://maps.google.com/?q=place_id:${place.place_id}`;
                
                validResultsCount++;

                // Check if it already exists in scraped leads (by name and city to prevent duplicates)
                const [[existingScraped]] = await connection.execute(
                    "SELECT id FROM crm_scraped_leads WHERE school_name = ? AND city = ?", 
                    [place.name, city]
                );

                // Check if it already exists in actual leads
                const [[existingLead]] = await connection.execute(
                    "SELECT id FROM crm_leads WHERE school_name = ? AND city = ?", 
                    [place.name, city]
                );

                if (!existingScraped && !existingLead) {
                    await connection.execute(`
                        INSERT INTO crm_scraped_leads (school_name, phone, address, city, source_url, search_term_used, status)
                        VALUES (?, ?, ?, ?, ?, ?, 'pending')
                    `, [
                        place.name, phone, address, city, sourceUrl, searchTerm
                    ]);
                    console.log(`[ADDED] ${place.name}`);
                    totalNewLeads++;
                } else {
                    // console.log(`[SKIPPED] ${place.name} (Already in database)`);
                }
            }
            
            console.log(`Finished processing ${city}. Found ${validResultsCount} valid schools/academies.`);
        }
    } catch (err) {
        console.error("Error during scraping process:", err);
    } finally {
        connection.release();
    }

    console.log(`\nScrape complete! Inserted ${totalNewLeads} new leads into the prescreening pool.`);
    process.exit(0);
}

main();
