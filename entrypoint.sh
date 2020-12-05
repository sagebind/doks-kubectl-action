#!/bin/sh
set -eu

KUBECTL_BIN=/usr/local/bin/kubectl

cd ${GITHUB_WORKSPACE}

# Select latest stable kubectl version if none given
if [ -z "${INPUT_KUBECTL_VERSION-}" ]; then
    INPUT_KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
fi

# Set up kubectl
curl -L -o ${KUBECTL_BIN} "https://storage.googleapis.com/kubernetes-release/release/${INPUT_KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x ${KUBECTL_BIN}

# Get kubeconfig
/app/doctl --access-token ${INPUT_ACCESS_TOKEN} kubernetes cluster kubeconfig save --expiry-seconds 600 ${INPUT_CLUSTER}

# Run kubectl command
exec kubectl $*
