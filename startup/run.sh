set -e

# If using Cloud IAP, create environment variables from the
# OAuth client ID and secret that you obtained earlier:
# export CLIENT_ID=<CLIENT_ID from OAuth page>
# export CLIENT_SECRET=<CLIENT_SECRET from OAuth page>

# If using basic authentication, create environment variables for
# username and password:
# export KUBEFLOW_USERNAME=<your username>
# export KUBEFLOW_PASSWORD=<your password>

# The following command is optional, to make kfctl binary easier to use.
export PATH=/Users/jgoode/git/katib/setup:$PATH

# Set KFAPP to the name of your Kubeflow application. See detailed
# description in the text below this code snippet.
# For example,  'kubeflow-test' or 'kfw-test'.
#export KFAPP=kubeflow-dev
#export KFAPP=kubeflow-dev
export KFAPP=sparkcognition-clone-1

rm -rf $KFAPP

export ZONE=us-central1-a # where the deployment will be created
export PROJECT=sparkcognition-dev

## Run the following commands for the default installation which uses Cloud IAP:

# export CONFIG="https://raw.githubusercontent.com/kubeflow/kubeflow/c54401e/bootstrap/config/kfctl_gcp_iap.0.6.2.yaml"
# kfctl init ${KFAPP} --project=${PROJECT} --config=${CONFIG} -V 

## Alternatively, run these commands if you want to use basic authentication:

export CONFIG="https://raw.githubusercontent.com/kubeflow/kubeflow/c54401e/bootstrap/config/kfctl_gcp_basic_auth.0.6.2.yaml"
kfctl init ${KFAPP} --project=${PROJECT} --config=${CONFIG} -V --use_basic_auth

cd ${KFAPP}
kfctl generate all -V --zone ${ZONE}
kfctl apply all -V