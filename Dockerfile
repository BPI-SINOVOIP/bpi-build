FROM	ubuntu:16.04
MAINTAINER	BPI  "BPI-SINOVOIP"

RUN	apt-get update && apt-get install -y \
	apt-utils \
	openssh-server \
	build-essential \
	gcc-multilib \
	unzip \
	sudo \
	git \
	mercurial \
	vim \
	bc \
	u-boot-tools \
	device-tree-compiler \
	pkg-config \
	libusb-1.0-0-dev \
	python-software-properties \
	software-properties-common \
	libncurses5-dev \
	lib32ncurses5-dev \
	libc6-dev-i386 \
	lib32z-dev \
	busybox \
	gawk \
	locales

ADD	dtc /usr/bin/dtc

RUN     locale-gen en_US.UTF-8
ENV     LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN	mkdir /var/run/sshd
RUN	echo 'root:root' | chpasswd
RUN     sed -i 's/AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/g' /etc/ssh/sshd_config
RUN 	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN 	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME	["/media"]

EXPOSE	22

CMD	["/usr/sbin/sshd", "-D"]
