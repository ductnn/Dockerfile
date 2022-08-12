FROM alpine:latest
LABEL author="ductnn"

RUN set -xe \
    && apk update \
    && apk add --no-cache openssh \
    && mkdir -p 700 /root/.ssh \
    && mv /etc/ssh /root/.ssh/ssh \
    && ln -s /root/.ssh/ssh /etc/ssh \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

WORKDIR /root
VOLUME /root

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
