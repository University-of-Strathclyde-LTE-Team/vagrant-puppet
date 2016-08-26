#include myplace
$username = ''
$password = ''

class { 'myplace':
    install_dir => '/moodle/web',
}

myplace::mod { 'mod-strathcom': 
    version => 'trunk',
    basicauthusername => "${username}",
    basicauthpassword => "${password}"
}
myplace::mod { 'mod-mycoursework':
    version => 'trunk',
    basicauthusername => "${username}",
    basicauthpassword => "${password}"

}
