{ config, pkgs, caelestia-shell, ... }:

{
  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
    caelestia-shell.packages.x86_64-linux.default
  ];

  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  xdg.portal.config = {
    common.default = [ "gtk" "kde" ];
    niri.default = [ "gtk" "niri" "kde" ];
  };
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}

