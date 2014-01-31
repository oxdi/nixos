#!/bin/sh

set -e

# Switch to unstable channel
nix-channel --remove nixos
nix-channel --add http://nixos.org/channels/nixos-unstable nixos

# Update and initialize our new configuration
nixos-rebuild switch --upgrade

# Cleanup any previous generations and delete old packa
nix-collect-garbage -d

