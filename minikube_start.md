# WSL

Install Distro 

wsl.exe --install Ubuntu-22.04

wsl

# Docker

sudo apt update -y

sudo apt install apt-transport-https curl gnupg-agent ca-certificates software-properties-common -y

sudo apt-get install ca-certificates curl gnupg lsb-release -y

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo mkdir -m 0755 -p /etc/apt/keyrings

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo chmod a+r /etc/apt/keyrings/docker.gpg

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo service docker start

# Docker Verification

sudo docker run hello-world

##

git clone https://github.com/grlap/Pulsar.git



minikube start

# Create Local Storage

#kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.23/deploy/local-path-storage.yaml
kubectl apply -f ./Pulsar/local_storage.yaml

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
