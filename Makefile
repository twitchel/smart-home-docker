SHELL := /bin/bash

.DEFAULT_GOAL := help
.PHONY: help init start stop appserver-start appserver-stop
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Bootstrap the smart home docker environment
	@bash ./scripts/init.sh

generate-auth-password: ## Generate password hash for use in authelia
	@bash ./scripts/generate-auth-password.sh

start: ## Run Smart Home Containers
	@bash ./scripts/start.sh

stop: ## Stop all containers
	@bash ./scripts/stop.sh

appserver-start: ## Run Appserver Smart Home Containers
	@SHD_HOST=appserver bash ./scripts/start.sh

appserver-stop: ## Stop all Appserver containers
	@SHD_HOST=appserver bash ./scripts/stop.sh