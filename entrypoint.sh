#!/bin/sh
set -eu

cd ${GITHUB_WORKSPACE}

mkdir -p ~/.kube
/app/doctl --access-token ${INPUT_ACCESS_TOKEN} kubernetes cluster kubeconfig show ${INPUT_CLUSTER} > ~/.kube/config
kubectl $*
