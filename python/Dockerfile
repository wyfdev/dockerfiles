ARG BASE_IMG

FROM ${BASE_IMG}

ARG python_version

RUN apt-get update &&\
    apt-get install -y python$python_version python$python_version-pip python$python_version-dev &&\
    python3 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ &&\
    python3 -m pip install -U pip pipenv ipython ipdb pytest