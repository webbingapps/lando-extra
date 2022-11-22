#!/bin/bash

#WORDPRESS_PATH=/app

# Checking whether WordPress is installed or not
if ! wp core is-installed; then

  # Install WordPress
  wp core download \
    --version="latest" \
    --locale="en_US" \
    --skip-content \
    --force
  wp config create \
    --dbname=wordpress \
    --dbuser=wordpress \
    --dbpass=wordpress \
    --dbhost=database \
    --locale="en_US" \
    --skip-check
  wp core install \
    --url=https://wordpress.lndo.site/ \
    --title="Example WordPress site" \
    --admin_user="wordpress" \
    --admin_email="admin@example.com" \
    --admin_password="password" \
    --skip-email

  # Setup WordPress
  wp option update blogdescription "Example tagline"
  wp option update timezone_string "Europe/Tallinn"
  wp option update blog_public 0
  wp rewrite structure \
    '/%postname%/' \
    --hard

  # Clean up fresh WordPress
  wp comment delete "$(wp comment list --format=ids)" --force
  wp post delete "$(wp post list --post_type='post' --format=ids)" --force
  wp post delete "$(wp post list --post_type='page' --format=ids)" --force

  # Install necessary content
  wp theme install twentytwentythree --activate

  # Set up client's data
  # Create user
fi
