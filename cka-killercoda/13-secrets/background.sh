#!/bin/bash
set -e
until kubectl get nodes >/dev/null 2>&1; do sleep 1; done
kubectl delete pod secret-env secret-files --ignore-not-found >/dev/null 2>&1 || true
kubectl delete secret db-secret --ignore-not-found >/dev/null 2>&1 || true
