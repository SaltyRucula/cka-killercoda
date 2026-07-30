# Kubernetes Secrets

Secrets store sensitive values such as passwords and tokens. They are similar to ConfigMaps, but Kubernetes treats them as sensitive data and stores their values as base64-encoded strings.

> Base64 is **encoding**, not encryption. Anyone who can read a Secret can decode its values.

These four cumulative exercises create one Secret and consume it in two different ways.
