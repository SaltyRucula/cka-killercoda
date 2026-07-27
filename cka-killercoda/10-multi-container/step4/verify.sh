#!/bin/bash
set -e
kubectl get pod shared-process -n multi >/dev/null 2>&1
test "$(kubectl get pod shared-process -n multi -o jsonpath='{.spec.shareProcessNamespace}')" = "true"
echo "verified"
