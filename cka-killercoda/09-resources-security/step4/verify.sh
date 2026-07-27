#!/bin/bash
set -e
kubectl get pod probe-web -n runtime >/dev/null 2>&1
test "$(kubectl get pod probe-web -n runtime -o jsonpath='{.spec.containers[0].readinessProbe.httpGet.path}')" = "/"
test "$(kubectl get pod probe-web -n runtime -o jsonpath='{.spec.containers[0].readinessProbe.initialDelaySeconds}')" = "2"
echo "verified"
