# android
docker run --privileged -it -hostname android -v /media:/media -v /etc/localtime:/etc/localtime sinovoip/bpi-build-android-11:ubuntu20.04 /bin/bash

# linux
docker run --privileged -it -v /media:/media -v /etc/localtime:/etc/localtime -v /dev:/dev -v /proc:/proc -v /tmp:/tmp sinovoip/bpi-build-android-11:ubuntu20.04 /bin/bash
