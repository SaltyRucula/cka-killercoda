#!/bin/bash
set -e
kubectl get job exam-job -n exam-a >/dev/null 2>&1
kubectl get job exam-job -n exam-a -o yaml | grep -q passed
echo "verified"
