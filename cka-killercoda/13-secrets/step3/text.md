# Exercise 29 · Consume a Secret as environment variables

Create a Pod named `secret-env` using image `busybox:1.36`.

Requirements:

- Keep the container running with `sleep 3600`.
- Expose `db-secret` key `username` as environment variable `USERNAME`.
- Expose `db-secret` key `password` as environment variable `PASSWORD`.

## Verify manually

```bash
kubectl exec secret-env -- printenv USERNAME
kubectl exec secret-env -- printenv PASSWORD
```

The output must be `admin` and `s3cr3t` respectively.
