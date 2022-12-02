#!/bin/bash

# Start services
if [ -x "$(command -v ssh)" ]; then
  service ssh start
fi
if [ -x "$(command -v cron)" ]; then
  service cron start
fi
if [ -x "$(command -v redis-server)" ]; then
  redis-server /lando-extra/configs/redis/redis.conf --daemonize yes
fi