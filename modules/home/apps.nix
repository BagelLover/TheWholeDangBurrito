{ pkgs, lib, inputs, ... }:

let
  system = pkgs.system;
in {
  home.packages = with pkgs; [
    nautilus
    amberol
    nemo
    anytype
    notesnook
    electron
    zed-editor
    orca-slicer
    deskflow
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
