ARG BASE_IMG

FROM ${BASE_IMG}

ARG node_version

RUN curl -sL https://deb.nodesource.com/setup_${node_version}.x | bash -
# https://github.com/nodesource/distributions/blob/master/README.md
# output:
## Run `sudo apt-get install -y nodejs` to install Node.js 13.x and npm
## You may also need development tools to build native addons:
#    sudo apt-get install gcc g++ make
## To install the Yarn package manager, run:
#    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#    sudo apt-get update && sudo apt-get install yarn

RUN apt-get install -y nodejs gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list &&\
    apt-get update &&\
    apt-get install -y yarn