#!/bin/bash
set -e
kubectl get pod bounded -n runtime >/dev/null 2>&1
test "$(kubectl get pod bounded -n runtime -o jsonpath='{.spec.containers[0].resources.requests.cpu}')" = "100m"
test "$(kubectl get pod bounded -n runtime -o jsonpath='{.spec.containers[0].resources.limits.memory}')" = "128Mi"
echo "verified"
