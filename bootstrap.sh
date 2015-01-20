#!/usr/bin/env bash

# Settings
DB_PASS='vagrant'

# Repositories
apt-get update
sudo apt-get install -y software-properties-common python-software-properties build-essential
. /vagrant/vagrant-webdev/shell/repositories.sh
apt-get update

# General tools
apt-get install -y curl git vim htop tmux mc

# zsh
. /vagrant/vagrant-webdev/shell/zsh.sh

# nginx
. /vagrant/vagrant-webdev/shell/nginx.sh

# php
. /vagrant/vagrant-webdev/shell/php.sh

# python
. /vagrant/vagrant-webdev/shell/python.sh

# mysql
. /vagrant/vagrant-webdev/shell/mysql.sh

# frontend
. /vagrant/vagrant-webdev/shell/frontend.sh

# other
apt-get install -y memcached
apt-get install -y mongodb
apt-get install -y redis-server

# composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# php-cs-fixer
curl http://get.sensiolabs.org/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer
chmod a+x /usr/local/bin/php-cs-fixer

# dnsmasq
. /vagrant/vagrant-webdev/shell/dnsmasq.sh

echo "====> Provisioning is successfully completed!"