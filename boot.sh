kubectl create -f nginx-volume.yaml
kubectl create -f nginx-claim.yaml
kubectl create -f nginx.yaml
kubectl get pods -w
kubectl get events
