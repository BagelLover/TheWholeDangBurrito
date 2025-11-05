{ config, pkgs, caelestia-shell, ... }:

{
  programs.niri.enable = true;
  xdg.portal.enable = true;
  xdg.portal.xdgOpenUsePortal = true;
  xdg.portal.config = {
    common.default = [ "gtk" "kde" ];
    niri.default = [ "gtk" "niri" "kde" ];
  };
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}

