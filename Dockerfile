# Base image - https://hub.docker.com/r/alekzonder/puppeteer/
FROM alekzonder/puppeteer:1.0.0

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get update \
    && apt-get install -y -t jessie-backports \
       wget \
       openjdk-8-jre-headless

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y \
       google-chrome-stable \
       netcat-openbsd \
       xvfb \
       x11vnc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir ~/.vnc \
    && x11vnc -storepasswd Welcome1 ~/.vnc/pass

# Fix for the issue with Selenium, as described here:
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null \
    SCREEN_RES=1440x1024x24

ADD ./scripts /scripts

ENV PATH="/scripts:${PATH}"

RUN chmod +x /scripts/*

EXPOSE 5900

CMD ["bash", "dev"]