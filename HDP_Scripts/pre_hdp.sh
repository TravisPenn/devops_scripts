#!/usr/bin/env bash

#
# Please note this script must be run pre-installation on ALL cluster nodes to add the necessary repos to yum
#

cd /tmp

# Get scripts
yum install git -y
git clone https://github.com/Cerebri/devops_scripts.git
cd devops_scripts
chmod -R -v u+x ./*

# Install Java and Anaconda
#./CENTOS_Scripts/centos_install_java.sh

# Install Datastax repo
./HDP_Scripts/hdp_install_repos.sh