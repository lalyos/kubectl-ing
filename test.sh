#!/bin/bash

kubectl krew uninstall ing

# create gh release like dir and targz
VER=$(git describe --tags --abbrev=0)
tmpdir=kubectl-ing-${VER#v}
mkdir $tmpdir
cp kubectl-ing $tmpdir
tar -czvf x.tar.gz $tmpdir

# calc sha
HASH=$(shasum -a 256 < x.tar.gz | head -c 64)
gsed -i "s/sha256:.*/sha256: $HASH/" plugins/ing.yaml

# install from local files
kubectl krew install --manifest=./plugins/ing.yaml --archive x.tar.gz

# clean
rm -rf $tmpdir
rm x.tar.gz
git restore plugins/ing.yaml