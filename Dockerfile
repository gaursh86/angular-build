FROM node:10.15.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

RUN wget -O FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
RUN mkdir /opt/firefox
RUN tar xjf FirefoxSetup.tar.bz2 -C /opt/firefox/
RUN chown -R root:users /opt/firefox
RUN chmod 750 /opt/firefox
RUN ln -s /opt/firefox/firefox /usr/bin/firefox

RUN npm install -g @angular/cli

#COPY package.json package-lock.json ./
