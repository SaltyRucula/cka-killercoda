#!/bin/bash
set -euo pipefail

kubectl get pod secret-env >/dev/null 2>&1
kubectl wait --for=condition=Ready pod/secret-env --timeout=60s >/dev/null

test "$(kubectl exec secret-env -- printenv USERNAME)" = "admin"
test "$(kubectl exec secret-env -- printenv PASSWORD)" = "s3cr3t"

username_ref="$(kubectl get pod secret-env -o jsonpath='{.spec.containers[0].env[?(@.name=="USERNAME")].valueFrom.secretKeyRef.name}')"
password_ref="$(kubectl get pod secret-env -o jsonpath='{.spec.containers[0].env[?(@.name=="PASSWORD")].valueFrom.secretKeyRef.name}')"
username_key="$(kubectl get pod secret-env -o jsonpath='{.spec.containers[0].env[?(@.name=="USERNAME")].valueFrom.secretKeyRef.key}')"
password_key="$(kubectl get pod secret-env -o jsonpath='{.spec.containers[0].env[?(@.name=="PASSWORD")].valueFrom.secretKeyRef.key}')"

test "$username_ref" = "db-secret"
test "$password_ref" = "db-secret"
test "$username_key" = "username"
test "$password_key" = "password"

echo "verified"
