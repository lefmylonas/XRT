FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

COPY . /home/ubuntu/XRT

WORKDIR /home/ubuntu/XRT

RUN apt update

RUN ./src/runtime_src/tools/scripts/xrtdeps.sh -docker

WORKDIR /home/ubuntu/XRT/build

RUN ./build.sh -edge

WORKDIR /home/ubuntu/XRT/build/Edge

RUN make install 

WORKDIR /home/ubuntu

RUN rm -rf XRT