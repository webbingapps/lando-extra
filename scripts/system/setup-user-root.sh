#!/bin/bash

# Init
readonly LANDO_EXTRA_PATH=/lando-extra/configs/system
readonly USER_PATH=/root
cd $USER_PATH || return

# Symlink profile files
cp -af $LANDO_EXTRA_PATH/shell/.profile $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.bashrc $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.aliases $USER_PATH
cp -af $LANDO_EXTRA_PATH/shell/.vimrc $USER_PATH

# Set Bash as default shell
usermod --shell /bin/bash root