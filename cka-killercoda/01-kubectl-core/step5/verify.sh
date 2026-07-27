#!/bin/bash
set -e
! kubectl get pod box -n cka-lab >/dev/null 2>&1
kubectl get pod web -n cka-lab >/dev/null 2>&1
echo "verified"
