#!/usr/bin/env bash

set -x

ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ls -ld ~/.ssh
ls -l ~/.ssh

# Disable strict host key checking
echo "    StrictHostKeyChecking no                     " | sudo tee -a /etc/ssh/ssh_config
# Disable strict modes for less strict permission checking
echo "StrictModes no" | sudo tee -a /etc/ssh/sshd_config

sudo systemctl restart ssh

ssh -v `hostname`