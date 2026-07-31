#!/bin/bash
set -e

kubectl delete pod resource-demo impossible-request oom-demo --ignore-not-found=true >/dev/null 2>&1 || true
