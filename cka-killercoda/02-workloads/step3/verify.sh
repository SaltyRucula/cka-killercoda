#!/bin/bash
set -e
test "$(kubectl get deploy frontend -n apps -o jsonpath='{.spec.replicas}')" = "5"
echo "verified"
