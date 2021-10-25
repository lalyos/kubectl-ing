#!/bin/bash

VER=$(git describe --tags --abbrev=0)
PATCH=${VER##*.}
MINOR=${VER%.*}
: $((PATCH++))
NEWVER=$MINOR.$PATCH

git tag $NEWVER
git push origin HEAD --tags

HASH=$(curl -sL https://github.com/lalyos/kubectl-ing/archive/${NEWVER}.tar.gz| shasum -a 256 | head -c 64)
gsed -i "s/sha256:.*/sha256: $HASH/" plugins/ing.yaml
git commit -am "updated SHA for $NEWVER"
git push origin HEAD