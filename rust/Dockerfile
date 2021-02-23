ARG BASE_IMG

FROM ${BASE_IMG}

RUN apt-get install -y build-essential
    
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh &&\
    sh rustup.sh -y &&\
    rm rustup.sh

ENV PATH=/root/.cargo/bin:$PATH
