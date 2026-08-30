{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../shared.nix
    ./../../modules/drivers/nvidia.nix
  ];
}
