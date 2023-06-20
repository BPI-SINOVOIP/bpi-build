FROM ubuntu:16.04
MAINTAINER BPI "BPI-SINOVOIP"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y \
	build-essential \
	subversion \
	git-core \
	libncurses5-dev \
	lib32ncurses5-dev \
	libc6-dev-i386 \
	lib32z-dev \
	zlib1g-dev \
	gawk \
	flex \
	quilt \
	libssl-dev \
	xsltproc \
	libxml-parser-perl \
	mercurial \
	bzr \
	ecj \
	cvs \
	unzip \
	bc \
	u-boot-tools \
	locales \
	wget \
	busybox \
	vim \
	sudo

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
