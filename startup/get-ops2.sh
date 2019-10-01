set -e

# export KUBEFLOW_VERSION=0.12.0
# export KUBEFLOW_KS_DIR=/Users/jgoode/sonnet-out
# export KUBEFLOW_DEPLOY=true
# export URL="https://raw.githubusercontent.com/kubeflow/kubeflow/v${KUBEFLOW_VERSION}/scripts/deploy.sh"
# echo $URL
# curl $URL | bash
# cd ${KUBEFLOW_KS_DIR}

export KF_ENV=default
ks env set ${KF_ENV} --namespace=kubeflow
ks registry add kubeflow github.com/kubeflow/kubeflow/tree/master/kubeflow

echo "TFJob operator"
ks pkg install kubeflow/tf-training
ks pkg install kubeflow/common
ks generate tf-job-operator tf-job-operator
ks apply ${KF_ENV} -c tf-job-operator

echo "Pytorch operator"
ks pkg install kubeflow/pytorch-job
ks generate pytorch-operator pytorch-operator
ks apply ${KF_ENV} -c pytorch-operator

echo "Katliv"
ks pkg install kubeflow/katib
ks generate katib katib
ks apply ${KF_ENV} -c katib