#!/bin/bash
#set -e
#set -x

apk update
apk upgrade
#apk --no-cache add runit --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
apk --no-cache add python3 alpine-conf wget build-base

## Remove group ping
delgroup ping

## Set correct timezone
setup-timezone -z Europe/Oslo

## Install my_init
cp /bd_build/bin/my_init /sbin/my_init
chmod +x /sbin/my_init
mkdir -p /etc/default/syslog-ng
mkdir -p /etc/service
mkdir -p /etc/my_init.d
mkdir -p /etc/container_environment
touch /etc/container_environment.sh
touch /etc/container_environment.json 
chmod 700 /etc/container_environment
addgroup -g 8377 docker_env
chown :docker_env /etc/container_environment.sh /etc/container_environment.json
chmod 640 /etc/container_environment.sh /etc/container_environment.json
ln -s /etc/container_environment.sh /etc/profile.d/

## Install setuser script
cp /bd_build/bin/setuser /bin/setuser
