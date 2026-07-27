#!/bin/bash
set -e
kubectl get pod web -n cka-lab >/dev/null 2>&1
test "$(kubectl get pod web -n cka-lab -o jsonpath='{.spec.containers[0].image}')" = "nginx:1.27"
test "$(kubectl get pod web -n cka-lab -o jsonpath='{.metadata.labels.app}')" = "web"
echo "verified"
