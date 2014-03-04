#!/bin/bash

case "$PACKER_BUILDER_TYPE" in 

virtualbox-iso|virtualbox-ovf) 
    mkdir /home/vagrant/.ssh
    wget --no-check-certificate \
        'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
        -O /home/vagrant/.ssh/authorized_keys
    chown -R vagrant /home/vagrant/.ssh
    chmod -R go-rwsx /home/vagrant/.ssh
    ;;

*)
    echo "Unknown Packer Builder Type >>$PACKER_BUILDER_TYPE<< selected."
    echo "Known are virtualbox-iso|virtualbox-ovf|amazon-ebs."
    ;;

esac

