#!/bin/sh
set -eu

cd ${GITHUB_WORKSPACE}
export DIGITALOCEAN_ACCESS_TOKEN="${INPUT_ACCESS_TOKEN}"

/app/doctl kubernetes cluster kubeconfig save ${INPUT_CLUSTER}
kubectl $*
