// https://peter.sh/experiments/chromium-command-line-switches/

const puppeteer = require('puppeteer');

(async() => {

  const browser = await puppeteer.launch({
    headless: false,
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox'
    ]
  });

  const page = await browser.newPage();
  await page.goto('https://www.google.com/', {waitUntil: 'networkidle2'});
  await page.screenshot({path: 'google.png'});

  browser.close();

})();