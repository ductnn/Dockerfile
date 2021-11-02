FROM keymetrics/pm2:16-alpine
LABEL author="trannhuduc531998@gmail.com"

RUN apk add --no-cache shadow curl \ 
  && curl -sf https://gobinaries.com/tj/node-prune | sh -s -- -b /usr/local/bin \
  && apk del curl
