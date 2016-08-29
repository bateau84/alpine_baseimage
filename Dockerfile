From alpine:edge

Add . /bd_build

RUN apk add --update bash && \
    /bd_build/prepare.sh && \
    /bd_build/system_services.sh && \
    /bd_build/cleanup.sh

CMD ["/sbin/my_init"]
