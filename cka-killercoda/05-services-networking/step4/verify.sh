#!/bin/bash
set -e
kubectl get svc api-headless -n net >/dev/null 2>&1
test "$(kubectl get svc api-headless -n net -o jsonpath='{.spec.clusterIP}')" = "None"
test "$(kubectl get svc api-headless -n net -o jsonpath='{.spec.selector.app}')" = "api"
echo "verified"
