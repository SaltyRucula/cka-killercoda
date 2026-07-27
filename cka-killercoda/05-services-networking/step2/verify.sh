#!/bin/bash
set -e
kubectl get svc api-svc -n net >/dev/null 2>&1
test "$(kubectl get svc api-svc -n net -o jsonpath='{.spec.type}')" = "ClusterIP"
test "$(kubectl get svc api-svc -n net -o jsonpath='{.spec.selector.app}')" = "api"
test "$(kubectl get svc api-svc -n net -o jsonpath='{.spec.ports[0].port}')" = "80"
echo "verified"
