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

  config.vm.synced_folder "../", "/vagrant", id: "vagrant-root", type: "nfs"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", 1]
    v.customize ["modifyvm", :id, "--name", "vagrant-webdev"]
  end

  # PROVISIONING

  config_files = {
    ".zshrc"            => "~/.zshrc",
    ".vimrc"            => "~/.vimrc",
    ".tmux.conf"        => "~/.tmux.conf",
    ".gitconfig"        => "~/.gitconfig",
    ".gitconfig_global" => "~/.gitconfig_global",
  }

  config_files.each do |filename, path|
    if File.exist?("data/configs/#{filename}") then
      config.vm.provision :file, source: "data/configs/#{filename}", destination: path
    end
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :shell, :path => "bootstrap-unprivileged.sh", :privileged => false

end