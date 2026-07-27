#!/bin/bash
set -e
kubectl get clusterrole node-name-reader >/dev/null 2>&1
kubectl get clusterrole node-name-reader -o jsonpath='{.rules[0].resources[*]}' | grep -qw nodes
kubectl get clusterrole node-name-reader -o jsonpath='{.rules[0].verbs[*]}' | grep -qw get
echo "verified"
