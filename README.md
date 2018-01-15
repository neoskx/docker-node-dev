A docker image for front-end developer or nodejs developer. It can be used for research, daily work, automation and so on
 
This image is based on [consol/ubuntu-xfce-vnc](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/)

### Features
- Ubuntu OS
- Desktop environment [Xfce4](http://www.xfce.org/)
- VNC Server(**port:** 5901, **password:** welcome)
- [noVNC](https://github.com/kanaka/noVNC) HTML5 VNC client(**port:** 6901)
- Chrome
- Firefox
- NodeJS 8.9.4
- NPM 4.2.0
- Default work directory. **/workspace**
- [Puppeteer](https://github.com/GoogleChrome/puppeteer) 1.0.0

### Usage

Since it is based on [consol/ubuntu-xfce-vnc](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/), so all usages listed in this page also supported

> - Connect via **VNC viewer:** [vnc://localhost:25901](vnc://localhost:25901), default password: welcome
> - Connect via **noVNC HTML5 client:** [http://localhost:26901/?password=welcome](http://localhost:26901/?password=welcome)
> - Change port number to the port you used. Default use 25901, 26901

#### Run command with mapping to local port 25901, port 26901
```bash
docker run -d -p 25901:5901 -p 26901:6901 puppeteer-dev
```
#### Run command with root user
```bash
docker run --user 0 -d -p 25901:5901 -p 26901:6901 puppeteer-dev
```
#### Run command with mapping to local port 25901, port 26901, and mount local folder
```bash
docker run -d -p 25901:5901 -p 26901:6901 -v <path-to-your-folder>:/workspace puppeteer-dev
```