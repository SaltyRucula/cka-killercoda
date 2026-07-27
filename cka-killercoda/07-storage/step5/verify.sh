#!/bin/bash
set -e
kubectl get cm site-config -n storage >/dev/null 2>&1
test "$(kubectl get pod subpath-web -n storage -o jsonpath='{.spec.containers[0].volumeMounts[0].subPath}')" = "index.html"
test "$(kubectl get pod subpath-web -n storage -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}')" = "/usr/share/nginx/html/index.html"
echo "verified"
