#!/bin/bash
set -e
kubectl get netpol default-deny-egress -n secure-net >/dev/null 2>&1
kubectl get netpol default-deny-egress -n secure-net -o jsonpath='{.spec.policyTypes[*]}' | grep -qw Egress
echo "verified"
