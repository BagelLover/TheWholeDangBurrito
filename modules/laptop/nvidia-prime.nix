{ config, pkgs, lib, ... }:

{
  # Required for graphical applications
  services.graphical-desktop.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    # I'd start with the proprietary kernel module for debugging
    open = false;

    modesetting.enable = true;

    powerManagement = {
      enable = true;
      finegrained = false;
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:58:0:0";
    };
  };

  services.xserver.videoDrivers = [
    "nvidia"
  ];
}
