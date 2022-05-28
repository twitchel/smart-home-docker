#!/usr/bin/env bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

dockerFiles=(-f "$(PWD)/common.docker-compose.yml")

if [ "$HOME_ASSISTANT_ENABLED" == "true" ]; then
  dockerFiles+=(-f "$(PWD)/apps/homeassistant/docker-compose.yml")
fi



docker-compose --env-file .env "${dockerFiles[@]}" down