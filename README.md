# Alpine baseimage
[![](https://badge.imagelayers.io/bateau/alpine_baseimage:latest.svg)](https://imagelayers.io/?images=bateau/alpine_baseimage:latest 'Get your own badge on imagelayers.io')
Created on alpine:3.3.

Added some features like runit (init.d app). (made by [!(https://github.com/phusion/baseimage-docker)](phusion) )
Also added a startup script to change Uid, Gid and homedir to user "abc".
You can use this user to run your services with setuser command in your init script (located under /etc/service/<app>/run).
Where run is a executable shell script.
syslog and logrotate is part of the image. all output to stdout and stderr is forwarded to "console" and can be seen on docker logs <container>.
The configuration files for logrotate and syslog is located in /etc/*.
