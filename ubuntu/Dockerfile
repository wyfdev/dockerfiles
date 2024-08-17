FROM docker.io/ubuntu

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        zsh curl wget gzip bzip2 xz-utils sed make tree psmisc \
        iproute2 net-tools socat dnsutils traceroute tcpdump lsof \
        iputils-ping iputils-arping iputils-clockdiff iputils-tracepath \
        git vim &&\
    rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&\
    sed -i -e '/^#/d' -e '/^$/d' \
           -e 's/^ZSH_THEME=.*/ZSH_THEME="afowler"/g' \
        /root/.zshrc &&\
    echo "\ntest -f /work/.incenvrc && source /work/.incenvrc" >> /root/.zshrc

WORKDIR /work

ENTRYPOINT /bin/zsh
