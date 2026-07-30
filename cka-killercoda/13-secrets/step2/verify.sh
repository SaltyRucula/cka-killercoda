#!/bin/bash
set -euo pipefail

encoded="$(kubectl get secret db-secret -o jsonpath='{.data.password}')"
test -n "$encoded"
test "$(printf '%s' "$encoded" | base64 -d)" = "s3cr3t"

echo "verified"
