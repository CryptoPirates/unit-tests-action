FROM golang:1.13-alpine as builder

RUN apk add --update bash git build-base coreutils

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
