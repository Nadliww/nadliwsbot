FROM node:lts-buster

RUN rm -rf node_modules

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install -g npm@9.2.0

RUN npm install

COPY . .


CMD ["npm", "."]
