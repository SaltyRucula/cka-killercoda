#!/bin/bash
set -e
test "$(kubectl get pod secure-shell -n exam-b -o jsonpath='{.spec.containers[0].securityContext.allowPrivilegeEscalation}')" = "false"
echo "verified"
