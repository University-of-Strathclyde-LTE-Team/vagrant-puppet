# This script sets up an Apache web server, with PHP and installs Myplace

# Global variables
$myplace_wwwroot = '/moodle/web'
$myplace_dataroot = '/moodle/data'
$phpversion     = '7.0.9' # PHP version to compile

# System
# Install Apache
    notice("Installing Apache")
    class { 'apache': 
        default_vhost => false,
        mpm_module => "prefork"
    }

    apache::vhost { 'web' :
        port 	=> '80',
        docroot 	=> $myplace_wwwroot,
        priority	=> ''
    }

# PHP
    notice("Installing PHP")
    class { 'php': 
        version => $phpversion,
        apxs2 => '/usr/bin/apxs2',
        ldap => false,
        oci8 => false,
    #    cli => false,
    }


# Myplace
    notice("Installing Myplace")
    class { 'myplace':
        install_dir => $myplace_wwwroot,
        data_dir => $myplace_dataroot,
    	version => 'quack',
	    source_url => 'http://www.strath.ac.uk/media/1newwebsite/images-general/logo_150x150.svg',
	    db  => $myplace
	    
    }

