#!/bin/bash

echo "Installing public key for vagrant"
mkdir /home/vagrant/.ssh

case "$PACKER_BUILDER_TYPE" in 

virtualbox-iso|virtualbox-ovf) 
    wget --no-check-certificate \
        'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub' \
        -O /home/vagrant/.ssh/authorized_keys
    ;;

amazon-ebs) 
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP+jQBBh1hxcoGDB4zkAy+XoR2iFQI8BBwQnHTGGsFOVGCHELUarsql+Uuh/C5jns8JYDYl+kAm5Qc62J117o1Z/E8ZqNg6jvwukBeTwZx+baS4vDx6Ru67Fx6I2q5GQbJ6hmw0Wn0fM9M7PQPC6r55PiMwhGJG/DBbb42c3x2mfIygSPlFHJPn14kJMGVECgqcp3TsnrMZuCCL8Ri9Jr/ge8o/WVkxnjA8hCfyYUfhMNhJWj19irHMxlHPF8nl45D769guLGRdeB0NVhYnqc2AE397u726yEcfCP188hwfAEu0iltGWOhjhpvs/87AsGW4STuhD1hpA8DSOWKoojV" \
        > /home/vagrant/.ssh/authorized_keys
    ;;

*)
    echo "Unknown Packer Builder Type >>$PACKER_BUILDER_TYPE<< selected."
    echo "Known are virtualbox-iso|virtualbox-ovf|amazon-ebs."
    ;;

esac

chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
