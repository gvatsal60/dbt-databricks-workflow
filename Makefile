include .env
export

UV_RUN_CMD=uv run --directory $(DBT_PROJECT)

.PHONY: all debug build run test clean

all: env clean build

# Set up environment and build project
env:
	@uv sync --no-cache

# Clean environment and remove .venv
env-clean:
	@uv clean
	@rm -rf .venv

# Freeze environment to requirements.txt
env-freeze:
	@uv pip freeze > requirements.txt

# Run dbt debug to check the setup
debug:
	@${UV_RUN_CMD} dbt debug

# Build dbt models
build:
	@${UV_RUN_CMD} dbt build

# Run dbt models
run:
	@${UV_RUN_CMD} dbt run

# Run selected dbt model (use MODEL=...)
run-select:
	@${UV_RUN_CMD} dbt run --select "models/$(MODEL)"

# Run dbt tests
test:
	@${UV_RUN_CMD} dbt test

# Run selected dbt test (use TEST=...)
test-select:
	@${UV_RUN_CMD} dbt test --select "tests/$(TEST)"

# Clean dbt artifacts
clean:
	@${UV_RUN_CMD} dbt clean
