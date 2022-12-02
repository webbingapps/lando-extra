#!/bin/bash

# Init
cd /tmp/ || exit
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app

# Install
echo "Installing PHPRedis"
# Doesn't seem to be working though
yes | pickle install redis

#apt update -y
#apt install libzstd-dev liblz4-dev -y
#pecl install -D 'enable-redis-igbinary="yes" enable-redis-lzf="yes" enable-redis-lz4="yes" enable-redis-zstd="yes" with-liblz4="yes"' redis