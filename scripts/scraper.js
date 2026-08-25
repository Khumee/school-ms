require('dotenv').config({ path: __dirname + '/../.env' });
const db = require('../db');

/**
 * Basic Web Scraper / Lead Generator
 * Usage: node scripts/scraper.js [optional_search_term]
 * 
 * Note: In a production environment, this should connect to the Google Places API
 * or use Playwright/Puppeteer to scrape directories.
 * This script is designed to rotate through a list of target cities in Pakistan 
 * day-by-day to systematically cover different regions.
 */

const targetCities = [
    "Mianwali", "Jhang", "Chiniot", "Dera Ghazi Khan", "Bhakkar", 
    "Layyah", "Muzaffargarh", "Rajanpur", "Vehari", "Lodhran",
    "Pakpattan", "Sahiwal", "Okara", "Kasur", "Sheikhupura",
    "Hafizabad", "Mandi Bahauddin", "Jhelum", "Chakwal", "Attock",
    "Swat", "Abbottabad", "Mansehra", "Haripur", "Kohat",
    "Bannu", "Dera Ismail Khan", "Mardan", "Swabi", "Nowshera"
];

async function main() {
    // Determine the city for today based on the day of the year
    const start = new Date(new Date().getFullYear(), 0, 0);
    const diff = new Date() - start;
    const oneDay = 1000 * 60 * 60 * 24;
    const dayOfYear = Math.floor(diff / oneDay);
    
    const cityForToday = targetCities[dayOfYear % targetCities.length];
    
    const userSearchTerm = process.argv.slice(2).join(' ');
    const searchTerm = userSearchTerm || `Hifz School in ${cityForToday}`;
    
    console.log(`[Day ${dayOfYear}] Target City for Today: ${cityForToday}`);
    console.log(`Starting scrape for: "${searchTerm}"...`);

    // Simulate scraping process
    console.log('Connecting to search provider...');
    await new Promise(resolve => setTimeout(resolve, 1000));

    // Simulated results based on the target audience for the specific city
    const scrapedResults = [
        {
            school_name: `Jamia Tahfeez ul Quran - ${cityForToday} Campus`,
            phone: `0300-${Math.floor(1000000 + Math.random() * 9000000)}`,
            address: `Main Bazar, ${cityForToday}`,
            city: cityForToday,
            source_url: `https://maps.google.com/?q=Jamia+Tahfeez+ul+Quran+${cityForToday}`
        },
        {
            school_name: `Dar-e-Arqam School (Hifz Program) - ${cityForToday}`,
            phone: `0333-${Math.floor(1000000 + Math.random() * 9000000)}`,
            address: `Tehsil Road, ${cityForToday}`,
            city: cityForToday,
            source_url: `https://maps.google.com/?q=Dar+e+Arqam+${cityForToday}`
        },
        {
            school_name: `Iqra Rauzatul Atfal (Hifz Branch) ${cityForToday}`,
            phone: `0345-${Math.floor(1000000 + Math.random() * 9000000)}`,
            address: `Bypass Road, ${cityForToday}`,
            city: cityForToday,
            source_url: `https://maps.google.com/?q=Iqra+Rauzatul+Atfal+${cityForToday}`
        }
    ];

    console.log(`Found ${scrapedResults.length} potential leads. Filtering duplicates...`);

    const connection = await db.pool.getConnection();
    let newLeadsCount = 0;

    try {
        for (const result of scrapedResults) {
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
    } catch (err) {
        console.error("Error inserting scraped leads:", err);
    } finally {
        connection.release();
    }

    console.log(`\nScrape complete! Inserted ${newLeadsCount} new leads into the prescreening pool.`);
    process.exit(0);
}

main();
