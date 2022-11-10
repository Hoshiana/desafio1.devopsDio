# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
"master" => {"memory" => "1024", "cpu" => "1", "ip" => "105", "image" => "hashicorp/bionic64", "provision" => "master.sh"},
"node01" => {"memory" => "512", "cpu" => "1", "ip" => "106", "image" => "hashicorp/bionic64", "provision" => "node.sh"},
"node02" => {"memory" => "512", "cpu" => "1", "ip" => "107", "image" => "hashicorp/bionic64", "provision" => "node.sh"}, 
"node03" => {"memory" => "512", "cpu" => "1", "ip" => "108", "image" => "hashicorp/bionic64", "provision" => "node.sh"}
}

Vagrant.configure("2") do |config|
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = conf["image"]
      machine.vm.hostname = "#{name}.devops.dio"
      machine.vm.network "private_network", ip: "10.10.10.#{conf["ip"]}"
      machine.vm.provision "shell", path: "Provision/#{conf["provision"]}"
      machine.vm.provider "virtualbox" do |vb|
          vb.name = "#{name}"
          vb.memory = conf["memory"]
          vb.cpus = conf["cpu"]
          vb.customize ["modifyvm", :id, "--groups", "/Desafio-DIO"]
      end
    end
  end
end



