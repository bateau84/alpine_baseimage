#!/bin/bash
set -e
set -x

## Install shadow 
/bd_build/services/shadow/shadow.sh

## Install runit
/bd_build/services/runit/runit.sh

## Install syslog-ng
/bd_build/services/syslog-ng/syslog-ng.sh

## User for running services
/bd_build/services/changeuser/changeuser.sh
