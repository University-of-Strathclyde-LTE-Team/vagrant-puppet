# Development Server
# This script sets up an Apache web server, with PHP and Mysql

# Global variables
$myplace_wwwroot = '/vagrant/web'
$myplace_dataroot = '/vagrant/data'

# Set to true to install Apache web server
$install_apache = true

# Set to true to download and compile PHP from source
$install_php    = true
$phpversion     = '7.0.9' # PHP version to compile

# Install  MySQL DB Server   
$install_mysql  = true
$myplacedb = 'myplace'  
$myplacedbuser = 'myplace'
$myplacedbpassword = ''     

#Exec { path =}

# System
 if ($install_apache) {
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
} else {
    notice("Skipping Apache")
}

# PHP
if ($install_php) {
    notice("Installing PHP")
    class { 'php': 
        version => $phpversion,
        apxs2 => '/usr/bin/apxs2',
        ldap => false,
        oci8 => false,
    #    cli => false,
    }
} else {
    notice("Skipping PHP")
}

# Mysql
if ($install_mysql) {
    notice("Installing MySQL")
    $override_options =  {
        'mysqld' => {
           'default_storage_engine' => 'innodb',
            'innodb_file_per_table' => '1',
            'innodb_file_format' => 'Barracuda'
        }
    }
    class { '::mysql::server':
#        pacakge_name    => 'mysql-server',
        override_options => $override_options
    }
    mysql::db { $myplacedb:
            user => $myplacedbuser,
            password => $myplacedbpassword,
            host => 'localhost',
            grant => ['GRANT','SELECT','INSERT','UPDATE','DELETE','CREATE','CREATE TEMPORARY TABLES', 'DROP','INDEX','ALTER']
        }
} else {
    notice("Skipping MySQL")
}

if ($install_mysql) {
    notice("You may have to set the following in config.php: DB ${myplacedb}, dbuser = '${myplacedbuser}. dbpass = ${myplacedbpassword}")
}

# Ensure data root exists
file { $myplace_dataroot :
	ensure => 'directory'
}

notice("Myplace wwwroot is ${myplace_wwwroot}")
notice("Myplace dataroot is ${myplace_dataroot}")
