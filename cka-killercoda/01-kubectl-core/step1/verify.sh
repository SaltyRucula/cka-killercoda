#!/bin/bash
set -e
kubectl get ns cka-lab >/dev/null 2>&1
kubectl get pod box -n cka-lab >/dev/null 2>&1
test "$(kubectl get pod box -n cka-lab -o jsonpath='{.spec.containers[0].image}')" = "busybox:1.36"
test "$(kubectl get pod box -n cka-lab -o jsonpath='{.spec.containers[0].args[0]}')" = "3600"
echo "verified"
