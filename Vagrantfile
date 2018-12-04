Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "elk" do |elk|

    elk.vm.box = "ubuntu/bionic64"
    elk.vm.network :private_network, ip: "192.168.56.20" 
    elk.vm.provision :shell, path: "server/setup.sh"
    elk.vm.provision :shell, path: "nginx/nginx.sh"
    elk.vm.provision :shell, path: "elk/elk.sh"
 
    elk.vm.provider :virtualbox do |v|
      v.name = "elk"
      v.memory = 2048
    end

  end

end
