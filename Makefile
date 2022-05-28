SHELL := /bin/bash

.DEFAULT_GOAL := help
.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Bootstrap the smart home docker environment
	@sh ./scripts/init.sh

start: ## Run Smart Home Containers
	@sh ./scripts/start.sh

stop: ## Stop all containers
	@docker-compose --env-file .env -f ./common.docker-compose.yml -f ./apps/homeassistant/docker-compose.yml down