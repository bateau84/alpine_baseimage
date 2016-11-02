From alpine:edge
MAINTAINER Mats Bergmann <http://github.com/bateau84>

Add . /bd_build

RUN apk add --no-cache --update bash && \
    /bd_build/prepare.sh && \
    /bd_build/system_services.sh && \
    /bd_build/cleanup.sh

CMD ["/sbin/my_init"]
