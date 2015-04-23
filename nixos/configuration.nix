{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
    ./guest.nix
  ];

  users.mutableUsers = false;
  # we always want git and vim
  environment.systemPackages = with pkgs; [ 
    vim
  ];


}
