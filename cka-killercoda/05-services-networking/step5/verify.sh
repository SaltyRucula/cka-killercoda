#!/bin/bash
set -e
kubectl get svc docs-external -n net >/dev/null 2>&1
test "$(kubectl get svc docs-external -n net -o jsonpath='{.spec.type}')" = "ExternalName"
test "$(kubectl get svc docs-external -n net -o jsonpath='{.spec.externalName}')" = "kubernetes.io"
echo "verified"
