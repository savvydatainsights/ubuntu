# Ubuntu

SDI base Ubuntu image, with:

- [Docker](https://www.docker.com)
- docker-compose
- [Oracle Java](https://www.oracle.com/java)
- [Maven](https://maven.apache.org)
- Firefox
- LDAP Utils

## Vagrant box

For creating the Vagrant box, follow the steps:

1. `vagrant up`
2. `vagrant ssh`
   1. `sudo apt-get clean`
   2. `sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*`
   3. `sudo dd if=/dev/zero of=/EMPTY bs=1M`
   4. `sudo rm -f /EMPTY`
   5. `cat /dev/null > ~/.bash_history && history -c && exit`
3. `vagrant package --output ubuntu.box`
4. `vagrant box add --name savvydatainsights/ubuntu ubuntu.box`
5. `vagrant destroy -f && rm -rf *.retry .vagrant/ ubuntu-bionic-18.04-cloudimg-console.log`
