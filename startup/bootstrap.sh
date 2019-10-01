set -e

export PROJECT=sparkcognition-dev
export DEPLOYMENT_NAME=sparkcognition-clone-1
export ZONE=us-central1-f
gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}

gcloud container clusters get-credentials \
    ${DEPLOYMENT_NAME} --zone ${ZONE} --project ${PROJECT}

kubectl config set-context $(kubectl config current-context) --namespace=kubeflow
#kubectl config set-context $(kubectl config current-context) --namespace=${DEPLOYMENT_NAME

kubectl get all