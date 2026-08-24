{ config, pkgs, ... }:

{
  imports = [
    ./../modules/boot.nix
    ./../modules/locale.nix
    ./../modules/networking.nix
    ./../modules/users.nix
    ./../modules/hardware.nix
    ./../modules/services.nix
    ./../modules/environment.nix
    ./../modules/niri.nix
    ./../modules/steam.nix
  ];

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
