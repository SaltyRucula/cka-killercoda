#!/bin/bash
set -e
kubectl get pvc cka-claim -n storage >/dev/null 2>&1
test "$(kubectl get pvc cka-claim -n storage -o jsonpath='{.spec.resources.requests.storage}')" = "500Mi"
test "$(kubectl get pvc cka-claim -n storage -o jsonpath='{.spec.storageClassName}')" = "manual"
echo "verified"
