FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    nasm \
    gdb \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'alias test="echo Container active."' >> /etc/bash.bashrc