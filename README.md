# Alpine baseimage
Created on alpine:edge.

Added some features like runit and my_init.d script. (made by [phusion](https://github.com/phusion/baseimage-docker))
Also added a startup script to change Uid, Gid and homedir to user "abc". (borrowed from [linuxserver](https://github.com/linuxserver)) added posibility to add additional group GAID

You can use this "abc" user to run your services with setuser command in your init script (located under /etc/service/<app>/run).
Where run is a executable shell script to start the app.  

syslog and logrotate is part of the image. all output to stdout and stderr is forwarded to "console" and can be seen with docker logs <container>.  
The configuration files for logrotate and syslog is located in /etc/*.  

##### All Enviroment variables and its defaults:
Can be changed with -e on docker run.  

| Variable | Default | Desc. |
|:---------|:--------|:------|
| PUID | "1000" | To change UID of user "abc" to launch application(s) |
| PGID | "1000" | To change GID of user "abc" to launch application(s) |
| PAGID | "" | To append additional group (like docker group) to user "abc" to launch application(s) |
| PHOME | "/home/abc" | To change home dir of user "abc" to launch application(s) |
| SYSLOGNG_OPTS | "" | To change startup options of SyslogNG |
