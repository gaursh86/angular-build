FROM ubuntu:latest

# installing Node
ARG node_version=v10.15.0
ARG install_name=node-v10.15.0-linux-x64
wget "http://nodejs.org/dist/$node_version/$install_name.tar.gz"
tar xf $install_name.tar.gz

NODE_INSTALL_DIR=`pwd`/$install_name/bin
ENV PATH $NODE_INSTALL_DIR:$PATH

# install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# install firefox
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:mozillateam/firefox-next
RUN apt-get update && apt-get install -y firefox && rm -rf /var/lib/apt/lists/*

# install angular/cli
RUN npm install -g @angular/cli

