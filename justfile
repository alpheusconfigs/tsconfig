set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

biome := "pnpm exec biome"

publish := "pnpm publish --access public"

# Default action
_:
    just --list -u

# Install
i:
    pnpm install

# Format code
fmt:
    {{biome}} check --write .

# Lint code with ls-lint
ls-lint:
    ls-lint -config ./.ls-lint.yaml

# Lint code with ls-lint
lslint: ls-lint

# Lint code with typos-cli
typos:
    typos

# Lint code
lint: lslint typos

# Check code
check: fmt lint

# Publish as dry-run
publish-try:
    cd ./package && {{publish}} --dry-run

# Publish
publish:
    cd ./package && {{publish}}

# Clean everything (Linux)
clean-all-linux:
    rm -rf ./node_modules

# Clean everything (macOS)
clean-all-macos: clean-all-linux

# Clean everything (Windows)
clean-all-windows:
    if (Test-Path "./node_modules") { Remove-Item -Recurse -Force "./node_modules" }

# Clean everything
clean-all:
    just clean-all-{{os()}}
