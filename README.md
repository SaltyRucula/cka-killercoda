# CKA Killercoda Practice

Original hands-on practice scenarios for the Certified Kubernetes Administrator curriculum. These are not exam dumps or copied exam questions.

## Contents

- 12 progressive scenarios × 5 tasks = **60 practice tasks**
- 3 mock exams × 10 tasks = **30 mock-exam tasks**
- **90 tasks total**
- Automated Bash verification for every task
- Broken-state setup for troubleshooting exercises
- Killercoda `structure.json` and per-scenario `index.json` files

## Publish to Killercoda

1. Create a GitHub repository.
2. Copy this repository's contents into it and push to your default branch.
3. In Killercoda, open your Creator dashboard and add the GitHub repository.
4. Killercoda syncs scenarios when you push.

## Suggested progression

Run scenarios `01` through `12` in order. Then take `mock-exam-1`, `mock-exam-2`, and `mock-exam-3` without looking at verification scripts.

## Exam-practice mode

For mock exams, give yourself about 6–8 minutes per task. Do not inspect `verify.sh` until after completing the scenario.

## Notes

The repository uses Killercoda's kubeadm Kubernetes backend. Most scenarios use the 1-node backend so they load quickly. Tasks requiring scheduler behaviour use labels/taints on the available control-plane node.

Static-Pod exercises intentionally write only `/etc/kubernetes/manifests/cka-static.yaml` and then remove it.
