#!/bin/bash
set -xe

# build
docker-compose build
sleep 5
# docker cachet init
docker-compose up -d
sleep 5
# add env
APP_KEY="$(docker-compose logs | grep ERROR | sed "s/^.*APP/APP/;s/'.*//" > .env)"
sleep 5
# docker-compose restart
docker-compose up -d