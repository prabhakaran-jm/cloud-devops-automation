Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/noble64"
  
    config.vm.hostname = "devops-workstation"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
  
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "site.yml"
    end
  end  