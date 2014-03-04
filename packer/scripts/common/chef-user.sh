#!/bin/bash

echo "Installing 'chef' user"
useradd chef -G wheel -u 901

echo "Installing tourbuzz-showcase-keypair.pem public key into authorized_keys"
mkdir /home/chef/.ssh
chown -R chef /home/chef/.ssh
chmod -R go-rwsx /home/chef/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP+jQBBh1hxcoGDB4zkAy+XoR2iFQI8BBwQnHTGGsFOVGCHELUarsql+Uuh/C5jns8JYDYl+kAm5Qc62J117o1Z/E8ZqNg6jvwukBeTwZx+baS4vDx6Ru67Fx6I2q5GQbJ6hmw0Wn0fM9M7PQPC6r55PiMwhGJG/DBbb42c3x2mfIygSPlFHJPn14kJMGVECgqcp3TsnrMZuCCL8Ri9Jr/ge8o/WVkxnjA8hCfyYUfhMNhJWj19irHMxlHPF8nl45D769guLGRdeB0NVhYnqc2AE397u726yEcfCP188hwfAEu0iltGWOhjhpvs/87AsGW4STuhD1hpA8DSOWKoojV" > /home/chef/.ssh/authorized_keys
