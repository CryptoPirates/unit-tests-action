#!/bin/bash

export GOPRIVATE=github.com/cryptopirates

echo "Configuring git"
git config --global url."https://${INPUT_GITUSERNAME}:${INPUT_GITACCESSTOKEN}@github.com".insteadOf "https://github.com"

if [ "${INPUT_REQUIRESTALIB}" == "true" ]; then
    echo "Installing TA-Lib"
    git clone https://github.com/cryptopirates/ta-lib.git
    cd ta-lib
    git checkout gh-actions-alpine2-latest
    make install
    cd ..
fi

if [ "${INPUT_REQUIRESLIBRDKAFKA}" == "true" ]; then
    echo "Installing librdkafka-dev"
    git clone https://github.com/edenhill/librdkafka.git
    cd librdkafka
    ./configure --install-deps
    make
    sudo make install
    cd ..
fi

git clone "https://github.com/${GITHUB_REPOSITORY}.git"

IFS='/'
read -ra ADDR <<< "${GITHUB_REPOSITORY}"
IDX=${#ADDR[@]}-1
cd "${ADDR[${IDX}]}"

echo "Getting dependencies"
go get -v -t -d ./...

echo "Running tests"
go test -v ./...
