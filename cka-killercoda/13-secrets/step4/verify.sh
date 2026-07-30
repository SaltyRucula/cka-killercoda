#!/bin/bash
set -euo pipefail

kubectl get pod secret-files >/dev/null 2>&1
kubectl wait --for=condition=Ready pod/secret-files --timeout=60s >/dev/null

test "$(kubectl exec secret-files -- cat /etc/creds/username)" = "admin"
test "$(kubectl exec secret-files -- cat /etc/creds/password)" = "s3cr3t"

test "$(kubectl get pod secret-files -o jsonpath='{.spec.volumes[?(@.secret.secretName=="db-secret")].secret.secretName}')" = "db-secret"
mount_path="$(kubectl get pod secret-files -o jsonpath='{.spec.containers[0].volumeMounts[?(@.mountPath=="/etc/creds")].mountPath}')"
read_only="$(kubectl get pod secret-files -o jsonpath='{.spec.containers[0].volumeMounts[?(@.mountPath=="/etc/creds")].readOnly}')"
test "$mount_path" = "/etc/creds"
test "$read_only" = "true"

echo "verified"
