#!/bin/bash
set -e
kubectl get pod audit-shell -n rbac-lab >/dev/null 2>&1
test "$(kubectl get pod audit-shell -n rbac-lab -o jsonpath='{.spec.serviceAccountName}')" = "auditor"
echo "verified"
