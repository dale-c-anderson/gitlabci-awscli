# ===============================================
# AWS CLI, plus a few other handy tools that I commonly need in Gitlab CI pipelines
# ===============================================
FROM ubuntu:22.04
MAINTAINER Dale Anderson (http://www.acromedia.com/)

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update && apt-get -yq upgrade \
    && apt-get install -yq apt-utils \
    && apt-get install -yq apt-transport-https \
    && apt-get install --no-install-recommends -yq \
        curl \
        ca-certificates \
        wget \
        unzip \
        bzip2 \
        xz-utils \
        git \
        zip \
        jq \
        && rm -rf /var/lib/apt/lists/*

# ----------------
# Install aws cli v2 and remove the cruft
# ----------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip \
    && rm -rf /aws \
    && rm -rf /usr/local/aws-cli/v2/current/dist/awscli/examples

## Set the default command: display AWS CLI version
CMD [ "aws", "--version" ]
