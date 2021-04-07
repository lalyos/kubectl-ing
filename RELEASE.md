## How to release a new version


```
ver=v0.0.2
gsed -i "s/0.0.[0-9]/${ver#v}/" plugins/ing.yaml
git commit -am "version: $ver"
git tag $ver
git push origin HEAD --tags
SHA=$(curl -sL https://github.com/lalyos/kubectl-ing/archive/${ver}.tar.gz | shasum -a 256)
gsed -i "s/sha256: .*/sha256: $SHA/" plugins/ing.yaml

```