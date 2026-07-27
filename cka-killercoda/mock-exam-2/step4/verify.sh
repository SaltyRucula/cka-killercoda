#!/bin/bash
set -e
test "$(kubectl get node controlplane -o jsonpath='{.metadata.labels.workload}')" = "batch"
test "$(kubectl get pod worker -n exam-b -o jsonpath='{.spec.nodeSelector.workload}')" = "batch"
echo "verified"
