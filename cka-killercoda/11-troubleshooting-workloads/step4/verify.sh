#!/bin/bash
set -e
test "$(kubectl get deploy no-service-match -n troubleshoot -o jsonpath='{.spec.template.spec.containers[0].readinessProbe.httpGet.path}')" = "/"
test "$(kubectl get deploy no-service-match -n troubleshoot -o jsonpath='{.spec.template.spec.containers[0].readinessProbe.httpGet.port}')" = "80"
echo "verified"
