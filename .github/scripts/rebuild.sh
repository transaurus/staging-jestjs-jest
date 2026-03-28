#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for jestjs/jest
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Expected to be run from the website/ directory of the repo.

# --- Install dependencies with yarn ---
echo "Installing dependencies with yarn..."
yarn install --frozen-lockfile 2>/dev/null || yarn install --immutable

# --- Pre-build step: generate required backers.json ---
echo "Fetching supporters data..."
yarn fetchSupporters

# --- Build ---
echo "Building the documentation site..."
yarn run build

echo "[DONE] Build complete."
