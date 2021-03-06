#!/bin/bash
# create new ssh key
mkdir -p /home/ubuntu/.ssh
ssh-keygen -f /home/ubuntu/.ssh/mykey -N ''
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
# install packages
apt-get update
apt-get -y install docker.io ansible unzip
# add docker privileges
usermod -G docker ubuntu
# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -f get-pip.py
# install awscli and ebcli
pip install awscli
pip install awsebcli
cd /usr/local/bin
wget -q https://releases.hashicorp.com/terraform/0.7.7/terraform_0.7.7_linux_amd64.zip
unzip terraform_0.7.7_linux_amd64.zip
# packer
wget -q https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip
unzip packer_0.10.2_linux_amd64.zip
# clean up
apt-get clean
rm terraform_0.7.7_linux_amd64.zip
rm packer_0.10.2_linux_amd64.zip
