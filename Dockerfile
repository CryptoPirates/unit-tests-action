FROM golang:1.13-alpine as builder

RUN apk add --update make bash git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
