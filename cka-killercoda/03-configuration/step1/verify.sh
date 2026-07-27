#!/bin/bash
set -e
kubectl create ns config --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl get cm app-config -n config >/dev/null 2>&1
test "$(kubectl get cm app-config -n config -o jsonpath='{.data.MODE}')" = "production"
test "$(kubectl get cm app-config -n config -o jsonpath='{.data.LOG_LEVEL}')" = "info"
echo "verified"
