FROM digitalocean/doctl

ARG KUBECTL_VERSION=1.15.0

ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
