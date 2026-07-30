#!/bin/bash
set -euo pipefail

kubectl get secret db-secret >/dev/null 2>&1

test "$(kubectl get secret db-secret -o jsonpath='{.type}')" = "Opaque"
test "$(kubectl get secret db-secret -o go-template='{{len .data}}')" = "2"
test "$(kubectl get secret db-secret -o jsonpath='{.data.username}' | base64 -d)" = "admin"
test "$(kubectl get secret db-secret -o jsonpath='{.data.password}' | base64 -d)" = "s3cr3t"

echo "verified"
