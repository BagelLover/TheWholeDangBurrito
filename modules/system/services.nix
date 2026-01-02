{ config, pkgs, inputs, ... }:
{
  services = {
    udisks2.enable = true;
    flatpak.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "modesetting" ];
      libinput.enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb.layout = "us";
    };
  };
}
