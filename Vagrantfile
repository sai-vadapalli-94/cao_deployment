Vagrant.configure("2") do |config|
  # gru is master node, despicable me reference :) 
  # minions are worker nodes
  # Provision the gru node
  config.vm.define "gru" do |gru|
    gru.vm.box = "bento/ubuntu-22.04"
      gru.vm.hostname = "gru"
      gru.vm.network "private_network", ip: "172.16.8.10"
      gru.vm.provider "virtualbox" do |vb|
        vb.cpus = 2
        vb.memory = 6096
    end
    gru.vm.boot_timeout = 1200
    gru.vm.provision "shell", path: "scripts/common.sh", privileged: true
    gru.vm.provision "shell", path: "scripts/configure_master.sh", privileged: true
  end

  # Provision the minion nodes
  (1..2).each do |i|
    config.vm.define "minion#{i}" do |minion|
      minion.vm.box = "bento/ubuntu-22.04"
        minion.vm.hostname = "minion#{i}"
        minion.vm.network "private_network", ip: "172.16.8.#{10+i}"
        minion.vm.network "forwarded_port", guest: 8091, host: 8080 + i
        minion.vm.provider "virtualbox" do |vb|
          vb.cpus = 2
          vb.memory = 8092
      end
      minion.vm.boot_timeout = 1200
      minion.vm.provision "shell", path: "scripts/common.sh", privileged: true
      minion.vm.provision "shell", path: "scripts/worker.sh", privileged: true
   end
  end
end