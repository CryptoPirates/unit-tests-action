FROM colinc86/bpc-base:latest

RUN apk add --update bash git build-base coreutils

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
