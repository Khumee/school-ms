const puppeteer = require('puppeteer');

async function testScrape() {
    console.log("Launching browser...");
    const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox'] });
    const page = await browser.newPage();
    
    // Set desktop user agent
    await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');
    await page.setViewport({ width: 1280, height: 800 });

    const url = `https://www.google.com/maps/search/BAJWA+SCIENCE+ACADEMY+AND+SCHOOL`;
    console.log("Navigating to:", url);

    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    // Try to click consent if present
    try {
        const consentBtn = await page.$('form[action="https://consent.google.com/save"] button');
        if (consentBtn) {
            console.log("Clicking consent...");
            await consentBtn.click();
            await page.waitForNavigation({ waitUntil: 'networkidle2' });
        }
    } catch(e){}

    const text = await page.evaluate(() => document.body.innerText);
    console.log("-----------------------------------------");
    console.log("SERVER SEES THIS TEXT (First 1000 chars):");
    console.log("-----------------------------------------");
    console.log(text.substring(0, 1000));
    console.log("-----------------------------------------");
    
    // Save screenshot if possible
    try {
        await page.screenshot({ path: 'server_test_screenshot.png', fullPage: true });
        console.log("Saved screenshot to server_test_screenshot.png");
    } catch(e) {
        console.log("Could not save screenshot.");
    }
    console.log("Extracting phone numbers...");
    
    // Simple regex for testing
    const phoneRegex = /(?:\+92|0)[-\s]?\d{2,4}[-\s]?\d{6,7}/g;
    const matches = text.match(phoneRegex);
    console.log("Regex matches:", matches);
    
    // DOM scraping
    const ariaLabels = await page.evaluate(() => {
        const btns = document.querySelectorAll('button');
        let res = [];
        for (let b of btns) {
            const label = b.getAttribute('aria-label');
            if (label && label.toLowerCase().includes('phone')) res.push(label);
        }
        return res;
    });
    console.log("Buttons with 'phone' aria-label:", ariaLabels);
    
    await browser.close();
}

testScrape().catch(console.error);
