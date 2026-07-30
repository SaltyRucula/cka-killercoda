# Exercise 27 · Create a Secret from literals

Create a generic Secret named `db-secret` in the `default` namespace with these key-value pairs:

- `username=admin`
- `password=s3cr3t`

## Verify manually

```bash
kubectl get secret db-secret
kubectl get secret db-secret -o jsonpath='{.data}'
```

The Secret must contain exactly the two requested data entries.
