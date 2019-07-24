FROM node:10.15.0

# install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# install firefox
RUN apt install snapd
RUN snap install -yq firefox

# install angular/cli
RUN npm install -g @angular/cli

#COPY package.json package-lock.json ./
