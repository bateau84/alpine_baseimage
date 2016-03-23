#!/bin/bash
set -e
set -x

## Install syslog-ng
/bd_build/services/syslog-ng/syslog-ng.sh

## User for running services
/bd_build/services/changeuser/changeuser.sh
