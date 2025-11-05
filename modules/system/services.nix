{
  services = {
    udisks2.enable = true;
    switcherooControl.enable = true;
    flatpak.enable = true;
    syncthing.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "intel" ];
      libinput.enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb.layout = "us";
    };
  };
}

