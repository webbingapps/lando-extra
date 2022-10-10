#!/bin/bash

# Init
readonly LANDO_EXTRA_PATH=/lando-extra
readonly LARAVEL_PATH=/app

# Install Laravel
echo "Installing Laravel"
composer create-project laravel/laravel $LARAVEL_PATH

# Copy custom .env file into project
cp $LANDO_EXTRA_PATH/configs/laravel/.env $LARAVEL_PATH/.env

# Change default config files values
sed -i "s/'timezone' => 'UTC'/'timezone' => env('APP_TIMEZONE', 'UTC')/" $LARAVEL_PATH/config/app.php
sed -i "s/'locale' => 'en'/'locale' => env('APP_LOCALE', 'en')/" $LARAVEL_PATH/config/app.php
sed -i "s/'fallback_locale' => 'en'/'fallback_locale' => env('APP_FALLBACK_LOCALE', 'en')/" $LARAVEL_PATH/config/app.php
sed -i "s/'faker_locale' => 'en_US'/'faker_locale' => env('APP_FAKER_LOCALE', 'en_US')/" $LARAVEL_PATH/config/app.php
sed -i "s/'expire_on_close' => false/'expire_on_close' => env('SESSION_EXPIRE_ON_CLOSE', false)/" $LARAVEL_PATH/config/session.php
sed -i "s/'encrypt' => false/'encrypt' => env('SESSION_ENCRYPT', false)/" $LARAVEL_PATH/config/session.php
sed -i "s/'table' => 'sessions'/'table' => env('SESSION_TABLE', 'sessions')/" $LARAVEL_PATH/config/session.php
sed -i "s/'path' => '\/'/'path' => env('SESSION_PATH', '\/')/" $LARAVEL_PATH/config/session.php
sed -i "s/'http_only' => true/'http_only' => env('SESSION_HTTP_ONLY', true)/" $LARAVEL_PATH/config/session.php
sed -i "s/'same_site' => 'lax'/'same_site' => env('SESSION_SAME_SITE', 'lax')/" $LARAVEL_PATH/config/session.php
cd $LARAVEL_PATH && php artisan key:generate --ansi
cd $LARAVEL_PATH && php artisan storage:link
