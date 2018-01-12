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

// docker run --shm-size 1G --rm -v /Users/shaokxu/SK/github/mine/docker-puppeteer-dev/examples:/app alekzonder/puppeteer:latest