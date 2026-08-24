{ config, pkgs, ... }:

{

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # X server for XWayland support
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" "modesetting" ];
    xkb.layout = "us";
  };

  services.hardware.openrgb.enable = true;

  # Desktop-specific environment: specify DRM device
  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card1";
  };
}
