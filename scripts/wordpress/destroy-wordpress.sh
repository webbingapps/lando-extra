#!/bin/bash

# Variables & Constants
readonly APP_PATH=/app

# Delete everything in Laravel directory
find $APP_PATH -mindepth 1 -maxdepth 1 -exec rm -r -- {} +
