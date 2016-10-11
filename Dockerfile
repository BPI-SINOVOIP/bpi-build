FROM	ubuntu:12.04.5
MAINTAINER	BPI  "BPI-SINOVOIP"

# Install Java.
RUN     apt-get update && apt-get install -y \
        python-software-properties \
        ca-certificates

RUN \
	echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  	add-apt-repository -y ppa:webupd8team/java && \
  	apt-get update && \
  	apt-get install -y oracle-java6-installer && \
  	rm -rf /var/lib/apt/lists/* && \
  	rm -rf /var/cache/oracle-jdk6-installer

# Define commonly used JAVA_HOME variable
ENV	JAVA_HOME /usr/lib/jvm/java-6-oracle

RUN     apt-get update && apt-get install -y \
        apt-utils \
	cpp-4.6 \
	gcc-4.6 \
	g++-4.6 \
	gcc-4.6-multilib \
	g++-4.6-multilib \
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

