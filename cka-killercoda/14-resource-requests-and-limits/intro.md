# CKAD · Application Environment, Configuration and Security

Requests tell the Kubernetes scheduler how much CPU and memory a Pod needs. Limits cap how much a container may use.

In these exercises you will:

- configure CPU and memory requests and limits;
- observe a Pod that cannot be scheduled because its request is impossible to satisfy;
- deliberately exceed a memory limit and inspect an `OOMKilled` container.

Work in the `default` namespace unless the task says otherwise.
