#!/bin/bash -eux

echo "Updating base packages"
yum -y update

echo "Installing dev tools"
yum -y groupinstall "Development Tools"
