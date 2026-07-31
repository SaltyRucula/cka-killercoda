# Completed

You have practiced three important resource-management behaviors:

- **Requests** influence scheduling decisions.
- **Impossible requests** leave Pods `Pending` and generate `FailedScheduling` events.
- **Memory limits** are enforced at runtime and can terminate containers with `OOMKilled`.

A useful CKAD habit is to inspect both declarative configuration and runtime state with `kubectl get`, `kubectl describe`, events, and JSONPath.
