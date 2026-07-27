#!/bin/bash
set -e
kubectl get cronjob heartbeat -n apps >/dev/null 2>&1
test "$(kubectl get cronjob heartbeat -n apps -o jsonpath='{.spec.schedule}')" = "*/10 * * * *"
test "$(kubectl get cronjob heartbeat -n apps -o jsonpath='{.spec.jobTemplate.spec.template.spec.containers[0].image}')" = "busybox:1.36"
echo "verified"
