#!/bin/bash
set -e
kubectl get deploy api -n net >/dev/null 2>&1
test "$(kubectl get deploy api -n net -o jsonpath='{.spec.replicas}')" = "2"
test "$(kubectl get deploy api -n net -o jsonpath='{.spec.template.metadata.labels.app}')" = "api"
echo "verified"
