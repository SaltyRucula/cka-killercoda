#!/bin/bash
set -e
kubectl get pod scratch -n storage >/dev/null 2>&1
kubectl get pod scratch -n storage -o json | grep -q 'emptyDir'
test "$(kubectl get pod scratch -n storage -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}')" = "/cache"
echo "verified"
