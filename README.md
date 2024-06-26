# Smart Home Docker Collection
This is a simple setup you can run on a linux based server to make your home smarter!

## Requirements
- Any linux/unix based server. Images have been chosen that can run on both Intel and ARM architecture.
- Docker
- Docker compose
- Make

## Services included

### Apps
- Home assistant - Home automation shenannigans!
- ZWaveJS2MQTT - Z-wave device support for Home Assistant
- Zerotier client - Great free VPN service. Self hosted version coming soon to this stack

### Supporting Services
- Mosquitto - MQTT service
- Watchtower - Container updater

## Setup

1. Clone this repo to your local machine
2. Copy the `.env.dist` file to `.env` in the working directory
```shell
cp .env.dist .env
```
3. Update the relevant environment details in the .env file to match your setup
4. Run the init command to copy bootstrap config files
```shell
make init
```
5. Once this is done, you can start the stack
```shell
make start
```
6. To tear it down
```shell
make stop
```

## The future

### Templating?
Can make use potentially of go-style templating in bash using something like:

```bash
eval "cat <<EOF
$(<conf/traefik.tpl)
EOF
" > conf/traefik.yml
```

Where Traefik.tpl uses environment variable names in place of hard-coded values