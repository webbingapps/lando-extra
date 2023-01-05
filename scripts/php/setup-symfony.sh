#!/bin/bash

# Init
cd /tmp/ || return
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app

# Download and Install
wget https://get.symfony.com/cli/installer -O - | bash

# Make it globally available
mv /root/.symfony5/bin/symfony /usr/local/bin/symfony