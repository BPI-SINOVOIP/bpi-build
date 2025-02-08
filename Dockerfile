FROM ubuntu:20.04
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
	bison \
	rsync \
	cpio \
	liblzo2-2 \
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
	sudo \
	mtd-utils

RUN locale-gen en_US.UTF-8
RUN ln -s /usr/bin/python3 /usr/bin/python

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
