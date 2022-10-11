FROM alpine:3.16.2
LABEL maintainer="ductnn"

ARG HELM_VER="v3.2.3"

RUN apk add --no-cache curl && \
    curl -L -o /tmp/helm-$HELM_VER.tgz https://get.helm.sh/helm-${HELM_VER}-linux-amd64.tar.gz && \
    tar -xz -C /tmp -f /tmp/helm-$HELM_VER.tgz && \
    mv /tmp/linux-amd64/helm /usr/bin/helm && \
    rm -rf /tmp/linux-amd64 /tmp/helm-$HELM_VER.tgz && \
    rm -rf /var/cache/apk/* && \
    rm -rf ~/.cache
