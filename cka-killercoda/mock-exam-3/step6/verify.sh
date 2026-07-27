#!/bin/bash
set -e
test "$(kubectl get priorityclass exam-high -o jsonpath='{.value}')" = "50000"
test "$(kubectl get deploy broken -n exam-c -o jsonpath='{.spec.template.spec.priorityClassName}')" = "exam-high"
echo "verified"
