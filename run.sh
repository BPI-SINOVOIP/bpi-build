docker run --privileged --pid=host -it -v /media:/media -v /etc/localtime:/etc/localtime -v /dev:/dev -v /proc:/proc -v /tmp:/tmp sinovoip/bpi-build-v2h-yocto:ubuntu20.04 /bin/bash
