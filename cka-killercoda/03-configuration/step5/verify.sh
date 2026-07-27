#!/bin/bash
set -e
kubectl get pod config-volume -n config >/dev/null 2>&1
test "$(kubectl get pod config-volume -n config -o jsonpath='{.spec.volumes[0].configMap.name}')" = "app-config"
test "$(kubectl get pod config-volume -n config -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}')" = "/etc/app"
echo "verified"
