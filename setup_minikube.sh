#!/bin/bash -e

# Reload permissions

newgrp docker

# Start Minikube

minikube start --cpus=4

# Create Local Storage

kubectl apply -f https://raw.githubusercontent.com/grlap/Pulsar/main/local_storage.yaml

./kustomize build "github.com/rancher/local-path-provisioner/deploy?ref=v0.0.23" | kubectl apply -f -

./kustomize build "github.com/rancher/local-path-provisioner/examples/pod?ref=master" | kubectl apply -f -

# Verify PV and PVC is created
kubectl get pv
kubectl get pvc
