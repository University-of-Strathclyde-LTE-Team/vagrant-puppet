# This manifest installs Myplace from a source tgz package
# By default this is installed on to the directory shared from the host machine.
# This allows local management of the source code.o

class { 'myplace':
    install_dir => '/vagrant/web',
    version => 'quack',
    source_url => 'puppet:///modules/myplace/myplace_quack.tgz'
}
