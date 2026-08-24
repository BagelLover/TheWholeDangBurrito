{ config, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  xdg.configFile."gtk-4.0/gtk.css".source = ./gtk.css;
  xdg.configFile."gtk-3.0/gtk.css".source = ./gtk.css;

  # Manage matugen configuration and templates
  xdg.configFile."matugen/config.toml".source = ./matugen/config.toml;
  xdg.configFile."matugen/templates".source = ./matugen/templates;

}
