#!/bin/bash
set -e

pod="impossible-request"

kubectl get pod "$pod" >/dev/null 2>&1 || {
  echo "Pod $pod does not exist"
  exit 1
}

req=$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].resources.requests.memory}')
[[ "$req" == "500Gi" ]] || { echo "Expected memory request 500Gi, got $req"; exit 1; }

phase=$(kubectl get pod "$pod" -o jsonpath='{.status.phase}')
[[ "$phase" == "Pending" ]] || { echo "Expected Pod to be Pending, got $phase"; exit 1; }

# Give the scheduler a few seconds to emit its event.
for _ in $(seq 1 15); do
  if kubectl get events --field-selector involvedObject.kind=Pod,involvedObject.name="$pod",reason=FailedScheduling \
      -o name 2>/dev/null | grep -q .; then
    echo "Pod is Pending and has a FailedScheduling event."
    exit 0
  fi
  sleep 1
done

echo "Pod is Pending, but no FailedScheduling event was found yet."
exit 1
