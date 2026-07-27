#!/bin/bash
set -e
until kubectl get nodes >/dev/null 2>&1; do sleep 2; done
until kubectl wait --for=condition=Ready node --all --timeout=10s >/dev/null 2>&1; do sleep 2; done

kubectl create ns troubleshoot --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n troubleshoot create deployment broken-image --image=nginx:not-a-real-tag >/dev/null 2>&1 || true
kubectl -n troubleshoot create deployment no-service-match --image=nginx:1.27 >/dev/null 2>&1 || true
kubectl -n troubleshoot label deployment no-service-match app=wrong --overwrite >/dev/null 2>&1 || true
kubectl -n troubleshoot expose deployment no-service-match --name=web-svc --port=80 --target-port=80 >/dev/null 2>&1 || true
kubectl -n troubleshoot patch svc web-svc -p '{"spec":{"selector":{"app":"web"}}}' >/dev/null 2>&1 || true
cat <<EOF | kubectl apply -f - >/dev/null
apiVersion: v1
kind: Pod
metadata:
  name: crashy
  namespace: troubleshoot
spec:
  containers:
  - name: app
    image: busybox:1.36
    command: ["sh","-c","exit 1"]
EOF
