FROM node:16-alpine
LABEL author="ductnn"

RUN apk add --no-cache curl \ 
  && curl -sf https://gobinaries.com/tj/node-prune | sh -s -- -b /usr/local/bin \
  && apk del curl
