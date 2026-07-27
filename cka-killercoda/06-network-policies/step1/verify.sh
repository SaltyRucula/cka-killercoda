#!/bin/bash
set -e
kubectl get ns secure-net >/dev/null 2>&1
test "$(kubectl get ns secure-net -o jsonpath='{.metadata.labels.purpose}')" = "secure"
echo "verified"
