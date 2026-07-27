# Sidecar logging

Create Pod `sidecar-demo` in `multi` with app container `writer` (busybox:1.36) repeatedly appending to `/var/log/app.log`, and sidecar `reader` (busybox:1.36) tailing that same file. Share an `emptyDir` at `/var/log`.

