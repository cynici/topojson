FROM mhart/alpine-node
MAINTAINER Cheewai Lai <clai@csir.co.za>

ARG GOSU_VERSION=1.9
ARG GOSU_PATH=/usr/bin/gosu

RUN apk update \
 && apk add curl \
 && curl -o $GOSU_PATH -sSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 \
 && chmod +x $GOSU_PATH \
 && npm install -g topojson \
 && apk del curl \
 && rm -rf /var/cache/apk/*
