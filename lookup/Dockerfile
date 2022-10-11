FROM alpine:latest
LABEL maintainer="ductnn"

ARG LOOKUP_VERSION="v1.0.0"

RUN apk update \
    && apk add curl \
    && curl -L -o /tmp/loo https://github.com/ductnn/lookup/releases/download/${LOOKUP_VERSION}/loo-linux-64 \
    && chmod +x /tmp/loo \
    && mv /tmp/loo /usr/bin/loo \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache

ENTRYPOINT [ "loo" ]
