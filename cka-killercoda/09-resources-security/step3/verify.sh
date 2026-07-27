#!/bin/bash
set -e
kubectl get pod locked -n runtime >/dev/null 2>&1
test "$(kubectl get pod locked -n runtime -o jsonpath='{.spec.containers[0].securityContext.readOnlyRootFilesystem}')" = "true"
echo "verified"
