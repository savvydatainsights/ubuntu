# Ubuntu

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![GitHub release](https://img.shields.io/github/release/savvydatainsights/ubuntu.svg)]() [![Build status](https://travis-ci.org/savvydatainsights/ubuntu.svg?branch=master)](https://travis-ci.org/savvydatainsights/ubuntu)

Custom Ubuntu image, built from Ubuntu 18.04 LTS, and provisioned with:

- [Docker](https://www.docker.com)
- [docker-compose](https://docs.docker.com/compose)
- [OpenJDK](https://openjdk.java.net)
- [Apache Maven](https://maven.apache.org)
- [Apache Spark](https://spark.apache.org)
- [Mozilla Firefox](https://www.mozilla.org)
- [LDAP Utils](https://wiki.debian.org/LDAP/LDAPUtils)

## Requirements

The provision process is performed by [Ansible](https://www.ansible.com). Install it upfront.

## Vagrant box

For creating the Vagrant box, first of all, install [Vagrant](https://www.vagrantup.com), and then run:

`./build-and-deploy.sh`

The deployment step requires the environment variable *VAGRANT_CLOUD_TOKEN*. To set it, you must have defined a [token in Vagrant Cloud](https://www.vagrantup.com/docs/vagrant-cloud/users/authentication.html#authentication-tokens).

## Azure image

For creating the Azure image, first of all, install [Packer](https://www.packer.io), and then follow the steps:

1. Create the resource group *myResourceGroup* in Azure
2. Create a service principal in Azure with permission to create resource groups
3. Set the environment variables *AZURE_CLIENT_ID*, *AZURE_SECRET*, *AZURE_SUBSCRIPTION_ID* and *AZURE_TENANT* with the service principal authentication info
4. Build the Ubuntu image *myUbuntuImage* in the resource group *myResourceGroup* by executing `packer build azure.json`
