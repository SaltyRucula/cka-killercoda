#!/bin/bash
set -e
kubectl get pod sidecar-demo -n multi >/dev/null 2>&1
test "$(kubectl get pod sidecar-demo -n multi -o jsonpath='{.spec.containers[0].name}')" = "writer"
test "$(kubectl get pod sidecar-demo -n multi -o jsonpath='{.spec.containers[1].name}')" = "reader"
echo "verified"
