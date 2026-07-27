#!/bin/bash
set -e
test "$(kubectl get rolebinding editor-bind -n exam-b -o jsonpath='{.roleRef.name}')" = "cm-editor"
test "$(kubectl get rolebinding editor-bind -n exam-b -o jsonpath='{.subjects[0].name}')" = "editor"
echo "verified"
