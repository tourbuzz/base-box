#!/bin/bash

echo "Disabling selinux"
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
(sestatus | grep 'Mode from config file:.*permissive' > /dev/null 2>&1) || echo "WARNING: selinux not disabled properly"
