#!/bin/bash
set -e
kubectl get cm banner -n exam-c >/dev/null 2>&1
kubectl get deploy broken -n exam-c -o json | grep -q 'banner'
test "$(kubectl get deploy broken -n exam-c -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[0].mountPath}')" = "/etc/banner"
echo "verified"
