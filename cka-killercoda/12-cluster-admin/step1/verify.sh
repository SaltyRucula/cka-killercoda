#!/bin/bash
set -e
kubectl config get-contexts cka-admin >/dev/null 2>&1
test "$(kubectl config view -o jsonpath='{.contexts[?(@.name=="cka-admin")].context.namespace}')" = kube-system
echo "verified"
