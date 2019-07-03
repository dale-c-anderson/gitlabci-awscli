# ===============================================
# AWS CLI tools in a docker container
# ===============================================
FROM ubuntu:16.04
MAINTAINER Dale Anderson (http://www.acromedia.com/)

# ----------------
# Prevent a lot of complaining from apt
# ----------------
ENV DEBIAN_FRONTEND noninteractive

# ----------------
# Get everything up to date
# ----------------
RUN apt-get -qq update
RUN apt-get -yqq upgrade

# ----------------
# Prevent more complaining from apt
# ----------------
RUN apt-get install -yqq apt-utils
RUN apt-get install -yqq apt-transport-https

# ----------------
# Allow us to download and unpack things
# ----------------
RUN apt-get install -yqq curl
RUN apt-get install -yqq wget
RUN apt-get install -yqq unzip
RUN apt-get install -yqq bzip2
RUN apt-get install -yqq xz-utils

# ----------------
# Install AWS CLI tools
# ----------------
RUN apt-get install -yqq python-pip
RUN pip install -q awscli
RUN pip install -q yamllint
RUN pip install -q boto

## Set the default command: display Ansible version
CMD [ "aws", "--version" ]
