
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/locale.nix
    ../../modules/system/users.nix
    ../../modules/system/hardware.nix
    ../../modules/system/hardware-laptop.nix
    #../../modules/system/power.nix
    ../../modules/system/services.nix
    ../../modules/system/displaymngr.nix
    ../../modules/system/environment.nix
  ];
  programs.niri.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
