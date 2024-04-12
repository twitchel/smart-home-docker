#!/bin/bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

function doInit() {
    echo "⚙️  Setting up config for host $SHD_HOST"

}

if [ -z "$SHD_HOST" ]; then
    read -r -p "🖥️  SHD_HOST environment variable not defined. Enter the host you want to initialize: " hostname
    echo
    export SHD_HOST=$hostname

    if [ -z "$SHD_HOST" ]; then
      echo "❌  Host cannot be empty. Init cancelled"
      exit
    fi
fi

read -p "⚠️  This will setup the environment for this host. It will clear existing appdata if it exists. Are you sure? [y/N] " choice
echo
case "$choice" in
  y|Y ) doInit;;
  n|N ) echo "ℹ️  Init cancelled";;
  * ) echo "invalid";;
esac
