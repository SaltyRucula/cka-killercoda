#!/bin/bash
set -e
kubectl get sa auditor -n rbac-lab >/dev/null 2>&1
echo "verified"
