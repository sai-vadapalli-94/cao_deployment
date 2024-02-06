Vagrant.configure("2") do |config|

  config.vm.boot_timeout = 1200
  
  # Define the VM provider (e.g., VirtualBox)
  config.vm.provider :virtualbox do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # Provision the master node
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/jammy64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "172.16.8.10"
    master.vm.provision "shell", path: "scripts/install-kubernetes-dependencies.sh"
    master.vm.provision "shell", path: "scripts/configure-master-node.sh"
  end

  # Provision the worker nodes
  (1..2).each do |i|
    config.vm.define "minion#{i}" do |worker|
      worker.vm.box = "ubuntu/jammy64"
      worker.vm.hostname = "minion#{i}"
      worker.vm.network "private_network", ip: "172.16.8.#{i + 10}"
      worker.vm.network "forwarded_port", guest: 8091, host: 8080 + i
      worker.vm.provision "shell", path: "scripts/install-kubernetes-dependencies.sh"
      worker.vm.provision "shell", path: "scripts/configure-worker-nodes.sh"
   end
  end
end