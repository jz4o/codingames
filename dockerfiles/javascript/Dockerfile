FROM node:lts-alpine

WORKDIR /usr/src

COPY ./vendor/javascript/package.json ./vendor/javascript/package-lock.json ./vendor/javascript/
RUN npm --prefix ./vendor/javascript install

