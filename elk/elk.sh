#!/usr/bin/env bash

set -euo pipefail 

# Adding Java 8 to apt
add-apt-repository -y ppa:webupd8team/java
apt-add-repository -y ppa:webupd8team/java

# APT update/upgrade
apt-get update -y
apt-get upgrade -y

# Silent install for Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections

# Java 8 install
apt-get install oracle-java8-installer -y

# install the Elastic PGP Key and repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

sudo apt-get update -y
sudo apt-get install -y elasticsearch

# copy over configs
cp /vagrant/elkconfig/elasticsearch.yml /etc/elasticsearch/
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service

# install Logstash
sudo apt-get install logstash -y

# copy over configs
cp -R /vagrant/elkconfig/10-apache-log.conf /etc/logstash/conf.d/
sudo systemctl enable logstash.service
sudo systemctl start logstash.service


# Install Kibana
sudo apt-get install kibana -y

# copy over configs
cp /vagrant/elkconfig/kibana.yml /etc/kibana/

sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service

