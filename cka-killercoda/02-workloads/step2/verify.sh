#!/bin/bash
set -e
test "$(kubectl get deploy frontend -n apps -o jsonpath='{.spec.template.spec.containers[0].image}')" = "nginx:1.28"
test "$(kubectl get deploy frontend -n apps -o jsonpath='{.spec.strategy.rollingUpdate.maxUnavailable}')" = "1"
echo "verified"
