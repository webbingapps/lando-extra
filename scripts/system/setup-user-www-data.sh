#!/bin/bash

# Init
readonly LANDO_EXTRA_PATH=/lando-extra/configs/system
readonly USER_PATH=/var/www
cd $USER_PATH || return

# Symlink profile files
cp -af $LANDO_EXTRA_PATH/shell/.profile $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.bashrc $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.aliases $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.vimrc $USER_PATH
cp -af $LANDO_EXTRA_PATH/composer/config.json $USER_PATH

# Set Bash as default shell
chsh -s /bin/bash www-data

# Source user's .profile
source $USER_PATH/.profile