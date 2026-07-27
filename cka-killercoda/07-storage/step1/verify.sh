#!/bin/bash
set -e
kubectl get pv cka-pv >/dev/null 2>&1
test "$(kubectl get pv cka-pv -o jsonpath='{.spec.capacity.storage}')" = "1Gi"
test "$(kubectl get pv cka-pv -o jsonpath='{.spec.storageClassName}')" = "manual"
test "$(kubectl get pv cka-pv -o jsonpath='{.spec.hostPath.path}')" = "/mnt/cka-data"
echo "verified"
