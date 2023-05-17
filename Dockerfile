FROM ubuntu:20.04
MAINTAINER BPI "BPI-SINOVOIP"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y \
      ccache doxygen gcc coreutils fakeroot squashfs-tools \
      sudo liblz4-tool xz-utils cryptsetup-bin \
      git-core gnupg flex bison gperf build-essential zip \
      curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
      libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev \
      lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
      libssl-dev bc python python3 python3-pip python3-pexpect python3-markdown \
      gawk wget git-core diffstat texinfo build-essential chrpath socat cpio \
      xz-utils debianutils iputils-ping libsdl1.2-dev xterm \
      libmicrohttpd-dev libargtable2-dev ninja-build \
      gzip ffmpeg openjdk-8-jdk vim rsync libidn11 automake \
      autoconf kmod genext2fs

RUN apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
      gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

RUN pip install autopep8
RUN wget https://cmake.org/files/v3.20/cmake-3.20.0-linux-x86_64.sh && chmod a+x cmake-3.20.0-linux-x86_64.sh && ./cmake-3.20.0-linux-x86_64.sh --prefix=/usr/ --exclude-subdir

ENV USER=bananapi
ARG USER_ID=0
ARG GROUP_ID=0
RUN groupadd -g ${GROUP_ID} bananapi && useradd -m -g bananapi -u ${USER_ID} bananapi

RUN adduser bananapi sudo
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
#RUN echo "$(sed 's/dangku-PC/bananapi/g' /etc/hosts)\n" > /etc/hosts

RUN echo 'root:root' | chpasswd
RUN echo 'bananapi:bananapi' | chpasswd

RUN apt-get autoclean && apt-get autoremove -y

USER bananapi
