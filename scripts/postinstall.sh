#!/bin/sh

set -e

# rebuild (which should now use our nixpkgs)
nix-channel --remove nixos
nix-channel --add http://nixos.org/channels/nixos-unstable nixos
nixos-rebuild switch --upgrade

# Cleanup any previous generations and delete old packa
nix-collect-garbage -d

