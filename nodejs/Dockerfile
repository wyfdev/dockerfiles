ARG BASE_IMG

FROM ${BASE_IMG}

ARG node_version

RUN wget -qO- https://nodejs.org/dist/$node_version/node-$node_version-linux-x64.tar.xz \
    | tar -xJvf  - -C /usr --strip-components 1
