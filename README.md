# PersistentVolumeClaim with ReplicationController on GCE

## Steps to reproduce

- Create a GCE Cluster
- Create a GCE PD named "fast-storage"
- Get credentials for your cluster
- Run `./boot.hs`.

## Problem

Only one pod can make the transition into `Running` others are stuck on `Pending` or
other an status (e.g. `ImageNotReady`, `ContainerCreating`).

```
kubectl get events
FIRSTSEEN   LASTSEEN   COUNT     NAME          KIND                    SUBOBJECT                           REASON             SOURCE                                 MESSAGE

5m          1m         4         nginx-h7ncs   Pod                                                         FailedSync         {kubelet gke-papego-45312489-node-ygce}   Error syncing pod, skipping: Could not attach GCE PD "fast-storage". Timeout waiting for mount paths to be created.
5m          1m         4         nginx-h7ncs   Pod                                                         FailedMount        {kubelet gke-papego-45312489-node-ygce}   Unable to mount volumes for pod "nginx-h7ncs_default": Could not attach GCE PD "fast-storage". Timeout waiting for mount paths to be created.
2m          49s        2         nginx-1giza   Pod                                                         FailedSync         {kubelet gke-papego-45312489-node-qwrh}   Error syncing pod, skipping: Could not attach GCE PD "fast-storage". Timeout waiting for mount paths to be created.
2m          49s        2         nginx-1giza   Pod                                                         FailedMount        {kubelet gke-papego-45312489-node-qwrh}   Unable to mount volumes for pod "nginx-1giza_default": Could not attach GCE PD "fast-storage". Timeout waiting for mount paths to be created.
```

See: events.log.txt
