FROM docker.pkg.github.com/cryptopirates/ta-lib/golang-talib-kafka:1.0 as base

RUN apk add --update bash git build-base coreutils

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
