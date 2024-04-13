#!/bin/bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

read -r -p "🔐  Enter your password for secure areas of your smart home stack: " password
docker run authelia/authelia:$AUTHELIA_VERSION authelia hash-password $password