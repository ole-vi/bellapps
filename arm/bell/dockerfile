FROM hypriot/rpi-node:6.10.0-alpine

LABEL MAINTAINER "Dashlorde <zhouyunlu0216@gmail.com>"
LABEL MAINTAINER "Abdurrachman Mappuji <mappuji@ole.org>"
LABEL MAINTAINER "dogi <stefan@unterhauser.name>"

ENV version '0.13.21'

RUN mkdir -p /app/server/src && \
    apk add --update openssl && npm install express

WORKDIR /app/server/src

COPY server.js ./
COPY package.json ./

RUN chmod +x ./server.js && npm install

EXPOSE 80

CMD ["npm","start"]
