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

amazon-ebs) 
    echo "Installing showcase_web"
    useradd showcase_web -G wheel -u 900
    mkdir /home/showcase_web/.ssh
    chown -R showcase_web /home/showcase_web/.ssh
    chmod -R go-rwsx /home/showcase_web/.ssh
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP+jQBBh1hxcoGDB4zkAy+XoR2iFQI8BBwQnHTGGsFOVGCHELUarsql+Uuh/C5jns8JYDYl+kAm5Qc62J117o1Z/E8ZqNg6jvwukBeTwZx+baS4vDx6Ru67Fx6I2q5GQbJ6hmw0Wn0fM9M7PQPC6r55PiMwhGJG/DBbb42c3x2mfIygSPlFHJPn14kJMGVECgqcp3TsnrMZuCCL8Ri9Jr/ge8o/WVkxnjA8hCfyYUfhMNhJWj19irHMxlHPF8nl45D769guLGRdeB0NVhYnqc2AE397u726yEcfCP188hwfAEu0iltGWOhjhpvs/87AsGW4STuhD1hpA8DSOWKoojV" > /home/showcase_web/.ssh/authorized_keys
    ;;

*)
    echo "Unknown Packer Builder Type >>$PACKER_BUILDER_TYPE<< selected."
    echo "Known are virtualbox-iso|virtualbox-ovf|amazon-ebs."
    ;;

esac

