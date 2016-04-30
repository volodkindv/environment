# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "williamyeh/ubuntu-trusty64-docker"
#  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.synced_folder ".", "/home/vagrant"
  config.vm.network :private_network, ip: "192.168.33.101" 

  # We are going to give VM 1/4 system memory & access to all cpu cores on the host
  config.vm.provider "virtualbox" do |vb|
    host = RbConfig::CONFIG['host_os']
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else
      cpus = 2
      mem = 1024
    end
    vb.customize ["modifyvm", :id, "--memory", mem]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
  end

  config.vm.provision "shell", inline: <<-SHELL
    # composing services
    docker-compose up -d
  SHELL
end