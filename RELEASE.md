## How to release a new version


```
ver=v0.0.2
gsed -i "s/0.0.[0-9]/${ver#v}/" plugins/ing.yaml
git tag $ver
git push origin HEAD --tags
```