FROM ubuntu:16.04
MAINTAINER BPI "BPI-SINOVOIP"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y \
	openjdk-8-jdk automake make git-core gperf zip dos2unix flex \
	bison perl gcc g++ tig pkg-config cpp-aarch64-linux-gnu kmod bc \
	gcc-4.8-aarch64-linux-gnu unzip lib32z1 libx11-dev lib32z-dev ccache \
	gitk libxml2-utils libssl-dev vim-common sudo lib32stdc++6 net-tools

ENV USER=bananapi
ARG USER_ID=0
ARG GROUP_ID=0
RUN groupadd -g ${GROUP_ID} bananapi && useradd -m -g bananapi -u ${USER_ID} bananapi
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
RUN usermod -a -G sudo bananapi

RUN echo 'root:root' | chpasswd
RUN echo 'bananapi:bananapi' | chpasswd

USER bananapi
