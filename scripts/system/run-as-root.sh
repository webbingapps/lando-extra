#!/bin/bash

# Start services
service ssh start
service cron start
if [ -x "$(command -v redis-server)" ]; then
  redis-server /lando-extra/configs/redis/redis.conf --daemonize yes
fi