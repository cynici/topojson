# 2017-11-01 Tagged to 8 and not latest (9+) because NPM does not support 9 yet!
FROM mhart/alpine-node:8
LABEL maintainer "Cheewai Lai <clai@csir.co.za>"

ARG GOSU_VERSION=1.10
ARG GOSU_PATH=/usr/bin/gosu

RUN apk update \
 && apk add curl \
 && curl -o $GOSU_PATH -sSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
 && chmod +x $GOSU_PATH \
 && npm install -g topojson \
 && apk del curl \
 && rm -rf /var/cache/apk/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
