#!/usr/bin/env bash

set -x

ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
echo "    StrictHostKeyChecking no                     " | sudo tee -a /etc/ssh/ssh_config
echo "RSAAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
sudo service ssh restart

cat ~/.ssh/authorized_keys
cat /etc/ssh/ssh_config
cat /etc/ssh/sshd_config

ls -ld ~/.ssh
ls -l ~/.ssh

# sudo systemctl restart sshd

# ssh -vvv localhost
ssh -vvv `hostname`