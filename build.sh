# android
#docker build -t sinovoip/bpi-build-android-11:ubuntu20.04 --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` .

# linux
docker build -t sinovoip/bpi-build-rk-linux:ubuntu20.04 --build-arg USER_ID=`id -u` --build-arg GROUP_ID=`id -g` .
