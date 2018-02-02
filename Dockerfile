FROM alpine:3.7

ADD . /bd_build

RUN apk add --update bash
RUN bd_build/prepare.sh && \
    bd_build/system_services.sh && \
    bd_build/cleanup.sh

CMD ["/sbin/my_init"]
