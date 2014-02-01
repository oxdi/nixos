{ config, pkgs, ... }:

#
# This file should only be a list of imports managed by whichever provisioner
# is building the environment.
#
# You should not be editing this by hand.
#

{
  imports = [ 
    ./hardware-configuration.nix 
    ./guest.nix
    ./vagrant.nix
  ];

  # we want our nixpkgs repo to take priority
  environment.shellInit = ''
    export NIX_PATH='nixpkgs=/etc/nixos/nixpkgs:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels/nixos'
  '';

  environment.systemPackages = with pkgs; [ 
    git
  ];

}
