FROM	ubuntu:12.04.5
MAINTAINER	BPI  "BPI-SINOVOIP"

RUN	add-apt-repository ppa:webupd8team/java

RUN	apt-get update && apt-get install -y \
	apt-utils \
	openssh-server \
	build-essential \
	gcc-arm-linux-gnueabihf \
	g++-arm-linux-gnueabihf \
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
	oracle-java6-installer \
	busybox

ADD	dtc /usr/bin/dtc

RUN	mkdir /var/run/sshd
RUN	echo 'root:root' | chpasswd
RUN 	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN 	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME	["/media"]

EXPOSE	22

CMD	["/usr/sbin/sshd", "-D"]

