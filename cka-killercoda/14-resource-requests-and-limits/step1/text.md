## Exercise 34 · Set requests and limits

### Task

Create a Pod named `resource-demo` using the `nginx:alpine` image.

Its container must have:

- memory request: `64Mi`
- CPU request: `250m`
- memory limit: `128Mi`
- CPU limit: `500m`

### Verify yourself

```bash
kubectl describe pod resource-demo
```

Under the container's **Limits** and **Requests**, you should see the values above.
