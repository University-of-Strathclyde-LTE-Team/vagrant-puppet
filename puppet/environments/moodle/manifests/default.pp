# Development Virtual Machine provisioner
# This script sets up an Apache web server, with PHP and installs Myplace

# Global variables
$phpversion     = '7.0.9' # PHP version to compile
$myplace_url        = "http://localhost/"
$wwwroot    = '/moodle/web'
$dataroot   = '/moodle/data'
$version    = 'quack'
$myplacedbhost = 'localhost'
$myplacedb          = 'moodle'
$myplacedbusername  = 'moodle'
$myplacedbpassword  = 'moodle'

# System
# Install Apache
notice("Installing Apache")
if true {
    class { 'apache': 
        default_vhost => false,
        mpm_module => "prefork"
    }

    apache::vhost { 'web' :
        port 	=> '80',
        docroot 	=> $wwwroot
    }
}
# PHP
if true {
    notice("Installing PHP")
    class { 'php': 
        version => $phpversion,
        apxs2 => '/usr/bin/apxs2',
        ldap => false,
        oci8 => false,
    #    cli => false,
    }
}
# Mysql
if true {
    notice("Installing MySQL")
    $override_options =  {
        'mysqld' => {
           'default_storage_engine' => 'innodb',
            'innodb_file_per_table' => '1',
            'innodb_file_format' => 'Barracuda'
        }
    }
    class { '::mysql::server':
        override_options => $override_options
    }
    mysql::db { $myplacedb:
            user => $myplacedbusername,
            password => $myplacedbpassword,
            host => $myplacedbhost,
            grant => ['GRANT','SELECT','INSERT','UPDATE','DELETE','CREATE','CREATE TEMPORARY TABLES', 'DROP','INDEX','ALTER']
        }
} else {
    notice("Skipping MySQL")
}

# Myplace
notice("Installing Myplace")
class { 'myplace':
    require => [Class['apache']],
    url => $myplace_url,
    install_dir => $wwwroot,
    data_dir => $dataroot,
	version => myplace_version,
	dbhost =>$myplacedbhost,
    db  => $myplacedb,
    dbuser   => $myplacedbusername,
    dbpass   => $myplacedbpassword
}
