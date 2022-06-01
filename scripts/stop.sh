#!/bin/bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

dockerFiles=(-f "$PWD/common.docker-compose.yml")

if [ "$HOME_ASSISTANT_ENABLED" == "true" ]; then
  dockerFiles+=(-f "$PWD/apps/homeassistant/docker-compose.yml")

   if [ "$HOME_ASSISTANT_ZIGBEE_ENABLED" == "true" ]; then
      dockerFiles+=(-f "$PWD/apps/homeassistant/zigbee.docker-compose.yml")
    fi

    if [ "$HOME_ASSISTANT_ZWAVE_ENABLED" == "true" ]; then
      dockerFiles+=(-f "$PWD/apps/homeassistant/zwave.docker-compose.yml")
    fi
fi

if [ "$EUFY_SECURITY_ENABLED" == "true" ]; then
    dockerFiles+=(-f "$PWD/apps/eufy-security/docker-compose.yml")
fi

if [ "$ZEROTIER_ENABLED" == "true" ]; then
  dockerFiles+=(-f "$PWD/apps/zerotier/docker-compose.yml")
fi

docker-compose --env-file .env "${dockerFiles[@]}" down