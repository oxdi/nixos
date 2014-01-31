#!/bin/sh

set -e

# Update and initialize our new configuration
nix-channel --remove nixos
nix-channel --add http://nixos.org/channels/nixos-unstable nixos
nixos-rebuild switch --upgrade

# Cleanup any previous generations and delete old packa
nix-collect-garbage -d

