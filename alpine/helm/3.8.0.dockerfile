FROM alpine/helm:3.8.0
LABEL author="ductn53@gmail.com"

# add package aws
RUN apk add --no-cache python3 py3-pip curl \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli \
    && rm -rf /var/cache/apk/* \
    && rm -rf ~/.cache

# add aws-iam-authenticator
RUN curl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
    && chmod a+x /usr/local/bin/aws-iam-authenticator
