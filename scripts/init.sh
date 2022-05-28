#!/usr/bin/env bash

PWD=$(pwd)
source ./scripts/bootstrap.sh "$PWD"

if [ -f "$DATADIR/.initcomplete" ]; then
  echo "Init has already been run and config populated."
  echo "If you wish to run again, remove the below file:"
  echo "$DATADIR/.initcomplete"
  echo "⚠️  WARNING: This will destroy your existing application data! ⚠️"
  exit 1
fi

rm -rf "${DATADIR:?}/*"

echo "Setting up config"
mkdir -p "$DATADIR/mosquitto"
cp -r "$PWD/apps/mosquitto/config" "$DATADIR/mosquitto"

mkdir -p "$DATADIR/homeassistant"

echo "Booting stack"
sh ./scripts/start.sh "$PWD"

touch "$DATADIR/.initcomplete"