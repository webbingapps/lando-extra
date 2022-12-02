#!/bin/bash

# System
apt update -y
apt upgrade -y
apt install procps lsb-release vim neofetch openssh-server wget net-tools lsof iptables cron iputils-ping -y

# Miscelanea

## Allow non-root uset to change shell without password input
sed s/required/sufficient/g -i /etc/pam.d/chsh

## Change www-data user's password
passwd www-data -d
echo "www-data:password" | chpasswd

## Set timezone
ln -snf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "Europe/Madrid" > /etc/timezone