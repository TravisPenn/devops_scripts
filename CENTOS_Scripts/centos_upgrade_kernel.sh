#!/usr/bin/env bash

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
#rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

yum install yum-plugin-fastestmirror -y

uname -r

yum remove -y kernel-headers kernel-tools kernel-tools-libs

yum install --enablerepo=elrepo-kernel kernel-ml.x86_64 kernel-ml-tools.x86_64 kernel-ml-tools-libs.x86_64 -y

# To install for development
#yum install --enablerepo=elrepo-kernel kernel-ml.x86_64 kernel-ml-devel.x86_64 kernel-ml-headers.x86_64 kernel-ml-tools.x86_64 kernel-ml-tools-libs.x86_64 kernel-ml-tools-libs-devel.x86_64

# enable for grub default boot
awk -F "'" '$1=="menuentry " {print $2}' /etc/grub2.cfg
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg

reboot
