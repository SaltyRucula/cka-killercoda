#!/bin/bash
set -e
test "$(kubectl get cronjob cleanup -n exam-b -o jsonpath='{.spec.schedule}')" = "0 */6 * * *"
echo "verified"
