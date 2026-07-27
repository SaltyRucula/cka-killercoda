#!/bin/bash
set -e
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')" = "50m"
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')" = "128Mi"
echo "verified"
