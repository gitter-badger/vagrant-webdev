vagrant-webdev
==============

[![Join the chat at https://gitter.im/vasylchenko/vagrant-webdev](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vasylchenko/vagrant-webdev?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This set of files allows me to deploy virtual machine for web development (mostly php) in a few minutes.

Installation
------------

* Install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/)
```bash
$ sudo apt-get install virtualbox vagrant
```
* Go to directory with your projects and clone this repository. For example:
```bash
$ cd ~/projects
$ git clone https://github.com/vasylchenko/vagrant-webdev.git
```
* Download and add vagrant box
```bash
$ vagrant box add ubuntu/trusty32
```
* Go to repository directory and type
```bash
$ vagrant up
```
* That's all! You can ssh to VM by ```vagrant ssh```. Directory with your projects will be available in virtual machine as _/vagrant_.

### Importing config files

Some config files are imported from host system during provisioning. These files are listed in Vagrantfile in ```config_files``` variable: _key_ is the _name of the file_ and _value_ is the _destination path_ in guest file system. Destination path can include subfolders e.g. ```"foo.txt" => "/path/to/bar.cfg"```. These files are imported from _data/configs_ folder. You can use links in _data/configs_ folder to copy config files of your host system to guest. For example:

```bash
# cd to the root of vagrant-webdev project folder
$ ln -s ~/.gitconfig data/configs/.gitconfig
```

Installed software
------------------

* nginx
* php (php-cli, php-fpm) + xdebug
* nodejs, npm
* grunt, gulp, bower
* python-pip
* mysql, phpMyAdmin
* memcached
* mongodb
* redis
* ansible
* [composer](https://getcomposer.org/)
* [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer)
* git
* zsh + [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* vim, mc, htop, tmux, curl
* dnsmasq (for service needs)

Virtual hosts
---------------

Dynamic virtual hosts are setted so you don't have to manually configure nginx to create new hosts. It's enough to create _example.dev_ directory (any directory ending with _.dev_) in synced folder either in your host or guest system and _http://example.dev_ host will be available in guest machine.

This is possible through the use of [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html) on VM.

Web server will search index files sequentially in _public_, _web_, _www_, _httpdocs_ subfolders as well as just in main project folder. So you can choose any type of server root directory:

    * /public/index.(html|htm|php)
    * /web/index.(html|htm|php)
    * /www/index.(html|htm|php)
    * /httpdocs/index.(html|htm|php)
    * /index.(html|htm|php)

To make new host accessible in browser of host system you have to add its hostname to host's _/etc/hosts_ file:

```bash
$ sudo echo '192.168.56.10 example.dev' >> /etc/hosts
```

It's possible to automate this by configuring dnsmasq also on host machine or using some vagrant plugins (see __Todo__ section below)

Debugging
---------

Under development... (see __Todo__ section below)

Todo
----

* Add new software:
    * phpenv (or phpbrew or something else)
* Configure xdebug for remote debugging from host machine
* Setup cron script to backup databases to host machine
* Try vagrant plugins to automatically update host's _/etc/hosts_ file (I don't want to have dnsmasq on host system):
    * https://github.com/smdahlen/vagrant-hostmanager
    * https://github.com/cogitatio/vagrant-hostsupdater