#!/bin/bash
set -e
test -f /etc/kubernetes/manifests/cka-static.yaml
kubectl get pod cka-static-controlplane -n kube-system >/dev/null 2>&1
echo "verified"
