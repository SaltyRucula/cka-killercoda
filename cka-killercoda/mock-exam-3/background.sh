#!/bin/bash
set -e
until kubectl get nodes >/dev/null 2>&1; do sleep 2; done
until kubectl wait --for=condition=Ready node --all --timeout=10s >/dev/null 2>&1; do sleep 2; done

kubectl create ns exam-c --dry-run=client -o yaml | kubectl apply -f - >/dev/null
kubectl -n exam-c create deployment broken --image=nginx:badtag >/dev/null 2>&1 || true
cat <<EOF | kubectl apply -f - >/dev/null
apiVersion: v1
kind: Service
metadata:
  name: orphan-svc
  namespace: exam-c
spec:
  selector:
    app: missing
  ports:
  - port: 80
    targetPort: 80
EOF
