## Exercise 35 · Create an impossible request

### Task

Create a Pod named `impossible-request` using the `nginx:alpine` image.

Configure its container to request **`500Gi` of memory**.

Do not set `nodeName` and do not bypass the scheduler.

Observe what happens.

### Goal

See how the scheduler reacts when no node can satisfy a resource request.

### Verify yourself

```bash
kubectl get pod impossible-request
kubectl describe pod impossible-request
```

The Pod should remain `Pending`. In the Events section, look for a `FailedScheduling` event describing insufficient memory.
