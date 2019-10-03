#!/bin/sh

export GOPRIVATE=github.com/cryptopirates

echo "Configuring git"
echo "argument 1" $0
echo "argument 2" $1
git config --global url."https://${INPUT_USERNAME}:${INPUT_ACCESSTOKEN}@github.com".insteadOf "https://github.com"

if [ $INPUT_REQUIRESTALIB = "true" ]; then
    echo "Installing TA-Lib"
    git clone https://github.com/cryptopirates/ta-lib.git
    cd ta-lib
    # git checkout gh-actions-alpine-latest
    ./configure --prefix=/usr
    make
    make install
fi

git clone "https://github.com/cryptopirates/${INPUT_REPOSITORYNAME}.git"
cd $INPUT_REPOSITORYNAME

echo "Getting dependencies"
go get -v -t -d ./...

echo "Running tests"
go test -v
