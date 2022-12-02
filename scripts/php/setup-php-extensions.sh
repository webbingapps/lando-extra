#!/bin/bash

# Init
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app
cd ~ || return

# Install
echo "Installing Additional PHP extensions"
yes | pickle install igbinary