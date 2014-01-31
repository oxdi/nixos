#!/bin/sh

set -e

# Update and initialize our new configuration
nixos-rebuild switch --upgrade

# Cleanup any previous generations and delete old packa
nix-collect-garbage -d

