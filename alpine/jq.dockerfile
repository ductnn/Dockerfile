FROM alpine:latest
LABEL maintainer="ductnn"

RUN apk update \
    && apk --no-cache add curl jq bash git \
    && rm -rf /var/cache/apk/*

CMD ["bash"]
