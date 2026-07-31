## Exercise 36 · Trigger an out-of-memory kill (stretch)

### Task

Create a Pod named `oom-demo` with a **`32Mi` memory limit**.

Configure its container to deliberately allocate substantially more than `32Mi` so the Linux kernel kills the process for exceeding its cgroup memory limit.

The Pod must restart the container after it is killed. You may use an image and command of your choice.

One convenient option is a small Python image that allocates about 100 MiB:

```yaml
image: python:3.12-alpine
command:
  - python
  - -c
  - 'a=bytearray(100*1024*1024); import time; time.sleep(60)'
```

You still need to create the complete Pod specification yourself.

### Verify yourself

Watch the Pod restart:

```bash
kubectl get pod oom-demo -w
```

Then inspect its previous container state:

```bash
kubectl describe pod oom-demo
```

or:

```bash
kubectl get pod oom-demo \
  -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}{"\n"}'
```

The previous termination reason should be `OOMKilled`.
