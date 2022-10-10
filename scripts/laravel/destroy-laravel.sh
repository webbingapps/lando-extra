#!/bin/bash

# Variables & Constants
readonly LARAVEL_PATH=/app

# Delete everything in Laravel directory
find $LARAVEL_PATH -mindepth 1 -maxdepth 1 -exec rm -r -- {} +
