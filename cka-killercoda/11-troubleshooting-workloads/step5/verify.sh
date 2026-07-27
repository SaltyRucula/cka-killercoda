#!/bin/bash
set -e
test "$(kubectl get cm diagnosis -n troubleshoot -o jsonpath='{.data.result}')" = "healthy"
echo "verified"
