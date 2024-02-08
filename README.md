# vagrant-kubernetes-cluster

Kubernetes cluster automation via Vagrant

# Prerequisites

To create VMs with vagrant, you need to install:
- Vagrant (This project is tested on Vagrant 2.2.7)
- Virtualbox (This project is tested on Virtualbox 6.1.28)

# Usage

To create VMs and bootstrap your kubernetes cluster

`vagrant up`

After creation of VMs is complete ssh into master and check kubernetes cluster status

`vagrant ssh master`

To check the nodes use: 

```
kubectl get nodes
```

To check the k8s pods: 
```
kubectl get pods -n kube-system
```

# deploy cao on newly built k8s cluster

```
vagrant ssh -c /vagrant/cao_deploy.sh master
```

# install latest version of vbbox guest edition
```
vagrant plugin install vagrant-vbguest
```
