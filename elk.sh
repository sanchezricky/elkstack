#!/usr/bin/env bash

set -e 
set -u

# This script will install the ELK stack, Java 8 and Nginx

# Adding Java 8 to apt
add-apt-repository -y ppa:webupd8team/java
apt-add-repository -y ppa:webupd8team/java

# Importing Elasticsearch public GPG key into APT
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

# Adding Elastic source list to the sources.list.d dir
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Update apt
apt-get update

# Silent install for Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections

# Install Java 8
apt-get install oracle-java8-installer -y

# Installing Nginx
apt-get install nginx -y

# UFW allow Nginx HTTP
# ufw allow 'Nginx HTTP'

# Enable UFW
# ufw --force enable

# Install Elasticsearch
apt-get install elasticsearch

# Editing Elasticsearch cfg file
sed -i "/#network.host/c\network.host: 192.168.56.20" /etc/elasticsearch/elasticsearch.yml

# Start elasticsearch
systemctl start elasticsearch

# Enable Elasticsearch to run when system boots
systemctl enable elasticsearch

# Install Kibana
apt-get install kibana

# Enable and start Kibana
systemctl enable kibana
systemctl start kibana
