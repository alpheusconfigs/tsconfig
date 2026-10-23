set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

biome := "pnpm exec biome"

tsc := "pnpm exec tsc"

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

# Lint code with Biome
lint-biome:
    {{biome}} lint .

# Run tests
test:
    pnpm -r --filter './tests/*' exec {{tsc}} -p tsconfig.json --noEmit
    pnpm -r --filter './tests/*' exec {{tsc}} -p tsconfig.lib.json --noEmit

# Check code
check: fmt lint test

# Bump package versions
ver VERSION:
    pnpm version \
        --no-git-tag-version \
        --no-commit-hooks \
        --no-git-checks \
        --allow-same-version \
        --recursive \
        {{VERSION}}

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
