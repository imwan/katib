# latest stable release

## Install `ks`: https://v0-3.kubeflow.org/docs/guides/components/ksonnet/
```
C02WL0UNG8WL:katib jgoode$ git remote -v
origin  https://github.com/jimgoo/katib (fetch)
origin  https://github.com/jimgoo/katib (push)
C02WL0UNG8WL:katib jgoode$ git remote -v
```

```
git checkout v0.6.0-rc.0
```

## list of example and versions supported

```
C02WL0UNG8WL:katib jgoode$ ls examples/*/*
examples/v1alpha2/README.md       examples/v1alpha3/bayesianoptimization-example.yaml
examples/v1alpha2/bayseopt-example.yaml     examples/v1alpha3/grid-example.yaml
examples/v1alpha2/grid-example.yaml     examples/v1alpha3/hyperband-example.yaml
examples/v1alpha2/hyperband-example.yaml    examples/v1alpha3/nasjob-example-RL.yaml
examples/v1alpha2/nasjob-example-RL.yaml    examples/v1alpha3/pytorchjob-example.yaml
examples/v1alpha2/pytorchjob-example.yaml   examples/v1alpha3/random-example.yaml
examples/v1alpha2/random-example.yaml     examples/v1alpha3/tfjob-example.yaml
examples/v1alpha2/tfjob-example.yaml      examples/v1alpha3/tpe-example.yaml
examples/v1alpha3/README.md

examples/v1alpha2/MinikubeDemo:
deploy.sh destroy.sh

examples/v1alpha2/NAS-training-containers:
RL-cifar10

examples/v1alpha2/tfevent-volume:
tfevent-pv.yaml   tfevent-pvc.yaml

examples/v1alpha3/MinikubeDemo:
deploy.sh destroy.sh

examples/v1alpha3/NAS-training-containers:
RL-cifar10

examples/v1alpha3/tfevent-volume:
tfevent-pv.yaml   tfevent-pvc.yaml

```

## --> means I want `v1alpha3` so I can do RL


## Fix Brew

`sudo chown -R $(whoami):staff /usr/local/Caskroom/`

## Install minikub (via brew)

`brew cask install minikub`

## Run non-RL example

`sh examples/v1alpha3/MinikubeDemo/deploy.sh`

```
==> Linking Binary 'minikube-darwin-amd64' to '/usr/local/bin/minikube'.
🍺  minikube was successfully installed!
C02WL0UNG8WL:katib jgoode$ sh examples/v1alpha3/NAS-training-containers/RL-cifar10/
Dockerfile           ModelConstructor.py  RunTrial.py          op_library.py        requirements.txt
C02WL0UNG8WL:katib jgoode$ sh examples/v1alpha3/MinikubeDemo/deploy.sh
+ set -e
+ minikube start --disk-size 50g --memory 4096 --cpus 4
😄  minikube v1.4.0 on Darwin 10.14.6
💿  Downloading VM boot image ...
    > minikube-v1.4.0.iso.sha256: 65 B / 65 B [--------------] 100.00% ? p/s 0s
    > minikube-v1.4.0.iso: 135.73 MiB / 135.73 MiB [-] 100.00% 2.62 MiB p/s 52s
🔥  Creating virtualbox VM (CPUs=4, Memory=4096MB, Disk=50000MB) ...
🔄  Retriable failure: create: precreate: VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
🔥  Creating virtualbox VM (CPUs=4, Memory=4096MB, Disk=50000MB) ...
🔄  Retriable failure: create: precreate: VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
🔥  Creating virtualbox VM (CPUs=4, Memory=4096MB, Disk=50000MB) ...
🔄  Retriable failure: create: precreate: VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
🔥  Creating virtualbox VM (CPUs=4, Memory=4096MB, Disk=50000MB) ...
🔄  Retriable failure: create: precreate: VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path

💣  Unable to start VM
❌  Error: [VBOX_NOT_FOUND] create: precreate: VBoxManage not found. Make sure VirtualBox is installed and VBoxManage is in the path
💡  Suggestion: Install VirtualBox, or select an alternative value for --vm-driver
📘  Documentation: https://minikube.sigs.k8s.io/docs/start/
⁉️   Related issues:
    ▪ https://github.com/kubernetes/minikube/issues/3784
C02WL0UNG8WL:katib jgoode$ kubectl list
Error: unknown command "list" for "kubectl"

Did you mean this?
    get
    wait

Run 'kubectl --help' for usage.
unknown command "list" for "kubectl"

Did you mean this?
    get
    wait

C02WL0UNG8WL:katib jgoode$ kubectl -n kubeflow get pods
No resources found.
C02WL0UNG8WL:katib jgoode$ kubectl -n default get pods
No resources found.
C02WL0UNG8WL:katib jgoode$ kubectl -n kubeflow get pods
No resources found.
```

## Virtualbox bust be installled, but an older version than the current one (netowrk interface things)

### Need version <= 5.0.12

[http://download.virtualbox.org/virtualbox/5.0.12/VirtualBox-5.0.12-104815-OSX.dmg](http://download.virtualbox.org/virtualbox/5.0.12/VirtualBox-5.0.12-104815-OSX.dmg)

Problem running VB uninstall: 

```
Last login: Thu Sep 26 01:34:35 on ttys007
-bash: ./katib/scripts/v1alpha2/deploy.snet: No such file or directory
/Volumes/VirtualBox/VirtualBox_Uninstall.tool ; exit;
C02WL0UNG8WL:~ jgoode$ /Volumes/VirtualBox/VirtualBox_Uninstall.tool ; exit;

Welcome to the VirtualBox uninstaller script.

The following files and directories (bundles) will be removed:
    /usr/local/bin/VirtualBox
    /usr/local/bin/VBoxManage
    /usr/local/bin/VBoxVRDP
    /usr/local/bin/VBoxHeadless
    /usr/local/bin/vboxwebsrv
    /usr/local/bin/VBoxBalloonCtrl
    /usr/local/bin/VBoxAutostart
    /usr/local/bin/VBoxDTrace
    /usr/local/bin/vbox-img
    /Library/LaunchDaemons/org.virtualbox.startup.plist
    /Library/Application Support/VirtualBox/LaunchDaemons/
    /Library/Application Support/VirtualBox/VBoxDrv.kext/
    /Library/Application Support/VirtualBox/VBoxUSB.kext/
    /Library/Application Support/VirtualBox/VBoxNetFlt.kext/
    /Library/Application Support/VirtualBox/VBoxNetAdp.kext/
    /Applications/VirtualBox.app/

Do you wish to uninstall VirtualBox (Yes/No)?
yes

The uninstallation processes requires administrative privileges
because some of the installed files cannot be removed by a normal
user. You may be prompted for your password now...

Please enter jgoode's password:
Successfully unloaded VirtualBox kernel extensions.
Done.
logout
Saving session...
...copying shared history...
...saving history...truncating history files...
...completed.

[Process completed]
```

## Still have problems with this file not allowing us to install old versions of VirtualBox

`ls "/Library/StagedExtensions/Library/Application Support/VirtualBox/VBoxDrv.kext"`


Can't delete it manually:
```
sudo rm -rf /Library/StagedExtensions/Library/Application\ Support/VirtualBox/
rm: /Library/StagedExtensions/Library/Application Support/VirtualBox//VBoxDrv.kext/Contents/_CodeSignature/CodeResources: Operation not permitted
rm: /Library/StagedExtensions/Library/Application Support/VirtualBox//VBoxDrv.kext/Contents/_CodeSignature: Operation not permitted
...
```

This is a new feature in Mojave and clears the folder (https://stackoverflow.com/questions/46535279/what-is-library-stagedextensions-for-and-how-to-remove-extensions): 

`sudo kextcache --clear-staging`

### A re-install of latest VirtualBox version after doing all this cleaning worked.

```
C02WL0UNG8WL:katib jgoode$ sh examples/v1alpha3/MinikubeDemo
C02WL0UNG8WL:katib jgoode$ bash deploy.sh

+ set -e
+ minikube start --disk-size 50g --memory 4096 --cpus 4
😄  minikube v1.4.0 on Darwin 10.14.6
🔥  Creating virtualbox VM (CPUs=4, Memory=4096MB, Disk=50000MB) ...
🐳  Preparing Kubernetes v1.16.0 on Docker 18.09.9 ...
💾  Downloading kubeadm v1.16.0
💾  Downloading kubelet v1.16.0
🚜  Pulling images ...
🚀  Launching Kubernetes ...
⌛  Waiting for: apiserver proxy etcd scheduler controller dns
🏄  Done! kubectl is now configured to use "minikube"
bash: ../../../scripts/v1alpha3/deploy.sh: No such file or directory
+ set -e
+ minikube start --disk-size 50g --memory 4096 --cpus 4
😄  minikube v1.4.0 on Darwin 10.14.6
💡  Tip: Use 'minikube start -p <name>' to create a new cluster, or 'minikube delete' to delete this one.
🏃  Using the running virtualbox "minikube" VM ...
⌛  Waiting for the host to be provisioned ...
🐳  Preparing Kubernetes v1.16.0 on Docker 18.09.9 ...

🔄  Relaunching Kubernetes using kubeadm ...
⌛  Waiting for: apiserver proxy etcd scheduler controller dns
🏄  Done! kubectl is now configured to use "minikube"
+ bash ../../../scripts/v1alpha3/deploy.sh
++ dirname ../../../scripts/v1alpha3/deploy.sh
+ SCRIPT_ROOT=../../../scripts/v1alpha3/../..
+ cd ../../../scripts/v1alpha3/../..
+ kubectl apply -f manifests/v1alpha3
namespace/kubeflow created
+ kubectl apply -f manifests/v1alpha3/katib-controller
customresourcedefinition.apiextensions.k8s.io/experiments.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/suggestions.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/trials.kubeflow.org created
configmap/katib-config created
deployment.apps/katib-controller created
clusterrole.rbac.authorization.k8s.io/katib-controller created
serviceaccount/katib-controller created
clusterrolebinding.rbac.authorization.k8s.io/katib-controller created
secret/katib-controller created
service/katib-controller created
configmap/trial-template created
+ kubectl apply -f manifests/v1alpha3/manager
service/katib-manager created
error: unable to recognize "manifests/v1alpha3/manager/deployment.yaml": no matches for kind "Deployment" in version "extensions/v1beta1"
```

## List pods

```
kubectl -n kubeflow get pods
```

## Get `ks`

`brew install ksonnet/tap/ks`

### Run pods just built

kubectl -n kubeflow port-forward $(kubectl -n kubeflow get pod -o=name | grep katib-ui | sed -e "s@pods\/@@") 

port-forward $(kubectl get pod --selector=name=katib) 

### Kill once running 

ks delete ${KF_ENV} -c katib
ks delete ${KF_ENV} -c pytorch-operator
ks delete ${KF_ENV} -c tf-job-operator


### Random need

`ks init my-app`