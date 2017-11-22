FROM golang:1.9-alpine3.6

RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk update && apk upgrade

RUN apk add docker@community openrc git openssh
# puts file in /etc/runlevels/...
RUN rc-update add docker default

CMD ["/sbin/rc", "default"]

# Clean APK cache
RUN rm -rf /var/cache/apk/*
