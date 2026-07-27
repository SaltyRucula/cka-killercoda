#!/bin/bash
set -e
kubectl get netpol deny-all -n exam-a >/dev/null 2>&1
kubectl get netpol deny-all -n exam-a -o jsonpath='{.spec.policyTypes[*]}' | grep -qw Ingress
echo "verified"
