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


Usage
=====
1. Install vagrant
2. Install vagrant dependencies
3. Clone this repo to your machine
4. Execute ```git submodule init```
5. Execute ```git submodule update```
6. Execute ```vagrant up```
