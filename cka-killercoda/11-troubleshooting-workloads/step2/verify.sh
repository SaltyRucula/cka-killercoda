#!/bin/bash
set -e
test "$(kubectl get svc web-svc -n troubleshoot -o jsonpath='{.spec.selector.app}')" = "wrong"
echo "verified"
