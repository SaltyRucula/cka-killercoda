#!/bin/bash
set -e
kubectl get sa shop-sa -n exam-a >/dev/null 2>&1
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.template.spec.serviceAccountName}')" = "shop-sa"
echo "verified"
