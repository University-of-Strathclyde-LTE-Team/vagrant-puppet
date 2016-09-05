About
=====

This is a Vagrant script for provisioning machines using Puppet.

It's main anticipated use is in the provisioning of development and production servers
for the University of Strathclyde's VLE, Myplace.

Use this at your own risk!

Dependencies
============

vagrant plugin install puppet

vagrant plugin install vagrant-librarian-puppet

vagrant plugin install vagrant-share


Usage (Development)
===================
1. Install vagrant
2. Install vagrant dependencies
3. Clone this repo to your machine
4. Execute ```git submodule init```
5. Execute ```git submodule update```
6. Execute ```vagrant up```

This will bring up a "development" server, which will have Apache, PHP and MySQL installed. 

A /vagrant/web/ directory will be created as part of the provisioning. This will exist on the 
*host* machine, and is where the web application code should be placed.

Myplace source code *will not* be downloaded at all.

Usage (Server Provision)
========================
Using the server.pp in the Vagrantfile will bring up a server with Apache, PHP and Myplace installed.

MySQL will not be installed.

The Myplace Application code will be downloaded from the myplace/ module and moved into place at /moodle/web

The Myplace config.php file will be generated in to /moodle/web/config.php
