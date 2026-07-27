#!/bin/bash
set -e
test "$(kubectl get deploy broken -n exam-c -o jsonpath='{.spec.template.spec.serviceAccountName}')" = "runtime-sa"
echo "verified"
