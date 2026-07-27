#!/bin/bash
set -e
test "$(kubectl get pod crashy -n troubleshoot -o jsonpath='{.spec.containers[0].args[0]}')" = "3600"
echo "verified"
