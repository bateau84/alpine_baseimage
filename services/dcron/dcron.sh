#!/bin/bash
set -e
set -x


apk add --no-cache dcron

mkdir -p /etc/service/dcron
cp /bd_build/services/dcron/dcron.runit /etc/service/dcron/run
