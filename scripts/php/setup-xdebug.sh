#!/bin/bash

# TODO: Add server detectiona and execution of right one

# XDEBUG
# For manual turning on and off with help of the Tooling section

## APACHE
rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && /etc/init.d/apache2 reload

## NGINX
# rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && pkill -o -USR2 php-fpm
