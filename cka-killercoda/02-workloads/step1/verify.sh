#!/bin/bash
set -e
kubectl create ns apps --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl get deploy frontend -n apps >/dev/null 2>&1
test "$(kubectl get deploy frontend -n apps -o jsonpath='{.spec.replicas}')" = "3"
test "$(kubectl get deploy frontend -n apps -o jsonpath='{.spec.template.spec.containers[0].image}')" = "nginx:1.27"
echo "verified"
