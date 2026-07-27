#!/bin/bash
set -e
kubectl get netpol default-deny-ingress -n secure-net >/dev/null 2>&1
test "$(kubectl get netpol default-deny-ingress -n secure-net -o jsonpath='{.spec.policyTypes[0]}')" = "Ingress"
test "$(kubectl get netpol default-deny-ingress -n secure-net -o jsonpath='{.spec.podSelector}')" = 'map[]'
echo "verified"
