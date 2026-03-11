# ===============================================
# AWS CLI, plus a few other handy tools that I commonly need in Gitlab CI pipelines
# ===============================================
FROM ubuntu:24.04
LABEL maintainer="Dale Anderson (http://www.acromedia.com/)"
LABEL org.opencontainers.image.title="GitLab CI AWS CLI"
LABEL org.opencontainers.image.description="AWS CLI v2 with common GitLab CI pipeline tools"
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update && apt-get -yq upgrade \
    && apt-get install -yq apt-utils \
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
        sshpass \
        openssh-client \
        rsync \
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
