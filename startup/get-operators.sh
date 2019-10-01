set -e

# ## In your Ksonnet app root, run the following
# export KS_VER=0.13.1
# export KS_PKG=ks_${KS_VER}_linux_amd64

# export OUTDIR=/Users/jgoode/sonnet
# rm -rf $OUTDIR

# export URL="https://github.com/ksonnet/ksonnet/releases/download/v${KS_VER}/${KS_PKG}.tar.gz"

# echo "----> url: "
# echo $URL

# wget -O "/tmp/${KS_PKG}.tar.gz" $URL --no-check-certificate

# mkdir -p ${OUTDIR}/bin
# tar -xvf /tmp/$KS_PKG.tar.gz -C ${OUTDIR}/bin

# export PATH=$PATH:${HOME}/bin/$KS_PKG

# cd ${OUTDIR}
# echo "----------------"

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