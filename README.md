# vagrant-kubernetes-cluster

Kubernetes cluster automation via Vagrant

# Prerequisites

To create VMs with vagrant, you need to install:
- Vagrant 
- Virtualbox 

# Download  the box so it's much faster

vagrant box add bento/ubuntu-22.04

# Install latest version of vbbox guest edition
```
vagrant plugin install vagrant-vbguest
```

# Usage

To create VMs and bootstrap your kubernetes cluster

`vagrant up`

After creation of VMs is complete ssh into master and check kubernetes cluster status

`vagrant ssh gru`

To check the nodes in use: 


`kubectl get nodes`


check all the k8s pods: 

`kubectl get pods -A`


# Deploy cao on newly built k8s cluster

```
vagrant ssh -c /vagrant/scripts/cao_deploy.sh gru
```


