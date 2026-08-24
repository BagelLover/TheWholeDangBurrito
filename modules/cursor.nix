{ pkgs, ... }:

{
  # 1. Install the Adwaita theme globally
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];

  # 2. Configure GTK apps system-wide to use Adwaita cursors
  environment.etc = {
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name = Adwaita
      gtk-cursor-theme-size = 24
    '';
    "xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name = Adwaita
      gtk-cursor-theme-size = 24
    '';
  };

  # 3. Set standard environment variables for Wayland/X11 compositors
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}
