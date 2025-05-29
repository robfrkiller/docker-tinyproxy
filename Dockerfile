FROM alpine:3.21

RUN sed -i 's!dl-cdn.alpinelinux.org!mirror.twds.com.tw!' /etc/apk/repositories \
    && apk upgrade \
    && apk --update add --no-cache tinyproxy \
    && rm -rf /var/cache/apk/*

COPY tinyproxy.conf /data/tinyproxy.conf

EXPOSE 3128

CMD tinyproxy -d -c /data/tinyproxy.conf
