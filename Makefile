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
