What Happens (With Vagrant)
===========================

1. Vagrant provisions a new virtual box
2. Sets up a shared folder to the host's vagrant directory on guest:/vagrant
3. Sets up a shared folder to the host's vagrant/web directory on guest:/moodle/web
4. Vagrant provisions puppet deb to guest
5. Vagrant installs puppet as a shell script
6. Vagrant initiates puppet
7. Puppet installs apache server, creating /moodle/web directory 
(however this already exists as a vagrant shared folder, but that's OK)
8. Puppet installs PHP
9. Puppet installs MySQL
10. Puppet creates /moodle/data directory
