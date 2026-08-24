{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../shared.nix
    ./../../modules/laptop/nvidia-prime.nix
    ./../../modules/laptop/hardware.nix
  ];
}
