FROM alpine:latest
LABEL maintainer="ductnn"

RUN apk update \
    && apk add htop \
    && rm -rf /var/cache/apk/*

ENTRYPOINT [ "htop" ]
