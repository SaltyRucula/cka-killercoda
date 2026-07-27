# Read-only root filesystem

Create Pod `locked` in `runtime` using `busybox:1.36`, sleeping 3600 seconds. Set container `securityContext.readOnlyRootFilesystem: true`.

