#!/bin/bash

# Init
readonly USER_PATH=/var/www
cd $USER_PATH || return

# Clean install NVM
rm -f $USER_PATH/n
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n

# Install Nodejs 18
bash n 16

# Install latest NPM, Yarn and set up Corepack
npm install --global npm@latest yarn@latest
corepack enable
yarn set version stable
yarn plugin import https://yarn.build/latest
