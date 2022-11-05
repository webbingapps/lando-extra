#!/bin/bash

# Install WP CLI
cd /tmp/ || return
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Add WordPress cron job
crontab /lando-extra/configs/wordpress/cron-wordpress.txt