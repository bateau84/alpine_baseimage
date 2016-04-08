# Alpine baseimage
[![](https://badge.imagelayers.io/bateau/alpine_baseimage:latest.svg)](https://imagelayers.io/?images=bateau/alpine_baseimage:latest 'Get your own badge on imagelayers.io')
Created on alpine:3.3.

Added some features like runit and changeuser script (init.d app). (made by [phusion](https://github.com/phusion/baseimage-docker) )
Also added a startup script to change Uid, Gid and homedir to user "abc". (borrowed from [linuxserver](https://github.com/linuxserver)  

You can use this "abc" user to run your services with setuser command in your init script (located under /etc/service/<app>/run).
Where run is a executable shell script to start the app.  

syslog and logrotate is part of the image. all output to stdout and stderr is forwarded to "console" and can be seen on docker logs <container>.  
The configuration files for logrotate and syslog is located in /etc/*.

##### All Enviroment variables and its defaults:
Can be changed with -e on docker run.  

| Variable | Default | Desc. |
|:---------|:--------|:------|
| PUID | "1000" | To change UID of user to launch Jenkins |
| PGID | "1000" | To change GID of user to launch Jenkins |
| PAGID | "" | To append additional group (like docker group) to user to launch Jenkins |
| PHOME | "/home/abc" | To change home dir of user to launch Jenkins |
| SYSLOGNG_OPTS | "" | To change startup options of SyslogNG |
