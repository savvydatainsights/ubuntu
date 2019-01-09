#!/bin/bash

VAGRANT_CLOUD_USER=savvydatainsights
VAGRANT_CLOUD_BOX=ubuntu

BOX_VERSION=$(date '+%Y%m%d.0.0')
BOX_FILE=$VAGRANT_CLOUD_BOX-$BOX_VERSION.box

echo "Updating the vagrant box, if necessary"
vagrant box update | tee box-update-output.txt
BASE_BOX_VERSION=$(grep -o "'[a-zA-Z0-9]*/[a-zA-Z0-9]*' (v[0-9.]*)" -m 1 box-update-output.txt)

echo "Bootstrapping the $VAGRANT_CLOUD_BOX server"
vagrant up --no-provision

echo "Provisioning the $VAGRANT_CLOUD_BOX server"
vagrant provision
UBUNTU_VERSION=$(cat ubuntu-version.txt)

echo "Baking the $VAGRANT_CLOUD_BOX server"
rm -f $BOX_FILE && vagrant package --output $BOX_FILE

# Requires VAGRANT_CLOUD_TOKEN
echo "Publish the new box version in Vagrant Cloud"
JAVA_VERSION=$(cat java-version.txt)
VERSION_DESCRIPTION="Built from $BASE_BOX_VERSION - $UBUNTU_VERSION - and provisioned with Oracle JDK $JAVA_VERSION."
vagrant cloud publish $VAGRANT_CLOUD_USER/$VAGRANT_CLOUD_BOX $BOX_VERSION virtualbox $BOX_FILE --version-description "$VERSION_DESCRIPTION" --force --release

echo "Removing the $VAGRANT_CLOUD_BOX server"
vagrant destroy -f

echo "Cleaning up everything and exiting"
rm -rf .vagrant ubuntu-*-cloudimg-console.log roles *-version.txt box-update-output.txt $BOX_FILE
exit 0
