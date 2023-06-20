FROM ubuntu:20.04
MAINTAINER BPI "BPI-SINOVOIP"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y software-properties-common
RUN apt-get install -y python3-pip && pip install pycrypto

RUN apt-get update -y && apt-get install -y openjdk-8-jdk python git-core gnupg flex bison gperf build-essential \
zip curl gawk liblz4-tool zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
htop iotop sysstat iftop pigz bc device-tree-compiler lunzip locales \
dosfstools vim-common parted udev libssl-dev sudo rsync python3-pyelftools cpio \
time expect wget cmake binfmt-support qemu-user-static live-build chrpath diffstat zstd

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

ENV USER=bananapi
ARG USER_ID=0
ARG GROUP_ID=0
RUN groupadd -g ${GROUP_ID} bananapi && useradd -m -g bananapi -u ${USER_ID} bananapi

RUN adduser bananapi sudo
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

RUN echo 'root:root' | chpasswd
RUN echo 'bananapi:bananapi' | chpasswd

RUN apt-get autoclean && apt-get autoremove

USER bananapi
