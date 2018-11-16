#!/usr/bin/env bash

set -e 
set -u

# This script will install the ELK stack, Java 8 and Nginx

# Adding Java 8 to apt
sudo add-apt-repository ppa:webupd8team/java
sudo apt-add-repository -y ppa:webupd8team/java

# Importing Elasticsearch public GPG key into APT
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Adding Elastic source list to the sources.list.d dir
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Update apt
sudo apt update

# Silent install for Java 8
echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections

# Install Java 8
sudo apt install oracle-java8-installer -y

# Installing Nginx
sudo apt install nginx -y

# UFW allow Nginx HTTP
sudo ufw allow 'Nginx HTTP'

# Install elasticsearch
sudo apt install elasticsearch

# Editing Elasticsearch cfg file
