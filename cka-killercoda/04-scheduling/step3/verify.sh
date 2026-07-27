#!/bin/bash
set -e
kubectl get node controlplane -o jsonpath='{.spec.taints[*].key}' | grep -qw dedicated
test "$(kubectl get pod tolerant -n schedule -o jsonpath='{.spec.tolerations[?(@.key=="dedicated")].effect}')" = "NoSchedule"
echo "verified"
