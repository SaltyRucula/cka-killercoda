#!/bin/bash
set -e
test "$(kubectl get node controlplane -o jsonpath='{.spec.unschedulable}')" != true
echo "verified"
