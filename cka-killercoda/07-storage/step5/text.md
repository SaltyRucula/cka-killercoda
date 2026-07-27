# SubPath mount

Create ConfigMap `site-config` in `storage` with key `index.html` value `CKA`. Create Pod `subpath-web` using `nginx:1.27` that mounts only that key at `/usr/share/nginx/html/index.html` using `subPath: index.html`.

