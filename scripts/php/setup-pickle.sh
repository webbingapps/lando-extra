#!/bin/bash

# Init
cd /tmp/ || return
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app

# Install
echo "Installing Pickle"
curl -fLOS https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar
chmod +x pickle.phar
mv pickle.phar /usr/local/bin/pickle