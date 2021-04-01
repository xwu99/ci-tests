#!/usr/bin/env bash

set -x

ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ls -ld ~/.ssh
ls -l ~/.ssh

echo "    StrictHostKeyChecking no                     " | sudo tee -a /etc/ssh/ssh_config
# echo "RSAAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
# Disable strict modes for less strict permission checking, should add this to work
echo "StrictModes no" | sudo tee -a /etc/ssh/sshd_config

sudo systemctl restart ssh

ssh -v `hostname`