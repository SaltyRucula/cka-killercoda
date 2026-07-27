#!/bin/bash
set -e
test -n "$(kubectl get endpoints orphan-svc -n exam-c -o jsonpath='{.subsets[0].addresses[0].ip}' 2>/dev/null)"
echo "verified"
