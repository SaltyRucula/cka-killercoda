#!/bin/bash
set -e
kubectl get pod ssd-pod -n schedule >/dev/null 2>&1
test "$(kubectl get pod ssd-pod -n schedule -o jsonpath='{.spec.nodeSelector.disk}')" = "ssd"
echo "verified"
