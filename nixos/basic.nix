{ config, pkgs, ... }:

#
# This file is only used for the inital install. It is a bare-bones
# system configuration with just grub and openssh.
# 
# This file should be removed by the postinstall scripts.
#

{
  imports =[ ./hardware-configuration.nix ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  # hostname
  networking.hostName = "CycleSDK";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  users.extraUsers.root.openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvZB1aB+wopcI8iOs8dnRhHOyoRwiOPYCmDrarKWyHgM9na3BdXea0lWP1ByE4eh4OIPWXiNR55uaKORgYKL82SI7emXqYzou9WF9ZJoK7e2UTPAhcvEtHlb7AaBSz5OTF3dBMu4cIIrC72bEfqW6gfmI25n1lx8/XfUMRfrEsg4qN6es1shvx9qa2IXgaHON5D+FNgJCTm9jFwjX47lQ5Xd7KNWqjRvha6B00xkRFPlnDI3aspYDUW6aeAI2wyHV16ZiP6KL+XGfqxw4EfL25PItatO38fZTXXtdwrSOsYtJBOdgmq7W+Wv/RWnTFCB6Y8dl+2bk5k+9W/Bhamuxj public@installkey" ];

  # Enable DBus
  services.dbus.enable    = true;

  # Default packages
  environment.systemPackages = with pkgs; [
    git
  ];

}
