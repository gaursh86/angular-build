FROM node:10.16.0-alpine

# install angular-cli as node user
RUN chown -R node:node /usr/local/lib/node_modules && chown -R node:node /usr/local/bin

USER node
RUN npm install -g @angular/cli

