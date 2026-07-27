#!/bin/bash
set -e
test "$(kubectl get pdb broken-pdb -n exam-c -o jsonpath='{.spec.minAvailable}')" = "2"
echo "verified"
