FROM docker:20.10
LABEL author="ductnn"

# Add package ci node, pip, awscli
RUN apk update \
  && apk add --no-cache shadow git py3-pip curl \
  && pip install --no-cache-dir awscli

# Install nodejs-npm/yarn
RUN apk add --no-cache --update nodejs nodejs-npm --repository=http://dl-cdn.alpinelinux.org/alpine/v3.16/main \
  && npm i yarn -g \
  && npm cache verify \
  && apt-get clean \
  && rm -rf /var/cache/apk/* \
  && rm -rf ~/.cache

CMD [ "/bin/sh" ]
