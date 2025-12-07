{
  lib,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    gtk2.enable = false;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme.override {
       
      };
    };
  };
  # GTK overrides
  xdg.configFile."gtk-3.0/gtk.css".source = ./gtk.css;
  xdg.configFile."gtk-4.0/gtk.css".source = ./gtk.css;
 # xdg.configFile = {
 #   "gtk-4.0/gtk.css".enable = lib.mkForce false;
 #   "gtk-3.0/gtk.css".enable = lib.mkForce false;
 #   "gtk-4.0/settings.ini".enable = lib.mkForce false;
 #   "gtk-3.0/settings.ini".enable = lib.mkForce false;
 # };

}
