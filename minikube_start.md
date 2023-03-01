# WSL

Install Distro 

wsl --unregister Ubuntu-22.04

wsl.exe --install Ubuntu-22.04

wsl


# Setup tools

curl https://raw.githubusercontent.com/grlap/Pulsar/main/prerequisites.sh | bash


# Start minikube

curl https://github.com/grlap/Pulsar/blob/main/setup_minikube.sh | bash


# Docker Verification

sudo docker run hello-world

##

git clone https://github.com/grlap/Pulsar.git


# Prepare Helm Release secrets
./scripts/pulsar/prepare_helm_release.sh -k pulsar-mini -c

# Deploy Pulsar
helm install pulsar-mini apache/pulsar \
    --values examples/values-local-pv.yaml \
    --set affinity.anti_affinity=false \
    --set volumes.local_storage=true

## does not work
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
