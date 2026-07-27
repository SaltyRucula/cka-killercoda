#!/bin/bash
set -e
kubectl get rolebinding auditor-read -n rbac-lab >/dev/null 2>&1
test "$(kubectl get rolebinding auditor-read -n rbac-lab -o jsonpath='{.roleRef.name}')" = "pod-reader"
test "$(kubectl get rolebinding auditor-read -n rbac-lab -o jsonpath='{.subjects[0].name}')" = "auditor"
echo "verified"
