FROM alpine/helm:3.8.0
LABEL author="ductn53@gmail.com"

# add package aws
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache

# add aws-iam-authenticator
RUN apk add curl \
    && curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator \
    && chmod +x ./aws-iam-authenticator \
    && mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin \
    && echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
