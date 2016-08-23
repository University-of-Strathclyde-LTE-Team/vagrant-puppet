include puppi
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



