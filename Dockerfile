FROM ubuntu:22.04
MAINTAINER BPI "BPI-SINOVOIP"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y \
	git \
	gcc \
	g++ \
	build-essential \
	gcc-aarch64-linux-gnu \
	iasl \
	python3-pyelftools \
	uuid-dev \
	device-tree-compiler \
	parted \
	locales \
	sudo \
	vim

RUN locale-gen en_US.UTF-8

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
