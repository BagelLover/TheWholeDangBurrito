{ config, pkgs, ... }:

{
  imports = [
    ./../core/boot.nix
    ./../core/hardware.nix
    ./../core/environment.nix
    ./../core/locale.nix
    ./../core/networking.nix
    ./../core/niri.nix
    ./../core/security.nix
    ./../core/services.nix
    ./../core/users.nix
  ];

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
