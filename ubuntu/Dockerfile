FROM docker.io/ubuntu:20.04

# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g; s/security.ubuntu.com/mirrors.aliyun.com/g;' /etc/apt/sources.list

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y zsh curl git vim make iputils-* iproute2 socat tree dnsutils

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

WORKDIR /work

ENTRYPOINT /bin/zsh