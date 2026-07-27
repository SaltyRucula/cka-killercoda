# Init container

Create namespace `multi`. Create Pod `init-demo` with init container `init` using `busybox:1.36` that runs `sh -c "echo ready > /work/status"`, and main container `main` using `busybox:1.36` sleeping 3600. Share an `emptyDir` mounted at `/work` in both containers.

