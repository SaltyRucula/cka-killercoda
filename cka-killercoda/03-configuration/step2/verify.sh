#!/bin/bash
set -e
kubectl get secret db-secret -n config >/dev/null 2>&1
test "$(kubectl get secret db-secret -n config -o jsonpath="{.data.username}" | base64 -d)" = admin
test "$(kubectl get secret db-secret -n config -o jsonpath="{.data.password}" | base64 -d)" = cka123
echo "verified"
