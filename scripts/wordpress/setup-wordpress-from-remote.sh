#!/bin/bash

# Check if rsync exists
# Check if wp cli exists
# If Yes then
# check remote connection
# check if rsync exists on remote
# check if wp cli exists on remote
# check if remote folder exists
# check if remote folder contains wordpress installation
# sync files from remote to local
# sync database from remote to local
# close connection
# search-replace database entries from remote URL to local URL
# clear local files cache:
#   - wp optimize
#   - avada
#   - ...
# check local WordPress installation




# Checking whether WordPress is installed or not
if ! wp core is-installed --path="/app"; then

  # Install WordPress
  wp core download --path="/app" \
    --version="latest" \
    --locale="en_US" \
    --skip-content \
    --force \
    --skip-plugins \
    --skip-themes \
    --skip-packages \
    --quiet

fi
