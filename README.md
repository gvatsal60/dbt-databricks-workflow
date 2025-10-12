# dbt-databricks-workflow

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/dbt-databricks-workflow)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gvatsal60/dbt-databricks-workflow/master.svg)](https://results.pre-commit.ci/latest/github/gvatsal60/dbt-databricks-workflow/HEAD)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/7ae60c7a6c824bfea751067f08618c0d)](https://app.codacy.com/gh/gvatsal60/dbt-databricks-workflow/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![CodeFactor](https://www.codefactor.io/repository/github/gvatsal60/dbt-databricks-workflow/badge)](https://www.codefactor.io/repository/github/gvatsal60/dbt-databricks-workflow)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/dbt-databricks-workflow)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/dbt-databricks-workflow)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/dbt-databricks-workflow)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/dbt-databricks-workflow)

## 🚀 Overview

This project provides a workflow for using [dbt](https://www.getdbt.com/) with [Databricks](https://databricks.com/). It enables analytics engineers and data teams to build, test, and deploy data transformation pipelines on Databricks using dbt's modular SQL-based approach.

## 🏗️ Features

- Seamless integration of dbt with Databricks
- Automated workflows for building and testing dbt models
- Pre-configured development environment using dev containers
- Continuous integration with pre-commit hooks and code quality checks

## 🛠️ Getting Started

### Prerequisites

- Databricks workspace and credentials
- [dbt](https://docs.getdbt.com/docs/installation) installed (or use the provided dev container)
- Python 3.10+
- `make` (should be pre-installed in the dev container)

### Setup

1) **Clone the repository:**

      ```bash
      git clone https://github.com/gvatsal60/dbt-databricks-workflow.git
      cd dbt-databricks-workflow
      ```

2) **Open in Dev Container (Recommended):**

    - Use [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) to open the workspace for a pre-configured environment.

3) **Configure dbt Connection details:**

    - Copy `.env.dev` to `.env`:

        ```bash
        cp .env.dev .env
        ```

    - Update `.env` with your Databricks connection details.

> **Note:**
> The dbt project directory in this repository is named `dbt_train`.
> If you want to use a different dbt project name, rename the `dbt_train` folder accordingly and update any references to it in your workflow or configuration files.

### Available Make Commands

- **Install dependencies:**

  ```bash
  make env
  ```

- **Build dbt models:**

  ```bash
  make build
  ```

- **Run dbt models:**

  ```bash
  make run
  ```

- **Run dbt tests:**

  ```bash
  make test
  ```

- **See all available commands:**

  ```bash
  make help
  ```

### Running dbt Commands

You can also run dbt commands directly if needed, but using `make` is recommended for consistency.

> **Important:**
> Before running any `dbt` commands, you need to import the environment variables from `.env` into your shell:
>
> ```bash
> set -a; source .env; set +a
> ```

- **Build models:**

  ```bash
  dbt build
  ```

- **Run tests:**

  ```bash
  dbt test
  ```

- **Generate docs:**

  ```bash
  dbt docs generate
  ```

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [Databricks SQL Documentation](https://docs.databricks.com/sql/)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)

## 💬 Contributing

We love contributions! If you'd like to help improve this project, please review our
[Contribution Guidelines](CONTRIBUTING.md) before submitting pull requests.

## 🛡️ License

This project is licensed under the Apache License 2.0 License -
see the [LICENSE](LICENSE)
file for details.
