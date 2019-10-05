#!/bin/bash

export GOPRIVATE=github.com/cryptopirates

echo "Configuring git"
git config --global user.email "colinc86@gmail.com"
git config --global user.name "Colin Campbell"
git config --global url."https://${INPUT_GITUSERNAME}:${INPUT_GITACCESSTOKEN}@github.com".insteadOf "https://github.com"

if [ "${INPUT_REQUIRESTALIB}" == "true" ]; then
    echo "Installing TA-Lib"
    git clone https://github.com/cryptopirates/ta-lib.git
    cd ta-lib
    git checkout -b gh-actions-alpine2-latest
    ./configure
    make
    git add .
    git commit -m "Update build binaries."
    git push --set-upstream origin gh-actions-alpine2-latest
    # make install
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
go test -v
