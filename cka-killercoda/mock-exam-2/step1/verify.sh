#!/bin/bash
set -e
kubectl get pod worker -n exam-b >/dev/null 2>&1
test "$(kubectl get pod worker -n exam-b -o jsonpath='{.metadata.labels.role}')" = "worker"
echo "verified"
