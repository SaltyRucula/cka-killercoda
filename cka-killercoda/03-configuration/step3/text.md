# Consume ConfigMap as env

Create Pod `config-reader` in `config` using `busybox:1.36`, running `sleep 3600`. Load all keys from `app-config` into environment variables.

