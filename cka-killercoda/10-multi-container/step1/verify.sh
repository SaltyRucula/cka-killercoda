#!/bin/bash
set -e
kubectl get pod init-demo -n multi >/dev/null 2>&1
test "$(kubectl get pod init-demo -n multi -o jsonpath='{.spec.initContainers[0].name}')" = "init"
kubectl get pod init-demo -n multi -o json | grep -q 'emptyDir'
echo "verified"
