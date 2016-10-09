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
	busybox \
	git \
	gnupg \
	flex \
	bison \
	gperf \
	build-essential \
	zip \
	curl \
	libc6-dev \
	libncurses5-dev:i386 \
	x11proto-core-dev \
	libx11-dev:i386 \
	libreadline6-dev:i386 \
	libgl1-mesa-glx:i386 \
	libgl1-mesa-dev \
	g++-multilib \
	mingw32 \
	tofrodos \
	python-markdown \
	libxml2-utils \
	xsltproc \
	zlib1g-dev:i386 \
	uboot-mkimage \
	xserver-xorg

ADD	dtc /usr/bin/dtc

RUN	mkdir /var/run/sshd
RUN	echo 'root:root' | chpasswd
RUN 	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN 	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN	ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

VOLUME	["/media"]

EXPOSE	22

CMD	["/usr/sbin/sshd", "-D"]

