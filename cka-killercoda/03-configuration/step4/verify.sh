#!/bin/bash
set -e
test "$(kubectl get pod config-reader -n config -o jsonpath='{.spec.containers[0].env[?(@.name=="DB_USER")].valueFrom.secretKeyRef.name}')" = "db-secret"
test "$(kubectl get pod config-reader -n config -o jsonpath='{.spec.containers[0].env[?(@.name=="DB_USER")].valueFrom.secretKeyRef.key}')" = "username"
echo "verified"
