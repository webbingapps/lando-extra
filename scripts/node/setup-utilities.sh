#!/bin/bash

# TODO: Add svgo config file to www-data user's home

# Init
readonly USER_PATH=/var/www
cd $USER_PATH || return

# Install svg-sprite-generate
npm install -g svg-sprite-generator

# Install svgo
npm -g install svgo