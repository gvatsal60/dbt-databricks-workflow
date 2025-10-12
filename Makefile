include .env
export

UV_RUN_CMD=uv run --directory $(DBT_PROJECT)

.PHONY: all debug build run test clean

all: env clean build

env:
	@uv sync --no-cache

env-clean:
	@uv clean
	@rm -rf .venv

env-freeze:
	@uv pip freeze > requirements.txt

debug:
	@${UV_RUN_CMD} dbt debug

build:
	@${UV_RUN_CMD} dbt build

run:
	@${UV_RUN_CMD} dbt run

run-select:
	@${UV_RUN_CMD} dbt run --select "models/$(MODEL)"

test:
	@${UV_RUN_CMD} dbt test

test-select:
	@${UV_RUN_CMD} dbt test --select "tests/$(TEST)"

clean:
	@${UV_RUN_CMD} dbt clean

## Show help for each command
help:
	@echo "Available targets:"
	@echo "  all           - Set up environment and build project"
	@echo "  env           - Sync environment dependencies"
	@echo "  env-clean     - Clean environment and remove .venv"
	@echo "  env-freeze    - Freeze environment to requirements.txt"
	@echo "  debug         - Run dbt debug"
	@echo "  build         - Build dbt models"
	@echo "  run           - Run dbt models"
	@echo "  run-select    - Run selected dbt model (use MODEL=...)"
	@echo "  test          - Run dbt tests"
	@echo "  test-select   - Run selected dbt test (use TEST=...)"
	@echo "  clean         - Clean dbt artifacts"
