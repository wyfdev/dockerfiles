ARG BASE_IMG

FROM ${BASE_IMG}

ARG python_version

RUN curl -s -L https://go.dev/dl/go1.22.0.linux-amd64.tar.gz | tar -xz -C /usr/local
ENV PATH $PATH:/usr/local/go/bin