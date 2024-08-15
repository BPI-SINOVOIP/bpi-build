FROM ubuntu:jammy
MAINTAINER BPI-SINOVOIP

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install \
	git \
	build-essential \
	cpio unzip rsync \
	file \
	bc \
	wget \
	python3 \
	python-is-python3 \
	libncurses5-dev \
	libssl-dev \
	dosfstools \
	mtools \
	u-boot-tools \
	flex \
	bison \
	python3-pip \
	vim \
	sudo \
	zip \
	unzip \
	locales

RUN pip3 install pyyaml

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8' TERM=screen

ENV USER=bananapi
ARG USER_ID=0
ARG GROUP_ID=0
RUN groupadd -g ${GROUP_ID} bananapi && useradd -m -g bananapi -u ${USER_ID} bananapi

RUN adduser bananapi sudo
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

RUN echo 'root:root' | chpasswd
RUN echo 'bananapi:bananapi' | chpasswd

RUN apt-get -y autoclean && apt-get -y autoremove

USER bananapi
