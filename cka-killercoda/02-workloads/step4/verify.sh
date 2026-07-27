#!/bin/bash
set -e
kubectl get job one-shot -n apps >/dev/null 2>&1
test "$(kubectl get job one-shot -n apps -o jsonpath='{.spec.template.spec.containers[0].image}')" = "busybox:1.36"
kubectl get job one-shot -n apps -o jsonpath="{.spec.template.spec.containers[0].command[*]} {.spec.template.spec.containers[0].args[*]}" | grep -q cka-complete
echo "verified"
