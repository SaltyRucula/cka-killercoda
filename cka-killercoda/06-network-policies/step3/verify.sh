#!/bin/bash
set -e
kubectl get netpol allow-frontend -n secure-net >/dev/null 2>&1
test "$(kubectl get netpol allow-frontend -n secure-net -o jsonpath='{.spec.podSelector.matchLabels.app}')" = "backend"
kubectl get netpol allow-frontend -n secure-net -o json | grep -q 'frontend'
kubectl get netpol allow-frontend -n secure-net -o json | grep -q '8080'
echo "verified"
