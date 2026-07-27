#!/bin/bash
set -e
! kubectl get node controlplane -o json | grep -q '"key": "exam"'
echo "verified"
