#!/bin/bash
set -e
kubectl get pod config-reader -n config >/dev/null 2>&1
test "$(kubectl get pod config-reader -n config -o jsonpath='{.spec.containers[0].envFrom[0].configMapRef.name}')" = "app-config"
echo "verified"
