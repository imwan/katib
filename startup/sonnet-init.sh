set -e

export KUBEFLOW_VERSION=1.14.7
export KUBEFLOW_KS_DIR=$1
export KUBEFLOW_DEPLOY=true
echo "https://raw.githubusercontent.com/kubeflow/kubeflow/v${KUBEFLOW_VERSION}/scripts/deploy.sh"
curl https://raw.githubusercontent.com/kubeflow/kubeflow/v${KUBEFLOW_VERSION}/scripts/deploy.sh | bash

# cd ${KUBEFLOW_KS_DIR}
# ks param set spartakus reportUsage false
# ks apply default

