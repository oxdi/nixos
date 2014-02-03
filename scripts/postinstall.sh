#!/bin/sh

set -e

# Switch to non ssl channel as there are issues with certs
# TODO: fix this propperly by including the root certs.
nix-channel --remove nixos
nix-channel --add http://nixos.org/channels/nixos-unstable nixos
nixos-rebuild switch --upgrade

# Cleanup any previous generations and delete old packa
nix-collect-garbage -d

