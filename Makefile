# Default target
.DEFAULT_GOAL := help

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'


-include .env
export

UV_RUN_CMD=uv run --directory $(DBT_PROJECT)

.PHONY: all env env-clean env-freeze debug build run run-select test test-select clean help

all: env clean build ## Set up environment and build project

env: ## Set up environment and sync dependencies
	@uv sync --no-cache

env-clean: ## Clean environment and remove .venv
	@uv clean
	@rm -rf .venv

env-freeze: ## Freeze environment to requirements.txt
	@uv pip freeze > requirements.txt

debug: ## Run dbt debug to check the setup
	@${UV_RUN_CMD} dbt debug

build: ## Build dbt models
	@${UV_RUN_CMD} dbt build

run: ## Run dbt models
	@${UV_RUN_CMD} dbt run

run-select: ## Run selected dbt model (use MODEL=...)
	@${UV_RUN_CMD} dbt run --select "models/$(MODEL)"

test: ## Run dbt tests
	@${UV_RUN_CMD} dbt test

test-select: ## Run selected dbt test (use TEST=...)
	@${UV_RUN_CMD} dbt test --select "tests/$(TEST)"

clean: ## Clean dbt artifacts
	@${UV_RUN_CMD} dbt clean
