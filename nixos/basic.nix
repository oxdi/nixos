{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  # hostname
  networking.hostName = "CycleSDK";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable DBus
  services.dbus.enable    = true;

}
