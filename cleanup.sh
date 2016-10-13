#!/bin/bash
#set -e
#set -x

apk del --purge build-base musl-dev linux-pam-dev cracklib-dev fortify-headers

rm -rf /bd_build
rm -rf /tmp/*
rm -rf /var/cache/apk/*
