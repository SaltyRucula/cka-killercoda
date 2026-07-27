#!/bin/bash
set -e
kubectl get pod never-restart -n multi >/dev/null 2>&1
test "$(kubectl get pod never-restart -n multi -o jsonpath='{.spec.restartPolicy}')" = "Never"
echo "verified"
