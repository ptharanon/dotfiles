#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ln -sfn "$DIR" ~/.dotfiles
# sudo resets PATH to a secure default that excludes /run/current-system/sw/bin,
# so a bare `darwin-rebuild` isn't found under sudo even though it's on PATH here.
# Resolve the absolute path first and invoke that instead.
DARWIN_REBUILD="$(command -v darwin-rebuild)"
exec sudo "$DARWIN_REBUILD" switch --flake ~/.dotfiles#mac
