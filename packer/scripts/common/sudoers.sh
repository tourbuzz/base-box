#!/bin/bash -eux

grep "^%wheel" /etc/sudoers || echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
grep "SSH_AUTH_SOCK" /etc/sudoers || echo "Defaults env_keep+=SSH_AUTH_SOCK" >> /etc/sudoers
# vagrant prefers no tty
echo "Defaults !requiretty" >> /etc/sudoers
