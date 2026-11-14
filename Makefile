.PHONY: help sync data render run format format-check lint lint-fix ci clean
.DEFAULT_GOAL := help

help: ## Show tasks
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

sync: ## Install packages (rv sync)
	rv sync

data: ## Run the data preparation script
	Rscript R/01_prepare_data.R

render: ## Render Quarto documents
	quarto render analysis

run: data render ## Prepare data and render the report

format: ## Format code (air)
	air format .

format-check: ## Check formatting (air)
	air format . --check

lint: ## Run linter (jarl)
	jarl check .

lint-fix: ## Apply linter fixes (jarl)
	jarl check . --fix

ci: format-check lint ## Run all CI checks

clean: ## Remove generated files
	rm -rf analysis/_output analysis/.quarto .quarto
