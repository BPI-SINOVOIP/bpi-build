
docker run --privileged -d -p 2222:22 -v /media:/media sinovoip/bpi-build-android-5.1:ubuntu14.04

ssh -p 2222 root@127.0.0.1 #pw: root
