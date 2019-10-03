#!/bin/sh

export GOPRIVATE=github.com/cryptopirates

echo "Configuring git"
git config --global user.email "colinc86@gmail.com"
git config --global user.name "Colin Campbell"
git config --global url."https://${INPUT_USERNAME}:${INPUT_ACCESSTOKEN}@github.com".insteadOf "https://github.com"

if [ $INPUT_REQUIRESTALIB = "true" ]; then
    echo "Installing TA-Lib"
    git clone https://github.com/cryptopirates/ta-lib.git
    cd ta-lib
    git checkout gh-actions-buster-latest
    ./configure-lm --prefix=/usr
    make
    git add .
    git commit -m "Use math libraries."
    git push
    # make install
fi

git clone "https://github.com/cryptopirates/${INPUT_REPOSITORYNAME}.git"
cd $INPUT_REPOSITORYNAME

echo "Getting dependencies"
go get -v -t -d ./...

echo "Running tests"
go test -v
