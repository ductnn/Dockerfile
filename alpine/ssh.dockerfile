FROM alpine:latest
LABEL maintainer="ductnn"

RUN apk update \
    && apk add openssh-client \
    && rm -rf /var/cache/apk/*
