{ pkgs, lib, inputs, ... }:

let
  system = pkgs.system;
in {
  home.packages = with pkgs; [
    adw-gtk3
    gnome-text-editor
    nautilus
    amberol
    darkly
    qlementine
    nemo
    anytype
    notesnook
    electron
    zed-editor
  ];


  # Environment variables (optional)
  home.sessionVariables = {
    EDITOR = "gnome-text-editor";
    TERMINAL = "ghostty";
  };
  programs.ghostty = {
  enable = true;
  settings = {
    "config-file" = "./config-dankcolors";
  };
};

}
