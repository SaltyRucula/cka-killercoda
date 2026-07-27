#!/bin/bash
set -e
kubectl get priorityclass critical-medium >/dev/null 2>&1
test "$(kubectl get priorityclass critical-medium -o jsonpath='{.value}')" = "100000"
test "$(kubectl get pod priority-pod -n schedule -o jsonpath='{.spec.priorityClassName}')" = "critical-medium"
echo "verified"
