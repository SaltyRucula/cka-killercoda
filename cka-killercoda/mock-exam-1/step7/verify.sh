#!/bin/bash
set -e
kubectl get pvc shop-data -n exam-a >/dev/null 2>&1
test "$(kubectl get pvc shop-data -n exam-a -o jsonpath='{.spec.resources.requests.storage}')" = "200Mi"
echo "verified"
