#!/bin/bash
set -e
kubectl get pod pvc-user -n storage >/dev/null 2>&1
test "$(kubectl get pod pvc-user -n storage -o jsonpath='{.spec.volumes[0].persistentVolumeClaim.claimName}')" = "cka-claim"
test "$(kubectl get pod pvc-user -n storage -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}')" = "/usr/share/nginx/html"
echo "verified"
