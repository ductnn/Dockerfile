FROM alpine:latest
LABEL author="ductnn"

RUN apk update \
    && apk --no-cache add ca-certificates groff less python3 \
	&& pip3 install awscli \
	&& mkdir -p /root/.aws \
	&& { \
		echo '[default]'; \
		echo 'output = json'; \
		echo 'region = $AWS_DEFAULT_REGION'; \
		echo 'aws_access_key_id = $AMAZON_ACCESS_KEY_ID'; \
		echo 'aws_secret_access_key = $AMAZON_SECRET_ACCESS_KEY'; \
	} > /root/.aws/config \
    && rm -rf /var/cache/apk/*

ENTRYPOINT [ "aws" ]
