#!/bin/bash

# Variables & Constants
readonly LARAVEL_PATH=/app

# Install Laravel
echo "Installing Jetstream"
cd $LARAVEL_PATH && composer require laravel/jetstream
cd $LARAVEL_PATH && php artisan jetstream:install livewire
cd $LARAVEL_PATH && php artisan vendor:publish --tag=jetstream-views
