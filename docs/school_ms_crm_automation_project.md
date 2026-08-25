# School-MS CRM: Lead Scraper Automation & Prescreening Workflow

**Tech Stack:** Node.js, Express, MySQL, Google Places API, Puppeteer (Headless Chrome), GitHub Actions, EJS

## Project Overview
Architected and deployed a fully automated B2B lead generation pipeline and CRM prescreening dashboard for the School-MS SaaS Platform. This system intelligently mines Google Maps for potential client schools across Pakistan and feeds them into a staging area for sales reps to review and claim.

## Key Achievements
- **Hybrid Scraper Architecture:** Engineered a highly optimized scraper that combines the speed of the **Google Places API** (for GPS coordinate mapping and discovering schools) with the free power of a **Puppeteer Headless Browser** (to extract phone numbers via DOM and Regex scraping), cutting API costs by 95%.
- **Anti-Bot & GDPR Bypasses:** Implemented advanced Puppeteer techniques including User-Agent spoofing to trick Google Maps into serving desktop UI layouts, and automated click handlers to dynamically bypass European GDPR consent walls when deployed on foreign servers.
- **Aggressive Scaling:** Capitalized on the hybrid cost-savings to scale the operation up to process 10 cities simultaneously per run, ensuring massive lead volume while staying securely under a strict 2,000 monthly API limit.
- **Smart Quota Management:** Engineered a database-backed API quota limiter with real-time UI dashboards to guarantee zero overage charges while maintaining a steady flow of fresh leads.
- **Prescreening Dashboard:** Designed a full-stack `EJS` interface for Super Admins and Sales Reps to review, filter (by city/keyword/phone type), and convert raw scraped data into actionable CRM leads.
- **Sales Rep Isolation & UI:** Implemented strict conversion logic ensuring sales reps can only assign new leads to themselves. Replaced default browser dialogs with custom styled modals for a premium feel.
- **CI/CD Pipeline Updates:** Enhanced the GitHub Actions deployment pipeline to securely inject Google API secrets directly into the production server's environment during the build process.
