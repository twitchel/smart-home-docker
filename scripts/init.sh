#!/usr/bin/env bash

PWD=$(pwd)
source ./scripts/bootstrap.sh "$PWD"

echo "⚙️  Setting up config"

echo $DATADIR

if [[ ! -d "$DATADIR/mosquitto" ]]; then
  echo "Mosquitto config"
  mkdir -p "$DATADIR/mosquitto"
  cp -r "$PWD/apps/mosquitto/config" "$DATADIR/mosquitto"
fi

if [[ ! -d "$DATADIR/zerotier" && $ZEROTIER_ENABLED == 'true' ]]; then
  echo "Zerotier config"
  mkdir -p "$DATADIR/zerotier"
  if [ ! -z "$ZEROTIER_NETWORK" ]; then
    mkdir -p "$DATADIR/zerotier/networks.d"
    touch "$DATADIR/zerotier/networks.d/$ZEROTIER_NETWORK.conf"
  fi
fi

if [[ ! -d "$DATADIR/homeassistant" ]]; then
  echo "Home Assistant config"
  mkdir -p "$DATADIR/homeassistant"
fi
