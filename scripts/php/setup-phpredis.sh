#!/bin/bash

# Init
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app

# Install
echo "Installing PHPRedis"
pickle -n install redis