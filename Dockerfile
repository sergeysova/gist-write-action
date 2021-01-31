FROM node:14-alpine

WORKDIR /bot

COPY ./index.js ./package.json ./yarn.lock ./

RUN yarn install

CMD ["node", "/bot/index.js"]
