#!/bin/sh

set -e

# Checkout our nixpkg tree
git config --global http.sslVerify false
NIXREPO=/etc/nixos
# (cd $NIXREPO && git clone http://github.com/oxdi/nixpkgs.git)

# Update and initialize our new configuration
# nixos-rebuild -I nixos=$NIXREPO/nixpkgs/nixos -I nixpkgs=$NIXREPO/nixpkgs switch
nixos-rebuild switch

# Cleanup any previous generations and delete old packages that can be
# pruned.
for x in `seq 0 2` ; do
    nix-env --delete-generations old
    nix-collect-garbage -d
done

# Zero out the disk (for better compression)
# dd if=/dev/zero of=/EMPTY bs=1M
# rm -rf /EMPTY
