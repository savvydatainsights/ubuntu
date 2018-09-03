# Ubuntu

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![GitHub release](https://img.shields.io/github/release/savvydatainsights/ubuntu.svg)]() [![Build status](https://travis-ci.org/savvydatainsights/ubuntu.svg?branch=master)](https://travis-ci.org/savvydatainsights/ubuntu)

Custom Ubuntu image, built from Ubuntu 18.04 LTS, and provisioned with:

- [Docker](https://www.docker.com)
- [docker-compose](https://docs.docker.com/compose)
- [Oracle Java](https://www.oracle.com/java)
- [Apache Maven](https://maven.apache.org)
- [Mozilla Firefox](https://www.mozilla.org)
- [LDAP Utils](https://wiki.debian.org/LDAP/LDAPUtils)

## Requirements

The provision process is performed by [Ansible](https://www.ansible.com). Install it upfront.

## Vagrant box

For creating the Vagrant box, first of all, install [Vagrant](https://www.vagrantup.com), and then follow the steps:

1. `vagrant box update`
2. `vagrant up`
3. `vagrant ssh`
   1. `sudo apt-get clean`
   2. `sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*`
   3. `sudo dd if=/dev/zero of=/EMPTY bs=1M`
   4. `sudo rm -f /EMPTY`
   5. `cat /dev/null > ~/.bash_history && history -c && exit`
4. `vagrant package --output ubuntu.box`
5. `vagrant box add --name savvydatainsights/ubuntu ubuntu.box`
6. `vagrant destroy -f && rm -rf .vagrant/ ubuntu-bionic-18.04-cloudimg-console.log roles/`

## Azure image

For creating the Azure image, first of all, install [Packer](https://www.packer.io), and then follow the steps:

1. Create the resource group *myResourceGroup* in Azure
2. Create a service principal in Azure with permission to create resource groups
3. Set the environment variables *AZURE_CLIENT_ID*, *AZURE_SECRET*, *AZURE_SUBSCRIPTION_ID* and *AZURE_TENANT* with the service principal authentication info
4. Install the required Ansible roles by executing `ansible-galaxy install -r requirements.yml`
5. Build the Ubuntu image *myUbuntuImage* in the resource group *myResourceGroup* by executing `packer build azure.json`
