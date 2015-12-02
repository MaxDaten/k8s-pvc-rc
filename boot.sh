kubectl create -f nginx-volume.yaml
kubectl create -f nginx-claim.yaml
kubectl get pv
kubectl get pvc
kubectl create -f nginx.yaml
kubectl get pods -w
kubectl get events
