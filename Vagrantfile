Vagrant.configure("2") do |config|
  config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
  config.vm.provision :shell, path: "bootstrap.ps1"
  config.vm.network "public_network"
  # Allow `vagrant rdp` through
  config.vm.network :forwarded_port, guest: 3389, host: 3389
  config.vm.communicator = "winrm"
  config.vm.hostname="vagrant.windows"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "windows-2012r2" 
    vb.memory = "1024"
    vb.cpus = 2
    # Workaround to fix a virtual box 5.1 export bug
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
end
