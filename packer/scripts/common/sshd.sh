#!/bin/bash -eux

# only allow key-based, non-root, 'chef' ssh login on port 1471
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "AllowUsers chef" >> /etc/ssh/sshd_config
sed -i -e 's/^\#\?Port 22\b/Port 1471/' /etc/ssh/sshd_config

# speed things up
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
