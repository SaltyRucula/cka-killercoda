#!/bin/bash
set -e
test "$(kubectl get pod probe-web -n runtime -o jsonpath='{.spec.containers[0].livenessProbe.httpGet.path}')" = "/"
test "$(kubectl get pod probe-web -n runtime -o jsonpath='{.spec.containers[0].livenessProbe.periodSeconds}')" = "10"
echo "verified"
