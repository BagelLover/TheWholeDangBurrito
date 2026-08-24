{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    # Extra packages available to Steam/Proton games.
    # These help pressure-vessel find expected libraries.
    extraPackages = with pkgs; [
      mesa
      intel-media-driver
      libglvnd
      vulkan-loader
    ];
  };

  environment.systemPackages = with pkgs; [
    adwsteamgtk
  ];
}
