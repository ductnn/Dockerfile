FROM keymetrics/pm2:14-alpine
LABEL author="trannhuduc531998@gmail.com"

RUN apk add --no-cache curl \ 
  && curl -sf https://gobinaries.com/tj/node-prune | sh -s -- -b /usr/local/bin \
  && apk del curl
