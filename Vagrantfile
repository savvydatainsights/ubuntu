# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", SharedFoldersEnableSymlinksCreate: false
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.galaxy_role_file = "requirements.yml"
    ansible.playbook = "playbook.yml"
    ansible.inventory_path = "inventory.yml"
  end
end
