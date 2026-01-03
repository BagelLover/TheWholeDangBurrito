{ config, pkgs, inputs, ... }:

{
  programs.niri.enable = true;
  programs.dms-shell = {
    enable = true;
    
  };
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gnome
  ];
}
