#!/bin/bash
set -e
kubectl get pod dual-web -n multi >/dev/null 2>&1
test "$(kubectl get pod dual-web -n multi -o jsonpath='{.spec.containers[0].ports[0].containerPort}')" = "80"
test "$(kubectl get pod dual-web -n multi -o jsonpath='{.spec.containers[1].ports[0].containerPort}')" = "9090"
echo "verified"
