#!/bin/bash
set -e
kubectl get netpol allow-dns -n secure-net >/dev/null 2>&1
kubectl get netpol allow-dns -n secure-net -o json | grep -q '"protocol": "UDP"'
kubectl get netpol allow-dns -n secure-net -o json | grep -q '"port": 53'
echo "verified"
