#!/bin/bash
set -e
kubectl get role pod-reader -n rbac-lab >/dev/null 2>&1
kubectl get role pod-reader -n rbac-lab -o jsonpath='{.rules[0].resources[*]}' | grep -qw pods
kubectl get role pod-reader -n rbac-lab -o jsonpath='{.rules[0].verbs[*]}' | grep -qw watch
echo "verified"
