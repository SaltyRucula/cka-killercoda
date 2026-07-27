#!/bin/bash
set -e
test "$(kubectl get node controlplane -o jsonpath='{.metadata.labels.exam}')" = "one"
echo "verified"
