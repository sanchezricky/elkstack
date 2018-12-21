Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "elk" do |elk|

    elk.vm.box = "ubuntu/bionic64"

    config.vm.network "forwarded_port", host: 9200, guest: 9200 # Elasticsearch
    config.vm.network "forwarded_port", host: 9300, guest: 9300 # Elasticsearch
    config.vm.network "forwarded_port", host: 5000, guest: 5000 # Logtash
    config.vm.network "forwarded_port", host: 5601, guest: 5601 # Kibana

    elk.vm.provision :shell, path: "elk/elk.sh"
 
    elk.vm.provider :virtualbox do |v|
      v.cpus = 1
      v.name = "elk"
      v.memory = 4096
    end

  end

end
