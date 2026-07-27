#!/bin/bash
set -e
test "$(kubectl get pod box -n cka-lab -o jsonpath='{.metadata.labels.app}')" = "box"
test "$(kubectl get pod box -n cka-lab -o jsonpath='{.metadata.labels.tier}')" = "tools"
echo "verified"
