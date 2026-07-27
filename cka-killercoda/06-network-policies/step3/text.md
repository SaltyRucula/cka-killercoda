# Allow frontend to backend

Create NetworkPolicy `allow-frontend` selecting Pods `app=backend` and allowing ingress from Pods `app=frontend` on TCP port 8080.

