{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../shared.nix
    ./../../modules/desktop/hardware.nix
    ./../../modules/cursor.nix
    ./../../modules/obs.nix
  ];
}
