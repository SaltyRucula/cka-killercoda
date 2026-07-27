#!/bin/bash
set -e
test "$(kubectl get cm shop-config -n exam-a -o jsonpath='{.data.ENV}')" = "prod"
test "$(kubectl get cm shop-config -n exam-a -o jsonpath='{.data.REGION}')" = "eu-west"
echo "verified"
