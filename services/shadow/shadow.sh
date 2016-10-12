#!/bin/bash
set -e
set -x

cd /tmp/

wget -O /tmp/shadow-4.2.1.tar.xz http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz
tar -xvf shadow-4.2.1.tar.xz

cd /tmp/shadow-4.2.1/
./configure
make
make install
