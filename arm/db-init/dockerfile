FROM hypriot/rpi-node:6.10.0-alpine

LABEL MAINTAINER "Dashlorde <zhouyunlu0216@gmail.com>"
LABEL MAINTAINER "Abdurrachman Mappuji <mappuji@ole.org>"
LABEL MAINTAINER "dogi <stefan@unterhauser.name>"

ENV version '0.13.21'

RUN apk update && \
    apk add --no-cache bash curl git jq openssl && \
    mkdir bell && wget -O bell/BeLL-Apps-${version}.tar.gz \
    https://github.com/open-learning-exchange/BeLL-Apps/archive/0.13.21.tar.gz && \
    cd bell && tar xvf BeLL-Apps-${version}.tar.gz && \
    mkdir -p /app && mv BeLL-Apps-${version}/* /app && \
    chmod +x /app/node_modules/.bin/couchapp && \
    npm install -g add-cors-to-couchdb

COPY docker-entrypoint.sh /root/docker-entrypoint.sh
COPY couchdb-setup.sh /root/couchdb-setup.sh

RUN chmod +x /root/couchdb-setup.sh

CMD sh /root/docker-entrypoint.sh
