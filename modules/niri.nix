{ pkgs, ... }:

{
  # Enable niri
  programs.niri.enable = true;

  # Enable DankSearch (fast filesystem search service)
  programs.dsearch.enable = true;

  # Enable DankMaterialShell via nixpkgs module
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };

  # Enable polkit for authentication
  security.polkit.enable = true;

  # Enable upower for battery status
  services.upower.enable = true;

  # DMS greeter configuration
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/luke";
  };

  # System packages for niri environment
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    xdg-desktop-portal-gtk
    adwaita-icon-theme
    gnome-themes-extra
    qt6Packages.qt6ct
    gparted
    seahorse
    lxqt.lxqt-policykit
    vimix-cursors
    libxcursor
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    hyfetch
    woeusb-ng
    heroic
  ];

  # XDG portal configuration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # Qt theming
  qt = {
    enable = true;
  };
}
