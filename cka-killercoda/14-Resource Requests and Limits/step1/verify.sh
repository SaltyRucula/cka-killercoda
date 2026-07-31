#!/bin/bash
set -e

pod="resource-demo"

kubectl get pod "$pod" >/dev/null 2>&1 || {
  echo "Pod $pod does not exist"
  exit 1
}

cpu_req=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.requests.cpu}')
mem_req=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.requests.memory}')
cpu_lim=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.limits.cpu}')
mem_lim=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.limits.memory}')

[[ "$cpu_req" == "250m" ]] || { echo "Expected CPU request 250m, got $cpu_req"; exit 1; }
[[ "$mem_req" == "64Mi" ]] || { echo "Expected memory request 64Mi, got $mem_req"; exit 1; }
[[ "$cpu_lim" == "500m" ]] || { echo "Expected CPU limit 500m, got $cpu_lim"; exit 1; }
[[ "$mem_lim" == "128Mi" ]] || { echo "Expected memory limit 128Mi, got $mem_lim"; exit 1; }

echo "Resource requests and limits are correct."
