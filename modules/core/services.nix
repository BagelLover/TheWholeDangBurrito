{ config, pkgs, ... }:

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    udisks2.enable = true;
    gvfs.enable = true;
    flatpak.enable = true;

    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" "modesetting" ];
      xkb.layout = "us";
    };
  };
  programs.nix-ld.enable = true;
}
