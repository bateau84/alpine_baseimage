#!/bin/bash
set -e
set -x

BUILD_DIR=/bd_build

# Install tools
apk --no-cache add shadow --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# Create user
adduser -D -u 1000 -s /bin/bash abc
addgroup abc users

# Copy script
cp $BUILD_DIR/services/changeuser/changeuser.init /etc/my_init.d/10-changeuser.sh
