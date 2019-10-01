set -e

# View all available commands
ks --help

# Create an app directory (and reference your cluster with $KUBECONFIG)
KUBECONFIG="${KUBECONFIG:-$HOME/.kube/config}"

ks init ks-example    # Add '--api-spec=version:v1.8.0' to this command if you're running Kubernetes 1.8!
cd ks-example

# Autogenerate a basic manifest
ks generate deployed-service guestbook-ui \
  --image gcr.io/heptio-images/ks-guestbook-demo:0.1 \
  --type ClusterIP

# Deploy the manifest to your cluster, and view results
ks apply default
kubectl get svc guestbook-ui

# Teardown (Don't worry, this only removes resources defined in your ksonnet app,
# and should not affect any other resources in your 'default' namespace)
ks delete default