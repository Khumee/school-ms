require('dotenv').config({ path: __dirname + '/../.env' });
const db = require('../db');

/**
 * Basic Web Scraper / Lead Generator
 * Usage: node scripts/scraper.js
 * 
 * Note: In a production environment, this should connect to the Google Places API
 * or use Playwright/Puppeteer to scrape directories.
 */

// Focused target cities as per new requirements
const targetCities = [
    "Rawalpindi", "Islamabad", "Lahore", "Karachi", "Peshawar"
];

async function main() {
    console.log(`Target Cities: ${targetCities.join(', ')}`);

    const connection = await db.pool.getConnection();
    let newLeadsCount = 0;

    try {
        for (const city of targetCities) {
            // We search broadly for schools and academies
            const searchTerm = `School or Academy in ${city}`;
            console.log(`\n--- Starting scrape for: "${searchTerm}" ---`);
            
            // Simulate scraping process for this city
            await new Promise(resolve => setTimeout(resolve, 500));
            
            // Simulated results for the specific city (includes generic schools/academies)
            const scrapedResults = [
                {
                    school_name: `The City School - ${city} Campus`,
                    phone: `0300-${Math.floor(1000000 + Math.random() * 9000000)}`,
                    address: `Main Road, ${city}`,
                    city: city,
                    source_url: `https://maps.google.com/?q=The+City+School+${city}`
                },
                {
                    school_name: `Roots Millennium Schools - ${city}`,
                    phone: `0333-${Math.floor(1000000 + Math.random() * 9000000)}`,
                    address: `Block B, ${city}`,
                    city: city,
                    source_url: `https://maps.google.com/?q=Roots+Millennium+${city}`
                },
                {
                    school_name: `Educators Academy ${city}`,
                    phone: `0345-${Math.floor(1000000 + Math.random() * 9000000)}`,
                    address: `Street 5, ${city}`,
                    city: city,
                    source_url: `https://maps.google.com/?q=Educators+Academy+${city}`
                },
                {
                    school_name: `Jamia Tahfeez (Should be skipped)`, // Does not contain school/academy
                    phone: `0311-${Math.floor(1000000 + Math.random() * 9000000)}`,
                    address: `Tehsil Road, ${city}`,
                    city: city,
                    source_url: `https://maps.google.com/?q=Jamia+${city}`
                }
            ];

            let validResults = 0;

            for (const result of scrapedResults) {
                // FILTER: Only allow those with "school" or "academy" in the title
                const nameLower = result.school_name.toLowerCase();
                if (!nameLower.includes('school') && !nameLower.includes('academy')) {
                    console.log(`[FILTERED OUT] ${result.school_name} (Missing 'school' or 'academy' in title)`);
                    continue;
                }
                validResults++;

                // Check if it already exists in scraped leads
                const [[existingScraped]] = await connection.execute(
                    "SELECT id FROM crm_scraped_leads WHERE phone = ? OR school_name = ?", 
                    [result.phone, result.school_name]
                );

                // Check if it already exists in actual leads
                const [[existingLead]] = await connection.execute(
                    "SELECT id FROM crm_leads WHERE phone = ? OR school_name = ?", 
                    [result.phone, result.school_name]
                );

                if (!existingScraped && !existingLead) {
                    await connection.execute(`
                        INSERT INTO crm_scraped_leads (school_name, phone, address, city, source_url, search_term_used, status)
                        VALUES (?, ?, ?, ?, ?, ?, 'pending')
                    `, [
                        result.school_name, result.phone, result.address, result.city, result.source_url, searchTerm
                    ]);
                    console.log(`[ADDED] ${result.school_name}`);
                    newLeadsCount++;
                } else {
                    console.log(`[SKIPPED] ${result.school_name} (Already in database)`);
                }
            }
            
            console.log(`Found ${validResults} valid potential leads for ${city}.`);
        }
    } catch (err) {
        console.error("Error inserting scraped leads:", err);
    } finally {
        connection.release();
    }

    console.log(`\nScrape complete! Inserted ${newLeadsCount} new leads into the prescreening pool.`);
    process.exit(0);
}

main();
