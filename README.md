# Ubuntu

Built from ubuntu/bionic64 (Ubuntu 18.04.1 LTS) Vagrant box, and provisioned with:

- [Docker](https://www.docker.com) version 18.06.0-ce, build 0ffa825
- [docker-compose](https://docs.docker.com/compose) version 1.22.0, build f46880f
- [Oracle Java](https://www.oracle.com/java) version 1.8.0_181
- [Apache Maven](https://maven.apache.org) 3.5.3
- [Mozilla Firefox](https://www.mozilla.org) 61.0.1
- [LDAP Utils](https://wiki.debian.org/LDAP/LDAPUtils) 2.4.45

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
