# Smart Home Docker Collection
This is a simple setup you can run on and linux based server to make your home smarter!

## Requirements
- Any linux/unix based server. Images have been chosen that can run on both Intel and ARM architecture.
- Docker
- Docker compose
- Make

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