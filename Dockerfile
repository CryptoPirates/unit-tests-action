FROM docker.pkg.github.com/cryptopirates/ta-lib/golang-talib-kafka:1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
