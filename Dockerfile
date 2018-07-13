FROM	ubuntu:12.04.5
MAINTAINER	BPI  "BPI-SINOVOIP"

RUN	apt-get update && apt-get install -y \
	apt-utils \
	openssh-server \
	build-essential \
	gcc-arm-linux-gnueabihf \
	g++-arm-linux-gnueabihf \
	gcc-arm-linux-gnueabi \
	g++-arm-linux-gnueabi \
	unzip \
	sudo \
	git \
	mercurial \
	vim \
	bc \
	u-boot-tools \
	device-tree-compiler \
	ia32-libs \
	pkg-config \
	libusb-1.0-0-dev \
	python-software-properties \
	software-properties-common \
	libncurses5-dev \
	busybox

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
