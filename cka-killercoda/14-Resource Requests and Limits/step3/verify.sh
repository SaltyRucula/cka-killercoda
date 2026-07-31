#!/bin/bash
set -e

pod="oom-demo"

kubectl get pod "$pod" >/dev/null 2>&1 || {
  echo "Pod $pod does not exist"
  exit 1
}

limit=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.limits.memory}')
[[ "$limit" == "32Mi" ]] || { echo "Expected memory limit 32Mi, got $limit"; exit 1; }

restart_policy=$(kubectl get pod "$pod" -o jsonpath='{.spec.restartPolicy}')
if [[ "$restart_policy" == "Never" ]]; then
  echo "The Pod must restart after the OOM kill; restartPolicy cannot be Never."
  exit 1
fi

# Image pulls plus the first OOM/restart can take a little while.
for _ in $(seq 1 60); do
  reason=$(kubectl get pod "$pod" -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}' 2>/dev/null || true)
  restarts=$(kubectl get pod "$pod" -o jsonpath='{.status.containerStatuses[0].restartCount}' 2>/dev/null || echo 0)

  if [[ "$reason" == "OOMKilled" && "${restarts:-0}" -ge 1 ]]; then
    echo "Container was OOMKilled and restarted."
    exit 0
  fi
  sleep 2
done

echo "No OOMKilled previous state was observed yet. Inspect with: kubectl describe pod $pod"
exit 1
