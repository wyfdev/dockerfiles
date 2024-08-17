ARG BASE_IMG

FROM ${BASE_IMG}

ARG nvm_version
ARG node_version

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_version}/install.sh | bash
RUN sed -i '/^source.*oh-my-zsh.sh/a source /root/.nvm.env.sh' /root/.zshrc &&\
    echo 'export NVM_DIR="$HOME/.nvm"; source "$NVM_DIR/nvm.sh"; source "$NVM_DIR/bash_completion"' > $HOME/.nvm.env.sh
RUN zsh -c "source $HOME/.nvm.env.sh && nvm install ${node_version}"
