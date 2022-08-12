FROM alpine:latest
LABEL author="ductnn"

RUN apk update \ 
    && apk --no-cache add bash certbot \
    && rm -rf /var/cache/apk/*

ENTRYPOINT [ "certbot" ]
