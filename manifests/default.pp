# This script sets up an Apache web server, 
# The wwwroot directory is set to a shared folder exposed by the host
# See corresponding Vagrantfile


$phpversion = '7.0.9'
#Exec { path =}

# System

# Install Apache
class { 'apache': 
    default_vhost => false,
    mpm_module => "prefork"
}

apache::vhost { 'web' :
    port 	=> '80',
    docroot 	=> '/vagrant/web',
    priority	=> ''
}

# PHP
class { 'php': 
    version => $phpversion,
    apxs2 => '/usr/bin/apxs2',
    ldap => false,
    oci8 => false,
#    cli => false,
}

# Mysql
class { 'myplace':
    install_dir => '/vagrant/web'
    version => 'quack'
    source_url => 'http://www.strath.ac.uk/media/1newwebsite/images-general/logo_150x150.svg'
}

