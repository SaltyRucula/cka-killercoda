#!/bin/bash
set -e
test "$(kubectl get pod box -n cka-lab -o jsonpath='{.metadata.annotations.owner}')" = "platform"
echo "verified"
