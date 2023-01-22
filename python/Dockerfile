ARG BASE_IMG

FROM ${BASE_IMG}

ARG python_version

RUN apt-get update &&\
    apt-get install -y \
        python$python_version \
        python$python_version-pip \
        python$python_version-dev &&\
        rm -rf /var/lib/apt/lists/*

RUN python$python_version -m pip install -U pip ipython ipdb pytest
