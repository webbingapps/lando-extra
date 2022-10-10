#!/bin/bash

# Variables & Constants
readonly LARAVEL_PATH=/app

# Run migrations
cd $LARAVEL_PATH && php artisan migrate

# Compile frontend assets
cd $LARAVEL_PATH || exit
if [ -d "node_modules" ]; then
  npm install && npm run build
fi
