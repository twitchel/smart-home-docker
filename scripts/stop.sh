#!/bin/bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

if [ -z "$SHD_HOST" ]; then
    read -r -p "SHD_HOST environment variable not defined. Enter the stack name you want to stop: " hostname
    export SHD_HOST=$hostname
fi
docker-compose --env-file .env -f docker-compose.yml down