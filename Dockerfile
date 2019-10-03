FROM golang:1.13-buster as builder

RUN go version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
