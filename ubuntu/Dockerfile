FROM docker.io/ubuntu

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        zsh curl sed make tree \
        iputils-* iproute2 socat dnsutils \
        git vim &&\
        rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&\
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="afowler"/g' /root/.zshrc &&\
    echo "\ntest -f /work/.incenvrc && source /work/.incenvrc" >> /root/.zshrc

WORKDIR /work

ENTRYPOINT /bin/zsh
