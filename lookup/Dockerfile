FROM alpine:latest
LABEL maintainer="ductnn"

RUN apk update \
    && apk add curl \
    && curl -L -o /tmp/loo https://github.com/ductnn/lookup/releases/download/v1.0.0/loo-linux-64 \
    && chmod +x /tmp/loo \
    && mv /tmp/loo /usr/bin/loo \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache

ENTRYPOINT [ "loo" ]
