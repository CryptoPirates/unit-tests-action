#!/bin/bash

export GOPRIVATE=github.com/cryptopirates

echo "Configuring git"
git config --global url."https://${INPUT_GITUSERNAME}:${INPUT_GITACCESSTOKEN}@github.com".insteadOf "https://github.com"

if [ "${INPUT_REQUIRESTALIB}" == "true" ]; then
    echo "Installing TA-Lib"
    git clone https://github.com/cryptopirates/ta-lib.git
    cd ta-lib
    ./configure --prefix=/usr LDFLAGS="-lm"
    make
    make install
    cd ..
fi

if [ "${INPUT_REQUIRESLIBRDKAFKA}" == "true" ]; then
    echo "Installing librdkafka"
    git clone https://github.com/edenhill/librdkafka.git
    cd librdkafka
    ./configure --install-deps --prefix /usr
    make
    make install
    cd ..
fi

git clone "https://github.com/${GITHUB_REPOSITORY}.git"

IFS='/'
read -ra ADDR <<< "${GITHUB_REPOSITORY}"
IDX=${#ADDR[@]}-1
cd "${ADDR[${IDX}]}"

echo "Getting dependencies"
go get -v -t -d -tags dynamic ./...

echo "Running tests"
go test -v -tags dynamic ./...
