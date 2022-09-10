FROM alpine:latest
LABEL maintainer="ductnn"

ENV TERRAFORM_VERSION=${YOUR_VERSION}

# Install common packages
RUN apk update \
    && apk add curl git --no-cache \
    && rm -rf /var/cache/apk/*

ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip .

# Install Terraform
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/bin/terraform \
    && chmod +x /usr/bin/terraform

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod 0755 kubectl \
    && mv kubectl /usr/local/bin/kubectl

CMD [ "/bin/sh" ]
