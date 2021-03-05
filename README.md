This is a kubectl plugin to help generate Ingress manifest for a svc in the actual namespace.

## Usage

first [install krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/) which is a kubectl pluginmanager

Then add this repo as a custom index, and install the plugin
```
kubectl krew index add lly https://github.com/lalyos/kubectl-ing

kubectl krew install lly/ing
```