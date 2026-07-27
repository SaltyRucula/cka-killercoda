#!/bin/bash
set -e
test "$(kubectl get deploy broken -n exam-c -o jsonpath='{.spec.replicas}')" = "3"
echo "verified"
