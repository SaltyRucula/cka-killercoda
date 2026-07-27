#!/bin/bash
set -e
kubectl get svc api-node -n net >/dev/null 2>&1
test "$(kubectl get svc api-node -n net -o jsonpath='{.spec.type}')" = "NodePort"
test "$(kubectl get svc api-node -n net -o jsonpath='{.spec.ports[0].port}')" = "8080"
test "$(kubectl get svc api-node -n net -o jsonpath='{.spec.ports[0].targetPort}')" = "80"
echo "verified"
