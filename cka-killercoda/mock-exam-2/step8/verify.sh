#!/bin/bash
set -e
test "$(kubectl get pod health-web -n exam-b -o jsonpath='{.spec.containers[0].livenessProbe.tcpSocket.port}')" = "80"
echo "verified"
