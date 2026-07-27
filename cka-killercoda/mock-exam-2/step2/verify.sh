#!/bin/bash
set -e
test "$(kubectl get secret api-secret -n exam-b -o jsonpath="{.data.token}" | base64 -d)" = supersecret
echo "verified"
