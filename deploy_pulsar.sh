#!/bin/bash -e

cd pulsar-helm-chart

# Prepare Helm Release secrets

./scripts/pulsar/prepare_helm_release.sh -k pulsar-mini -c

helm repo add apache https://pulsar.apache.org/charts

# Deploy Pulsar
helm install pulsar-mini apache/pulsar \
    --values examples/values-local-pv.yaml \
    --set affinity.anti_affinity=false \
    --set volumes.local_storage=true
