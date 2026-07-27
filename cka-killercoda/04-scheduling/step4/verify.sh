#!/bin/bash
set -e
kubectl get pod affinity-pod -n schedule >/dev/null 2>&1
kubectl get pod affinity-pod -n schedule -o json | grep -q 'nodeAffinity'
kubectl get pod affinity-pod -n schedule -o json | grep -q '"disk"'
echo "verified"
