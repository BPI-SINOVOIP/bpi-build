
docker run --privileged -d -p 2227:22 -v /media:/media sinovoip/bpi-build-linux-4.4:ubuntu16.04

ssh -p 2227 root@127.0.0.1 #pw: root
