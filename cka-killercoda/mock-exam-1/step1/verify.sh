#!/bin/bash
set -e
kubectl get deploy shop -n exam-a >/dev/null 2>&1
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.replicas}')" = "4"
echo "verified"
