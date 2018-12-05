#!/usr/bin/env bash

set -euo pipefail

# Update APT
apt-get update -y

# Install Nginx
apt-get install nginx -y

# Open port 80 for Nginx
ufw allow 'Nginx HTTP'

# Allow connections to Nginx
ufw allow 'Nginx Full'
