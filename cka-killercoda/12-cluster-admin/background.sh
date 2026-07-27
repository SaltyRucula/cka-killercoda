#!/bin/bash
set -e
until kubectl get nodes >/dev/null 2>&1; do sleep 2; done
until kubectl wait --for=condition=Ready node --all --timeout=10s >/dev/null 2>&1; do sleep 2; done

rm -f /etc/kubernetes/manifests/cka-static.yaml
kubectl uncordon controlplane >/dev/null 2>&1 || true
