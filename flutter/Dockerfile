ARG BASE_IMG

#
# flutter base
#   https://flutter.dev/docs/get-started/install/linux
#
FROM ${BASE_IMG} AS flutter-base

# Apt
RUN apt update &&\
    apt install -y curl wget git xz-utils lib32stdc++6 libglu1-mesa unzip
    # openjdk-8-jdk-headless
    

# Flutter
RUN mkdir -p /dep &&\
    cd /dep &&\
    wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.17.4-stable.tar.xz &&\
    tar xf flutter_linux_1.17.4-stable.tar.xz &&\
    rm flutter_linux_1.17.4-stable.tar.xz

ENV PATH="/dep/flutter/bin:${PATH}"

RUN flutter config --no-analytics