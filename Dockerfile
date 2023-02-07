# ===============================================
# AWS CLI tools in a docker container
# ===============================================
FROM ubuntu:22.04
MAINTAINER Dale Anderson (http://www.acromedia.com/)

# ----------------
# Prevent a lot of complaining from apt
# ----------------
ENV DEBIAN_FRONTEND noninteractive

# ----------------
# Get everything up to date
# ----------------
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

# # ----------------
# # Prevent more complaining from apt
# # ----------------
# RUN
# RUN
#
# # ----------------
# # Allow us to download and unpack things
# # ----------------
# RUN

# ----------------
# Install AWS CLI prerequisites
# ----------------
# RUN apt-get install -yq jq
# RUN apt-get install -yqq python3-pip
# RUN pip3 install -q yamllint
# RUN pip3 install -q boto
# RUN pip3 install -q boto3
# RUN pip3 install -q botocore

# ----------------
# Install aws cli v2
# ----------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm -rf aws/dist/awscli/examples



# ----------------
# Install jq so we can parse output from awscli
# ----------------

## Set the default command: display Ansible version
CMD [ "aws", "--version" ]
