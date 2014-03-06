#!/bin/bash -eux

# only allow key-based, non-root, 'vagrant' ssh login on port 1471
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "AllowUsers vagrant" >> /etc/ssh/sshd_config
sed -i -e 's/^\#\?Port 22\b/Port 1471/' /etc/ssh/sshd_config
sed -i -e 's/^-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT/-A INPUT -m state --state NEW -m tcp -p tcp --dport 1471 -j ACCEPT/' /etc/sysconfig/iptables


# speed things up
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
