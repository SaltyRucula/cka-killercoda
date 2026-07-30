# Exercise 28 · Inspect the encoding

Read the stored value of the `password` key from `db-secret` and decode it back to plain text.

For example, combine `kubectl get ... -o jsonpath=...` with `base64 --decode`.

## Goal

Observe that the decoded value is:

```text
s3cr3t
```

Base64 is encoding, not encryption.
