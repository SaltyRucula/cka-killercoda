#!/bin/bash
set -e
kubectl get node controlplane -o json | grep -q '"key": "exam"'
kubectl get deploy broken -n exam-c -o json | grep -q '"key": "exam"'
echo "verified"
