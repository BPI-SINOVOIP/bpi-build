FROM	ubuntu:16.04
MAINTAINER	BPI  "BPI-SINOVOIP"

RUN	apt-get update && apt-get install -y \
	openjdk-8-jdk \
	git-core \
	gnupg \
	flex \
	bison \
	gperf \
	build-essential \
	zip \
	curl \
	zlib1g-dev \
	gcc-multilib \
	g++-multilib \
	libc6-dev-i386 \
	lib32ncurses5-dev \
	x11proto-core-dev \
	libx11-dev \
	lib32z-dev \
	ccache \
	libgl1-mesa-dev \
	libxml2-utils \
	xsltproc \
	unzip \
	python \
	cpio \
	locales \
	mkisofs \
	u-boot-tools \
	bc \
	gawk \
	busybox \
	openssh-server \
	vim

ADD	dtc /usr/bin/dtc

RUN	locale-gen en_US.UTF-8
ENV 	LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN	mkdir /var/run/sshd
RUN	echo 'root:root' | chpasswd
RUN	sed -i 's/AcceptEnv LANG LC_*/#AcceptEnv LANG LC_*/g' /etc/ssh/sshd_config
RUN 	sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN 	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME	["/media"]

EXPOSE	22

CMD	["/usr/sbin/sshd", "-D"]
