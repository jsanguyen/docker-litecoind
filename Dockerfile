FROM ubuntu:20.04

LABEL maintainer "Jonathan Nguyen <jcanguyen1@gmail.com>"

ARG LITECOIN_VERSION=0.18.1

## The run command will initialize a start up like scrip that downloads and installs the neccessary packages to further install the litecoin files. 
## Once the litecoin files have been downloaded and installed, the script will the packages it previously installed since they are no longer needed. 

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        gpg \
        gpg-agent \
        dirmngr && \
    \
    wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz.asc && \
    tar xfz /litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    mv litecoin-${LITECOIN_VERSION}/bin/* /usr/local/bin/ && \
    rm -rf litecoin-* /root/.gnupg/ && \
    \
    apt-get remove --purge -y \
        ca-certificates \
        wget \
        gpg \
        gpg-agent \
        dirmngr && \
    apt-get autoremove --purge -y && \
    rm -r /var/lib/apt/lists/*

VOLUME ["/litecoin"]

EXPOSE 9333 9332

COPY ["bin", "/usr/local/bin/"]
COPY ["docker-entrypoint.sh", "/usr/local/bin/"]
ENTRYPOINT ["docker-entrypoint.sh"]
