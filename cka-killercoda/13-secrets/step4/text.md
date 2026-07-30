# Exercise 30 · Mount a Secret as files

Create a Pod named `secret-files` using image `busybox:1.36`.

Requirements:

- Keep the container running with `sleep 3600`.
- Mount the entire `db-secret` Secret at `/etc/creds` as a read-only volume.

Kubernetes must create one file for each Secret key:

```text
/etc/creds/username
/etc/creds/password
```

## Verify manually

```bash
kubectl exec secret-files -- ls -l /etc/creds
kubectl exec secret-files -- cat /etc/creds/username
kubectl exec secret-files -- cat /etc/creds/password
```

The files must contain the decoded values `admin` and `s3cr3t`.
