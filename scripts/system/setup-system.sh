#!/bin/bash

# System
apt update -y
apt upgrade -y
apt install vim neofetch net-tools openssh-server wget lsof iptables cron iputils-ping -y
apt clean -y && apt autoclean -y && apt autoremove -y && rm -rf /var/lib/apt/lists/* && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

# Miscelanea

## Allow non-root uset to change shell without password input
sed s/required/sufficient/g -i /etc/pam.d/chsh

## Change www-data user's password
passwd www-data -d
echo "www-data:password" | chpasswd

## Set timezone
ln -snf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo "Europe/Madrid" > /etc/timezone