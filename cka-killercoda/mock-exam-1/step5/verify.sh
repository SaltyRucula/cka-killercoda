#!/bin/bash
set -e
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.template.spec.containers[0].image}')" = "nginx:1.28"
test "$(kubectl get deploy shop -n exam-a -o jsonpath='{.spec.strategy.rollingUpdate.maxSurge}')" = "1"
echo "verified"
