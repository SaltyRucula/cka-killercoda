#!/bin/bash
set -e
test "$(kubectl get svc health-node -n exam-b -o jsonpath='{.spec.type}')" = "NodePort"
test "$(kubectl get svc health-node -n exam-b -o jsonpath='{.spec.selector.app}')" = "health"
echo "verified"
