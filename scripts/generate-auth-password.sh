#!/bin/bash

PWD=$(pwd)

source ./scripts/bootstrap.sh "$PWD"

read -r -p "🔐  Enter your password for secure areas of your smart home stack: " password
docker run authelia/authelia:4.37.5 authelia hash-password $password