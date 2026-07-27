#!/bin/bash
set -e
kubectl get svc shop-svc -n exam-a >/dev/null 2>&1
test "$(kubectl get svc shop-svc -n exam-a -o jsonpath='{.spec.selector.app}')" = "shop"
echo "verified"
