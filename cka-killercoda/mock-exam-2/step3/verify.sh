#!/bin/bash
set -e
test "$(kubectl get pod worker -n exam-b -o jsonpath='{.spec.containers[0].env[?(@.name=="TOKEN")].valueFrom.secretKeyRef.name}')" = "api-secret"
echo "verified"
