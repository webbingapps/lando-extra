#!/bin/bash

# TODO: Add Deno to Node

# Init
readonly USER_PATH=/var/www
cd $USER_PATH || return

# Install
curl -fsSL https://deno.land/x/install/install.sh | sh