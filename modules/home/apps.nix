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
    spicetify-cli
    winboat
        (pkgs.symlinkJoin {
      name = "spotify-scaled";
      paths = [ pkgs.spotify ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/spotify \
          --set ELECTRON_FORCE_DEVICE_SCALE_FACTOR 1.99
      '';
    })
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
