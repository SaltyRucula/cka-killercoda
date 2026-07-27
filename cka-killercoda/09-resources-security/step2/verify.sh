#!/bin/bash
set -e
kubectl get pod nonroot -n runtime >/dev/null 2>&1
test "$(kubectl get pod nonroot -n runtime -o jsonpath='{.spec.securityContext.runAsUser}')" = "101"
test "$(kubectl get pod nonroot -n runtime -o jsonpath='{.spec.securityContext.runAsNonRoot}')" = "true"
echo "verified"
