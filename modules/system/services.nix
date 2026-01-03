{ config, pkgs, inputs, ... }:
{
  services = {
    udisks2.enable = true;
    flatpak.enable = true;
    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/luke";
    };
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "modesetting" ];
      libinput.enable = true;
      displayManager.gdm.enable = false;
      desktopManager.gnome.enable = false;
      xkb.layout = "us";
    };
  };
}
