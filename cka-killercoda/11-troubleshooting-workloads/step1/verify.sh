#!/bin/bash
set -e
test "$(kubectl get deploy broken-image -n troubleshoot -o jsonpath='{.spec.template.spec.containers[0].image}')" = "nginx:1.27"
echo "verified"
