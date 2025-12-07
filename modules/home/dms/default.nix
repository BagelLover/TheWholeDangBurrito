{ config, pkgs, lib, ... }: {

  imports = [
    ./gtk.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    
  };
  xdg.configFile."matugen" = {
    source = ./matugen;
    recursive = true;
  };
 
  programs.dankMaterialShell = {
    enable = true;
    default.settings = {
      dynamicTheming = true;
      dankBarSpacing = 0;
      dankBarPosition = 1;
      dankBarSquareCorners = true;
      launcherLogoMode = "os";
    };
  };
}
