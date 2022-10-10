#!/bin/bash

# Variables & Constants
readonly LANDO_EXTRA_PATH=/lando-extra
readonly PROJECT_PATH=/app

# Install dependencies
#composer global require jeffreyvanrossum/tailpress-installer

# Themes
# Install and activate TailPress
cd $PROJECT_PATH/wp-content/themes || exit
git clone https://github.com/jeffreyvr/tailpress.git tailpress-theme
cd tailpress-theme && rm -rf .git