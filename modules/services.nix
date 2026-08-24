{ config, pkgs, ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  virtualisation.virtualbox = {
    host = {
      enable = true;
    };
  };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    tailscale.enable = true;

    udisks2.enable = true;
    gvfs.enable = true;
    flatpak.enable = true;
  };
  security.rtkit.enable = true;
  security.pam.services = {
    login.enableGnomeKeyring = true;
  };
  security.allowUserNamespaces = true;
  services.xserver.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;
  #
  programs.nix-ld.enable = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="0955", ATTR{idProduct}=="7321", MODE="0666"
  '';
}
