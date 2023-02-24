minikube start

# Create Local Storage

kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.23/deploy/local-path-storage.yaml

kustomize build "github.com/rancher/local-path-provisioner/deploy?ref=v0.0.23" | kubectl apply -f -

kustomize build "github.com/rancher/local-path-provisioner/examples/pod?ref=master" | kubectl apply -f -

#kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pvc/pvc.yaml
#kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml


# Verify PV and PVC is created
kubectl get pv
kubectl get pvc

# Prepare Helm Release secrets
./scripts/pulsar/prepare_helm_release.sh -k pulsar-mini -c

# Deploy Pulsar
helm install pulsar-mini apache/pulsar \
    --values examples/values-local-pv.yaml \
    --set affinity.anti_affinity=false \
    --set volumes.local_storage=true \
    --set volumes.storageClass=local-path




helm install pulsar-mini apache/pulsar \
    --values examples/values-local-pv.yaml \
    --set affinity.anti_affinity=false \
    --namespace pulsar \

     \

    --namespace pulsar \
#    --set volumes.local_storage=true \

helm install pulsar-mini apache/pulsar \
    --values examples/values-local-pv.yaml \
    --namespace pulsar \
    --set volumes.local_storage=true \
    --set affinity.anti_affinity=false

# Uninstall
kubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.23/deploy/local-path-storage.yaml

helm uninstall pulsar-mini
