{ config, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  xdg.configFile."gtk-4.0/gtk.css".source = ./gtk.css;
  xdg.configFile."gtk-3.0/gtk.css".source = ./gtk.css;

  # Manage matugen configuration and templates
  xdg.configFile."matugen/config.toml".source = ./matugen/config.toml;
  xdg.configFile."matugen/templates".source = ./matugen/templates;


  # may not be needed (the module does this by default I think, but I will leave it in for now just in case)
  systemd.user.services.dms = {
    description = "DankMaterialShell";

    wantedBy = [ "niri.service" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.dms}/bin/dms run";
      Restart = "on-failure";
    };
  };
}
