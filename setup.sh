#!/usr/bin/env bash
set -euo pipefail

if ! command -v rv >/dev/null 2>&1; then
  echo "rv not found. Installation: https://a2-ai.github.io/rv-docs/" >&2
  exit 1
fi

rv sync

if command -v prek >/dev/null 2>&1; then
  prek autoupdate
  prek install
elif command -v pre-commit >/dev/null 2>&1; then
  pre-commit autoupdate
  pre-commit install
else
  echo "prek/pre-commit not found, Git hooks were not installed." >&2
fi
