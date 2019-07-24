FROM node:10.15.0

# install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# install firefox
#RUN apt-get -y --force-yes install firefox
RUN cd /usr/local
RUN wget http://ftp.mozilla.org/pub/firefox/releases/69.0b7/linux-x86_64/en-US/firefox-69.0b7.tar.bz2
RUN tar xvjf firefox-69.0b7.tar.bz2
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox
ENV FIREFOX_BIN /usr/bin/firefox
ENV PATH="/usr/bin/firefox:${PATH}"

# install angular/cli
RUN npm install -g @angular/cli

#COPY package.json package-lock.json ./
