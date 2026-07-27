#!/bin/bash
set -e
kubectl get role cm-editor -n exam-b >/dev/null 2>&1
kubectl get role cm-editor -n exam-b -o jsonpath='{.rules[0].resources[*]}' | grep -qw configmaps
echo "verified"
