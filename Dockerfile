FROM node:latest

WORKDIR /bot

COPY ./index.js ./package.json ./yarn.lock ./

RUN yarn install

CMD ["node", "/bot/index.js"]
