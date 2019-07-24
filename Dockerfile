FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Installing wget, curl
RUN  apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* && apt-get install -y curl

# Installing gnupg2
RUN apt-get update && apt-get install -y gnupg2

# Installing Node
#ARG node_version=v10.15.0
#ARG install_name=node-v10.15.0-linux-x64
#RUN wget "http://nodejs.org/dist/$node_version/$install_name.tar.gz"
#RUN tar xf $install_name.tar.gz

#ARG NODE_INSTALL_DIR=`pwd`/$install_name/bin
#ENV PATH $NODE_INSTALL_DIR:$PATH

RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN sh -c "echo deb https://deb.nodesource.com/node_10.x bionic main > /etc/apt/sources.list.d/nodesource.list"
RUN apt-get update && apt-get install -y nodejs

# Installing chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# Installing firefox
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:mozillateam/firefox-next
RUN apt-get update && apt-get install -y firefox && rm -rf /var/lib/apt/lists/*

# Installing angular/cli
RUN npm install -g @angular/cli

# Integrate with IBM® DevOps Insights
RUN npm install -g grunt-idra3
