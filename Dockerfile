FROM alpine:latest

RUN sed -i 's!dl-cdn.alpinelinux.org!alpine.ccns.ncku.edu.tw!; s!v3\.13!edge!' /etc/apk/repositories \
    && apk upgrade \
    && apk --update add --no-cache tinyproxy \
    && rm -rf /var/cache/apk/*

COPY tinyproxy.conf /data/tinyproxy.conf

EXPOSE 3128

CMD tinyproxy -d -c /data/tinyproxy.conf
