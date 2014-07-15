# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
NETWORK_IP = "192.168.56.10"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # BASIC VM SETTINGS

  config.vm.box = "ubuntu/trusty32"
  config.vm.host_name = "dev"
  config.vm.network "private_network", ip: NETWORK_IP
  config.ssh.forward_agent = true

  config.vm.synced_folder "../", "/vagrant", id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=777,fmode=777"]

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", 1]
    v.customize ["modifyvm", :id, "--name", "vagrant-webdev"]
  end

  # PROVISIONING

  config.vm.provision :shell, :path => "bootstrap.sh"

  if File.exist?("#{Dir.home}/.zshrc") then 
    config.vm.provision :file, source: '~/.zshrc', destination: "/home/vagrant/.zshrc"
  end

  if File.exist?("#{Dir.home}/.vimrc") then 
    config.vm.provision :file, source: '~/.vimrc', destination: "/home/vagrant/.vimrc"
  end

  if File.exist?("#{Dir.home}/.tmux.conf") then 
    config.vm.provision :file, source: '~/.tmux.conf', destination: "/home/vagrant/.tmux.conf"
  end

  if File.exist?("#{Dir.home}/.gitconfig") then 
    config.vm.provision :file, source: '~/.gitconfig', destination: "/home/vagrant/.gitconfig"
  end

end