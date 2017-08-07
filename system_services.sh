#!/bin/bash
#set -e
#set -x

## Install runit
/bd_build/services/runit/runit.sh

## Install dron
/bd_build/services/dcron/dcron.sh

## User for running services
/bd_build/services/changeuser/changeuser.sh
