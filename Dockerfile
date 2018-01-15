# Base image - https://hub.docker.com/r/alekzonder/puppeteer/
FROM consol/ubuntu-xfce-vnc:1.2.3
MAINTAINER Shaoke Xu "shaokexu@gmail.com"
ENV REFRESHED_AT 2018-01-12

# Switch to root user
USER 0

# overwrite environment config in consol/ubuntu-xfce-vnc
ENV VNC_RESOLUTION=1440x900 \
    VNC_PW=welcome \
    NODE_PATH="/usr/lib/node_modules:${NODE_PATH}"

## install apt-utils, curl
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y curl

## install nodejs - https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs && \
    apt-get install -y build-essential

## install npm version 4.2.0, latest version has issue with puppeteer
## after this issue fixed, then should remove this line
RUN npm install -g npm@4.2.0

## install puppeteer
RUN npm install -g puppeteer@1.0.0

## change work directory
RUN mkdir /workspace

WORKDIR /workspace
