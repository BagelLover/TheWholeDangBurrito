{ pkgs, lib, ... }:

let
  system = pkgs.system;
in {
  home.packages = with pkgs; [
    # Core utilities
    git
    neovim
    curl
    wget
    htop
    tree
    ripgrep
    fd

    # Wayland essentials
    wl-clipboard
    xwayland
    alacritty  # terminal
    
    # File manager
    spaceFM

    # Optional GUI stuff
    firefox
    mpv
    vlc

    # Optional dev tools
    nodejs
    go
  ];

  # Environment variables (optional)
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };
}

