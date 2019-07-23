FROM node:10.15.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

RUN cd /usr/local
RUN wget http://ftp.mozilla.org/pub/firefox/releases/67.0/linux-x86_64/en-US/firefox-67.0.tar.bz2
RUN tar xvjf firefox-67.0.tar.bz2
RUN sudo ln -s /usr/local/firefox/firefox /usr/bin/firefox

RUN npm install -g @angular/cli

#COPY package.json package-lock.json ./
