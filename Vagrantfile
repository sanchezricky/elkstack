Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end


  config.vm.define "elk" do |elk|

    elk.vm.box = "ubuntu/bionic64"
    elk.vm.network :private_network, ip: "192.168.56.20" 
    elk.vm.provision :shell, path: "elk.sh"
 
    elk.vm.provider :virtualbox do |v|
      v.name = "elk"
    end

  end

end