{
  services = {
    udisks2.enable = true;
    switcherooControl.enable = true;
    flatpak.enable = true;
    syncthing.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "modesetting" ];
      libinput.enable = true;
      displayManager.gdm.enable = false;
      desktopManager.gnome.enable = true;
      xkb.layout = "us";
    };
  };
  programs.steam.enable = true;
  virtualisation.docker.enable = true;
}
