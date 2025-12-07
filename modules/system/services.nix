{
  services = {
    udisks2.enable = true;
    switcherooControl.enable = true;
    flatpak.enable = true;
    syncthing.enable = true;
    ollama = {
      enable = true;
      loadModels = ["gemma3:4b"];
    };

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "intel" ];
      libinput.enable = true;
      displayManager.gdm.enable = false;
      desktopManager.gnome.enable = true;
      xkb.layout = "us";
    };
  };
  programs.steam.enable = true;
}
