FROM docker.pkg.github.com/cryptopirates/bpc-base-image/bpc-base:0.1.0

RUN apk add --update bash git build-base coreutils

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
