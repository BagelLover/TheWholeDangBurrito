{ config, pkgs, lib, ... }: {
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."gtk-4.0/gtk.css".source = ./gtk.css;
  xdg.configFile."gtk-3.0/gtk.css".source = ./gtk.css;
}
