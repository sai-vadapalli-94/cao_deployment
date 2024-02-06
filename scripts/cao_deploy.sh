#/bin/bash -e

dl_cao_extract()
{
    echo -e "\n\n---------------------------about to download and extract the cao binary-----------------------------------------------\n\n"
    cd /vagrant
    wget https://packages.couchbase.com/releases/couchbase-operator/2.6.0/couchbase-autonomous-operator_2.6.0-kubernetes-linux-amd64.tar.gz
    tar -xvf /vagrant/couchbase-autonomous-operator_2.6.0-kubernetes-linux-amd64.tar.gz
}

apply_deployment()
{
    echo -e "\n\n---------------------------about to do a cao kubectl deployment------------------------------------------------------\n\n"
    kubectl apply -f /vagrant/couchbase-autonomous-operator_2.6.0-157-kubernetes-linux-amd64/crd.yaml
    sleep 60
}

install_cao()
{
    echo -e "\n\n---------------------------installing the admission controlor and operator-------------------------------------------\n\n"
    ./couchbase-autonomous-operator_2.6.0-157-kubernetes-linux-amd64/bin/cao create admission
    ./couchbase-autonomous-operator_2.6.0-157-kubernetes-linux-amd64/bin/cao create operator
    sleep 60
}

operator_deployment()
{
        echo -e "\n\n---------------------------Getting kubernetes deployments------------------------------------------------------\n\n"
        kubectl get deployments
} 

deploy_cb_cluster()
{
        kubectl apply -f /vagrant/kubernetes/cb-cluster.yml
}

dl_cao_extract
apply_deployment
install_cao
operator_deployment
sleep 60
deploy_cb_cluster
