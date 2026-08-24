{ config, pkgs, ... }:

{
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  environment.systemPackages = with pkgs; [
    cargo
    git gh python3
    steamcmd
    p7zip unzip
    pciutils
    ntfs3g gvfs sshfs
    pavucontrol
    espeak-ng
    alsa-utils
    piper-tts
    pulseaudio
    starship
    cheese
    gcc
    firefox
    spotdl
    ollama-cuda
    opencode
  ];
}
