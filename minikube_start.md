# WSL

Install Distro 

wsl --unregister Ubuntu-22.04

wsl.exe --install Ubuntu-22.04

wsl


# Setup tools

curl https://raw.githubusercontent.com/grlap/Pulsar/main/prerequisites.sh | bash

# Start minikube

curl https://raw.githubusercontent.com/grlap/Pulsar/main/setup_minikube.sh | bash

# Deploy Pulsar to Minikube

curl https://raw.githubusercontent.com/grlap/Pulsar/main/deploy_pulsar.sh | bash



# Docker Verification

sudo docker run hello-world

##

git clone https://github.com/grlap/Pulsar.git



# Uninstall
kubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.23/deploy/local-path-storage.yaml

helm uninstall pulsar-mini
