#!/bin/sh
set -eu

/app/doctl --access-token "${INPUT_ACCESS_TOKEN}" kubernetes cluster kubeconfig save ${INPUT_CLUSTER}
kubectl $*
